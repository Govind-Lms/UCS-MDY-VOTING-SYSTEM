import 'package:cached_network_image/cached_network_image.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vote_app/constants/style.dart';
import 'package:vote_app/screens/vote_screen.dart';
import '../models/candidate_model.dart';
import '../widgets/custom_appBar.dart';
import 'CandidateList.dart';
class ContestantsScreen extends StatefulWidget {
  final String title;
  final String image;
  const ContestantsScreen({required this.title, required this.image,});

  @override
  State<ContestantsScreen> createState() => _ContestantsScreenState();
}

class _ContestantsScreenState extends State<ContestantsScreen> {
  late PageController _titlePageController;
  late List<CandidateModel> candidateLists;
  late int index = 0;



  Stream fKings= FirebaseFirestore.instance.collection('candidates').doc('Kings').collection('Fresher').snapshots();
  Stream fQueens= FirebaseFirestore.instance.collection('candidates').doc('Queens').collection('Fresher').snapshots();
  Stream wKings= FirebaseFirestore.instance.collection('candidates').doc('Kings').collection('Whole').snapshots();
  Stream wQueens= FirebaseFirestore.instance.collection('candidates').doc('Queens').collection('Whole').snapshots();
  CollectionReference qfKings= FirebaseFirestore.instance.collection('candidates').doc('Kings').collection('Fresher');
  CollectionReference qfQueens= FirebaseFirestore.instance.collection('candidates').doc('Queens').collection('Fresher');
  CollectionReference qwKings= FirebaseFirestore.instance.collection('candidates').doc('Kings').collection('Whole');
  CollectionReference qwQueens= FirebaseFirestore.instance.collection('candidates').doc('Queens').collection('Whole');

  @override
  void initState() { 
    super.initState();
    _titlePageController = PageController();
    fetchAllUsers().then((List<CandidateModel>list) {
      candidateLists = list;
      // return candidateLists;
      setState(() {
        candidateLists = list;
      });
      return candidateLists;
    });
  }

   @override
  void dispose() {
    _titlePageController.dispose();
    super.dispose();
  }

  Future<List<CandidateModel>> fetchAllUsers() async {
    QuerySnapshot querySnapshot = await getQuery().get();
    final userList = querySnapshot.docs.map(
      (doc) => CandidateModel(
        age: doc['age'],
        name: doc['name'],
        no: doc['no'],
        year: doc['year'],
        image: doc['image'], 
      )
    ).toList();
    return userList;
  }
  
  getQuery(){
    switch(widget.title){
      case 'Fresher Kings':return qfKings;
      case 'Fresher Queens':return qfQueens;
      case 'Whole Kings' :return qwKings;
      case 'Whole Queens' :return qwQueens;
    }
  }
  getData() {
    switch(widget.title){
      case 'Fresher Kings':return fKings;
      case 'Fresher Queens':return fQueens;
      case 'Whole Kings' :return wKings;
      case 'Whole Queens' :return wQueens;
    }
  }
  
  @override
  Widget build(BuildContext context) {

    double cardWidth= MediaQuery.of(context).size.width;
    double imageHeight= MediaQuery.of(context).size.height * .5;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Object>>(
        stream: getData(),
        builder: (context, snapshot) {
          
          if(snapshot.hasError || snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: UIColor.primaryColor,));
          }
          
          if(snapshot.hasData){
            return  Column(
              children: [
                CustomAppBar(title: '${widget.title}',image: widget.image,),
                Expanded(child: ListView.builder(
                  itemCount: candidateLists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async{
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> 
                          VoteScreen(
                            title: widget.title,
                            name: '${candidateLists[index].name}',
                            age: '${candidateLists[index].age}',
                            image: '${candidateLists[index].image}',
                            no: '${candidateLists[index].no}',
                            year: '${candidateLists[index].year}',
                          ))
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(20.0),
                        child: ClayContainer(
                          borderRadius: 10.0,
                          color: UIColor.clayColor,
                      
                          child: Column(
                            children: [
                              Hero(
                                tag: '${candidateLists[index].image}+image',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: CachedNetworkImage(
                                    width: cardWidth,
                                    height: imageHeight,
                                    imageUrl: '${candidateLists[index].image}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Container(
                                // color: Colors.grey.shade300,
                                width: cardWidth,
                                height: MediaQuery.of(context).size.height * .17,
                                child: CandidateTitle(
                                  name: '${candidateLists[index].name}',
                                  age: '${candidateLists[index].age}',
                                  link: '${candidateLists[index].name}',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),)  
              ],
            );
          }
          else{
            return Container(
              child: Center(child: Text('loading')),
            );
          }
        },
        
      ),
    );
  }
}