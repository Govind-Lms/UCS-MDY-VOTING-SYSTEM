import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vote_app/constants/style.dart';
import 'package:vote_app/screens/CandidateList.dart';
import 'package:vote_app/screens/contestants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColor.clayColor,
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .2,
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text('UCS-MDY',style: UIStyle.ucsMdyStyle,),
            SizedBox(height: 5.0,),
            Text('Fresher Welcome'.toUpperCase(),style: UIStyle.fresherWelcomeStyle,),
          ],),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Candidate(name: 'Fresher Kings',image: 'assets/images/fresherKing.png',),
            
            Candidate(name: 'Fresher Queens',image: 'assets/images/fresherQueen.png',),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Candidate(name: 'Whole Kings',image: 'assets/images/wholeKing.png',),
      
            Candidate(name: 'Whole Queens',image: 'assets/images/wholeQueen.png'),
          ],
        ),
        Spacer(),
        Container(
          width: MediaQuery.of(context).size.width-30,
          margin: EdgeInsets.all(10.0),
          child: ClayContainer(
            width: MediaQuery.of(context).size.width-50,
            borderRadius: 10.0,
            color: UIColor.clayColor,
            height: 150.0,
            child: Carousel(
              autoplay: true,
              autoplayDuration: Duration(seconds: 3),
              images: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage('assets/images/bg.jpg'),fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage('assets/images/bg.jpg'),fit: BoxFit.cover,
                  ),
                ),
      
              ],
              borderRadius: true,
              showIndicator: false,
            )
          ),
        ),
        SizedBox(
          height: 10.0,
        )
      ],),
    );
  }
}

class Candidate extends StatelessWidget {
  final String name;
  final String image;

  const Candidate({required this.name, required this.image, });
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ContestantsScreen(title: name, image: image,)));
      },
      child: Hero(
        tag: '$image+image',
        child: Container(

          child: Center(
            child: Column(
              children: [
                ClayContainer(
                  color: UIColor.clayColor,
                  height: 125,
                  width: 125,
                  borderRadius: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ignore: unnecessary_null_comparison
                      image != null ? Container(
                          width: 115.0,
                          height: 115.0,
                          child: Image(image: AssetImage(image),)
                      ) :
                      Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: UIColor.primaryColor,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                    
                Text(name.toUpperCase(),style: UIStyle.candidateStyle,),
                    
                SizedBox(height: 10.0,),
                // ClayText(name.toUpperCase(),style: UIStyle.candidateStyle,color: Colors.grey, emboss: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}