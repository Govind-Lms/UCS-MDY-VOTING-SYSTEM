import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vote_app/constants/style.dart';
//import 'package:vote_app/screens/votecount.dart';
import 'package:vote_app/widgets/custom_appBar.dart';

class VoteScreen extends StatefulWidget {
  final String name;
  final String image;
  final String no;
  final String year;
  final String age;
  final String title;

  const VoteScreen({required this.title, required this.name, required this.image, required this.no, required this.year, required this.age,});

  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {

  late String title = widget.title;
  late String kingOrQueen;
  late String fresherOrWhole;
  late String inputCode;
  late QuerySnapshot total;
  late int votesTotal;

  late CollectionReference voteRef;

  List voteCodeLists = [
    '8642993934',
    '2988642282',
    '9493166025',
    '5162585571',
    '3278334614',
    '5985775069',
    '1254639677',
    '6678379752',
    '7718484295',
    '8159764299',
    '6804977445',
    '9633779362',
    '8253443371',
    '5257301420',
    '4946602208',
    '2117385455',
    '7324662614',
    '9078328238',
    '2383825803',
    '4524304609',
    '8528758582',
    '5836814149',
    '8563343003',
    '9081293363',
    '9811229341',
    '7623510637',
    '3810450868',
    '1003747979',
    '1348294375',
    '7738803047',
    '9368560019',
    '2955057405',
    '2080599230',
    '7810741191',
    '2535538992',
    '6255513590',
    '7226420488',
    '1766912555',
    '3290782837',
    '2731487955',
    '6916251517',
    '9664755768',
    '3039030359',
    '5341753512',
    '4262782437',
    '8009420729',
    '6622929852',
    '4454887746',
    '7901004017',
    '4339964591',
    '7124669879',
    '2913946655',
    '4787536639',
    '6695750621',
    '8055084210',
    '6535928818',
    '3569433017',
    '2425514186',
    '3430727179',
    '6459491711',
    '5358414319',
    '2838964619',
    '5358159492',
    '4911995475',
    '1861940504',
    '1463933533',
    '4091854523',
    '7445870012',
    '5039292038',
    '1971206657',
    '4663137312',
    '7495552830',
    '3067849371',
    '9703604642',
    '1306201589',
    '4669589968',
    '4598770173',
    '7806088176',
    '4355254905',
    '9031668540',
    '2389706708',
    '3520022175',
    '9553665062',
    '4499025848',
    '1789966085',
    '1280941333',
    '1604177066',
    '7574991986',
    '8257284443',
    '6750254889',
    '1922606711',
    '9772016277',
    '4297080948',
    '5339646965',
    '9340156475',
    '6308829428',
    '8016337012',
    '8269053469',
    '3809434378',
    '6742348085',
    '8718597943',
    '7057425450',
    '5943434978',
    '2460608246',
    '4096564065',
    '9473503192',
    '3107419640',
    '2188647209',
    '3944663794',
    '7839545200',
    '1693170447',
    '9498545107',
    '2948766562',
    '9474144797',
    '7968209087',
    '7928201117',
    '2144078947',
    '1831064919',
    '8971943975',
    '4435963031',
    '6234340006',
    '3108998019',
    '7871874323',
    '1391787067',
    '2578908472',
    '6502640126',
    '6772672952',
    '8234625634',
    '7893414449',
    '9771694357',
    '1170005058',
    '8780935517',
    '6069996445',
    '9718544485',
    '5474820808',
    '6844143341',
    '8596085615',
    '6650363295',
    '3426793746',
    '6073068949',
    '9048196862',
    '2202372016',
    '3449967502',
    '3550975962',
    '1874498107',
    '9749529351',
    '4875340591',
    '8269687886',
    '1411947906',
    '2753763530',
    '8461336124',
    '2405804213',
    '6015915906',
    '2267851279',
    '9572828409',
    '9376633062',
    '2502450075',
    '2466846867',
    '3773681789',
    '3405553253',
    '9514284881',
    '3224920206',
    '9789994274',
    '8919190198',
    '1471255233',
    '3625551584',
    '9706659686',
    '3708272434',
    '1208802581',
    '8089352890',
    '3244213555',
    '5317053236',
    '4950095723',
    '2291648952',
    '8217149299',
    '4595316988',
    '1356502979',
    '7300237612',
    '6159691355',
    '6522750377',
    '6696064090',
    '7507590749',
    '7511891728',
    '1237012402',
    '7128252305',
    '9179845332',
    '4751320815',
    '1736848789',
    '3326084054',
    '3614765009',
    '8787874223',
    '4890341977',
    '8433918871',
    '6916278537',
    '1859158544',
    '5304676508',
    '1143383524',
    '4487048483',
    '1632531777',
    '2630582683',
    '4825638086',
    '5525754664',
    '4947159314',
    '8643535091',
    '5833834445',
    '2135502642',
    '5033319031',
    '9446476669',
    '8912625576',
    '9260773439',
    '6617018337',
    '4577101526',
    '2678411216',
    '9976908391',
    '5000518083',
    '2002053335',
    '7373502847',
    '3642094124',
    '7995782107',
    '7297500719',
    '4382354785',
    '1488552522',
    '4918219731',
    '1752206406',
    '3703197342',
    '4078395446',
    '5654377943',
    '8790241169',
    '4516180540',
    '3476505261',
    '8983609447',
    '4428731205',
    '9030683511',
    '7682977916',
    '2350145015',
    '2442056847',
    '9786683189',
    '5005257339',
    '4596594846',
    '2355616213',
    '3530893953',
    '4404535886',
    '3740370568',
    '1681600314',
    '1602053273',
    '7056220416',
    '5379869554',
    '3460447560',
    '1012583492',
    '7831493885',
    '8282916184',
    '2480471073',
    '5299357258',
    '5815474276',
    '7542343381',
    '7147550710',
    '2853686172',
    '6956368492',
    '7167656213',
    '2012817058',
    '7305866556',
    '5980780042',
    '9524286881',
    '6016083410',
    '7202505768',
    '7797536891',
    '6149022083',
    '1047870966',
    '6340755296',
    '9091940341',
    '5293798721',
    '9604684939',
    '3769338746',
    '2542899862',
    '7227241502',
    '3645147808',
    '1691344586',
    '1878048385',
    '2272011155',
    '5672340082',
    '7568149625',
    '3179209102',
    '2374801245',
    '9149298828',
    '5017819402',
    '4305023062',
    '9770856109',
    '5991361098',
    '6358751304',
    '7390756838',
    '1259692477',
    '3127152486',
    '2254428907',
    '4738984353',
    '6098141112',
    '7544268666',
    '9336205338',
    '1012192894',
    '3700859797',
    '1263101606',
  ];

  check(){
    if(title=='Fresher Kings'){
      setState(() {
        kingOrQueen = 'Kings';
        fresherOrWhole = 'Fresher';
      });
    }
    else if(title == 'Fresher Queens'){
      setState(() {
        fresherOrWhole = 'Fresher';
        kingOrQueen= 'Queens';
      });
    }
    else if(title == 'Whole Queens'){
      setState(() {
        fresherOrWhole = 'Whole';
        kingOrQueen= 'Queens';
      });
    }
    else if(title == 'Whole Kings'){
      setState(() {
        fresherOrWhole = 'Whole';
        kingOrQueen= 'Kings';
      });
    }
    else{
      setState(() {
        fresherOrWhole= '';
        kingOrQueen= '';
      });
    }
  }

  add()async{
    total = await FirebaseFirestore.instance.collection('candidates').doc(kingOrQueen).collection(fresherOrWhole).doc(widget.no).collection('votes').get();
    var totalVotes = total.docs.length;
    setState(() {
      votesTotal = totalVotes;
    });
    
    for(String voteCode in voteCodeLists){
      FirebaseFirestore.instance
        .collection('votes')
        .doc(kingOrQueen)
        .collection(fresherOrWhole)
        .doc(voteCode).set({'code ': voteCode});
    }
  }

  
  @override
  void initState() {
    super.initState();
    check();
    /*add votes to the firebase*/
    // add();
    print(fresherOrWhole);
    print(kingOrQueen);
    print(title);
    print(widget.name);
    print(widget.no);
    print(widget.year);  
  }

  showAlertBox(){
    return showModalBottomSheet(
      context: context,
      backgroundColor: UIColor.clayColor,
      elevation: 1.0,
      enableDrag: true,
      isDismissible: true,
      builder: (context){
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0)
            )
          ),
          margin: EdgeInsets.all(30.0),
          height: MediaQuery.of(context).size.height/3,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(Icons.heart_broken,size: 100.0,color: Colors.red,),
                    SizedBox(height: 20.0,),
                    Text('Your Code is not Valid Anymore <3',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Colors.black,),),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          color: UIColor.primaryColor,
                          child: Text('Vote Someone Either',style: TextStyle(color: Colors.white),),
                          onPressed: (){
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]
          ),
        );
      },
      
    );
  }

  showCustomSuccessBox(){
    return Dialog(

      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(30.0)),
      child: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlutterLogo(size: 150,),
            Text("This is a Custom Dialog",style:TextStyle(fontSize: 20),),
            ElevatedButton(

            onPressed: (){
            Navigator.of(context).pop();
              }, child: Text("Close"))
          ],
        ),
      ),
    );
  }
  
  showSuccessBox(){
    return showAboutDialog(
      context: context,
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.0,),
              Text('Congrats; You Have Voted the Person',style: TextStyle   (fontWeight:           FontWeight.bold, fontSize: 18.0,color: Colors.black,),),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text('Vote Other Section'),
                    onPressed: (){
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              )
            ],
          ),
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {

   return Scaffold(
      backgroundColor: UIColor.clayColor,
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height *.7 + 40,
              child: Stack(
                children: [
                  Positioned(
                    child: Hero(
                      tag: '${widget.image}+image',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .7 ,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(top: 10.0,left: 10.0,child: BackAppBar(title: '',image: '',)),
                  Positioned(
                    bottom: 0.0,
                    right: MediaQuery.of(context).size.width/2 -50,                    
                    child: GestureDetector(
                      onTap: () async{
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context){
                            return AlertDialog(
                              actions: [
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Enter Your Code'.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                                    const SizedBox(height: 10.0,),
                                    Container(
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: UIColor.clayColor
                                      ),
                                      margin: const EdgeInsets.all(20.0),
                                      child: Center(
                                        child: TextFormField(
                                          onChanged: ((code){
                                            inputCode = code;
                                            setState(() {
                                              inputCode = code;
                                            });
                                          }),
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration.collapsed(hintText: '  Eg: 12345678'),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        RaisedButton(
                                          onPressed: () async{
                                            final fetchCodeRef = FirebaseFirestore.instance.collection("votes").doc(kingOrQueen).collection(fresherOrWhole);
                                            final fetchVoteDoc = await fetchCodeRef.where(FieldPath.documentId, isEqualTo: inputCode).get();
                                            
                                            print(fetchVoteDoc.docs.length);

                                            //1208802581
                                            if(fetchVoteDoc.docs.length == 0){
                                              print("error inputcode ="+inputCode);
                                              Navigator.of(context).pop(true);
                                              // ignore: void_checks
                                              //1003747979
                                              return showAlertBox();
                                            }
                                            
                                            for(var i in fetchVoteDoc.docs){
                                              if(inputCode == i.id){
                                                print(true);
                                                print(i.id);
                                                FirebaseFirestore.instance
                                                  .collection('candidates')
                                                  .doc(kingOrQueen)
                                                  .collection(fresherOrWhole)
                                                  .doc(widget.no)
                                                  .collection('votes')
                                                  .doc(i.id).set({'code': i.id});
                                                FirebaseFirestore.instance
                                                  .collection('votes')
                                                  .doc(kingOrQueen)
                                                  .collection(fresherOrWhole)
                                                  .doc(i.id)
                                                  .delete();
                                                  Navigator.of(context).pop(true);
                                                // ignore: void_checks
                                                return showSuccessBox();
                                              }                                             
                                            }
                                          
                                          },
                                          child: const Text('Vote',style: TextStyle(color: Colors.white),),color: UIColor.primaryColor,
                                        ),
                                        
                                        const SizedBox(width: 10.0,),
                                        RaisedButton(
                                          onPressed: (){
                                            Navigator.of(context).pop(true);
                                          },
                                          child: const Text('Cancel'),
                                        ),

                                        /* check votes of each candidates */
                                        // RaisedButton(
                                        //   onPressed: (){
                                        //     Navigator.of(context).push(MaterialPageRoute(builder: (_)=> VoteCount(kingOrQueen: kingOrQueen, fresherOrWhole: fresherOrWhole, no: widget.no)));
                                        //   },
                                        //   child: const Text('CheckVote'),
                                        // ),


                                      ],
                                    )
                                  ],
                                ),
                              ),]  
                            );
                          },
                        );                
                      },
                          
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: UIColor.clayColor,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(3,3),
                              color: Colors.black,
                              blurRadius: 6.0,
                            )
                          ]
                        ),
                        child:Icon(Icons.favorite,size: 30.0,color: UIColor.primaryColor,),
                            
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(widget.name.toUpperCase(),style: UIStyle.votetextStyle,),
                 Text(' , ${widget.age}',style: UIStyle.votetextStyle,),

              ],
            ),
            SizedBox(height: 20.0,),
            Text('${widget.year}',style: UIStyle.voteGreyStyle,),
            // Text(votesTotal.toString())
          ],
        )
      ],),
    );
  }
}
