
// ignore_for_file: deprecated_member_use

import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:vote_app/constants/style.dart';
import 'package:vote_app/screens/CandidateList.dart';
import 'package:vote_app/screens/homePage.dart';
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

  List voteCodeLists = [
    '26406518',
    '51600507',
    '14717229',
    '28576751',
    '69760713',
    '69943195',
    '38109655',
    '40536694',
    '45894926',
    '97539454',
    '43791004',
    '43649278',
    '68120487',
    '49642702',
    '55682884',
    '11617448',
    '26380563',
    '29167612',
    '36672571',
    '66189107',
    '84475046',
    '99543267',
    '72637387',
    '55818374',
    '65991511',
    '38203318',
    '28730855',
    '54422743',
    '95826327',
    '45593678',
    '55175969',
    '99878639',
    '92431610',
    '62131806',
    '73730204',
    '15726486',
    '36510898',
    '96341269',
    '29020943',
    '29784983',
    '13125080',
    '57315240',
    '84538548',
    '80942272',
    '11759916',
    '79367686',
    '92668745',
    '58815941',
    '33113086',
    '25464603',
    '40661600',
    '81031517',
    '21411991',
    '72818799',
    '21210031',
    '71085232',
    '91404060',
    '13385432',
    '22594958',
    '78798400',
    '16270562',
    '44663753',
    '96042922',
    '88688544',
    '17113656',
    '92065259',
    '48002157',
    '29605308',
    '16802253',
    '82032648',
    '49327396',
    '20392227',
    '96866435',
    '62214889',
    '97506723',
    '40226297',
    '99664285',
    '61743727',
    '43918786',
    '14015919',
    '68103769',
    '97965820',
    '13333832',
    '76130512',
    '43209019',
    '26476128',
    '20062721',
    '83632394',
    '46828804',
    '41637336',
    '70806115',
    '57846775',
    '97575790',
    '53401656',
    '12822076',
    '52580458',
    '88450661',
    '16941939',
    '93710075',
    '27055688',
    '54127010',
    '25775800',
    '93848276',
    '57682583',
    '46901945',
    '79363795',
    '89934186',
    '37803380',
    '77905233',
    '73314754',
    '58077547',
    '84315518',
    '13831938',
    '29424652',
    '41126098',
    '73475821',
    '93232682',
    '50144080',
    '45012508',
    '27775324',
    '83638770',
    '34629717',
    '98473087',
    '35713605',
    '99742778',
    '86862071',
    '33519545',
    '60956305',
    '56131890',
    '62978658',
    '88954277',
    '39630120',
    '24408218',
    '29994256',
    '29295310',
    '16590101',
    '75420061',
    '20475505',
    '28311358',
    '18335267',
    '52515321',
    '58480038',
    '15111165',
    '54081767',
    '88900885',
    '62148172',
    '61508410',
    '98179116',
    '60871535',
    '72086033',
    '52025929',
    '77741917',
    '64798860',
    '69960774',
    '50364422',
    '22906125',
    '95152961',
    '86004116',
    '57350384',
    '45383646',
    '42128922',
    '38936935',
    '38685884',
    '96887469',
    '62368909',
    '36213577',
    '87921082',
    '73778988',
    '24155122',
    '22670204',
    '89049568',
    '51499136',
    '43475000',
    '91776820',
    '95826023',
    '88772485',
    '14524706',
    '96607471',
    '28911787',
    '80805893',
    '42675116',
    '88220394',
    '21652922',
    '71184781',
    '51805032',
    '60017785',
    '17558129',
    '23832257',
    '23026548',
    '71139517',
    '36012902',
    '30538948',
    '49006438',
    '78827390',
    '48177497',
    '83810724',
    '44902531',
    '67026466',
    '37697178',
    '79199971',
    '86799517',
    '96548026',
    '91655236',
    '72244395',
    '37676785',
    '92824263',
    '28495959',
    '23581196',
    '87708142',
    '48982392',
    '71615878',
    '94438077',
    '64025955',
    '88822044',
    '27195980',
    '75329023',
    '88649586',
    '28506899',
    '25512977',
    '39463236',
    '38652924',
    '79305876',
    '67738110',
    '36122993',
    '50338119',
    '86374855',
    '41856578',
    '84026616',
    '51926303',
    '51514522',
    '70190373',
    '67502333',
    '61762758',
    '31434960',
    '56012439',
    '32725314',
    '66019302',
    '18495789',
    '32817428',
    '51560366',
    '86238948',
    '83702118',
    '78519546',
    '53132629',
    '86318438',
    '18066264',
    '50943311',
    '66541864',
    '77676684',
    '86280801',
    '18730792',
    '45392034',
    '47325184',
    '75937224',
    '69747455',
    '33381042',
    '86905185',
    '92582179',
    '33639377',
    '87594967',
    '10223134',
    '43966523',
    '94035173',
    '75200031',
    '20196395',
    '60197635',
    '81756073',
    '85610016',
    '52707004',
    '94870527',
    '32710995',
    '99699514',
    '36216125',
    '77190837',
    '22014731',
    '67281640',
    '96725661',
    '59699289',
    '29498533',
    '22551672',
    '65559865',
    '81178882',
    '68626852',
    '42594293',
    '69850942',
    '82170644',
    '22930052',
    '71943231',
    '25802298',
    '56282445',
    '26001540',
    '98786399',
    '68491099',
    '95825473',
    '57149328',
    '79578692',
    '56849553',
    '84442209',
    '53673553',
    '99514866',
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
    add();
    print(fresherOrWhole);
    print(kingOrQueen);
    print(title);
    print(widget.name);
    print(widget.no);
    print(widget.year);
  }

  
  showAlertBox(){
    return showDialog(
      barrierDismissible: false,

      builder: (context){
        return Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0,),
                  Text('Your Code is not Valid Anymore <3',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Colors.black,),),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        child: Text('Vote Someone Either'),
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
      },
      context: context,
      
    );
  }

  Dialog showCustomSuccessBox(){
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
  
  void showSuccessBox(){
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
                        child: IconButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                              .collection('votes')
                              .doc(kingOrQueen)
                              .collection(fresherOrWhole)
                              .get().then((QuerySnapshot votes) {
                                var demoCodes = votes;
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,

                                  builder: (BuildContext context){
                                    return AlertDialog(

                                      actions: [
                                      Container(
                                        margin: EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Enter Your Code'.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                                            SizedBox(height: 10.0,),
                                            Container(
                                              height: 30.0,
                                              
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                color: UIColor.clayColor
                                              ),
                                              margin: EdgeInsets.all(20.0),
                                              child: Center(
                                                child: TextFormField(
                                                  onChanged: ((code){
                                                    inputCode = code;
                                                  }),
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration.collapsed(hintText: 'Eg: 12345678'),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                RaisedButton(
                                                  onPressed: ()async{

                                                    for( var code in demoCodes.docs ){
                                                      if(inputCode != code.id){
                                                        print("error code ="+inputCode);
                                                        Navigator.of(context).pop(true);
                                                        return showAlertBox();
                                                      }
                                                      else if( inputCode == code.id){
                                                        FirebaseFirestore.instance
                                                          .collection('votes')
                                                          .doc(kingOrQueen)
                                                          .collection(fresherOrWhole)
                                                          .doc(code.id)
                                                          .delete();
                                                          Navigator.of(context).pop(true);
                                                        FirebaseFirestore.instance
                                                          .collection('candidates')
                                                          .doc(kingOrQueen)
                                                          .collection(fresherOrWhole)
                                                          .doc(widget.no)
                                                          .collection('votes')
                                                          .doc(code.id).set({'code': code.id});
                                                        
                                                        return showSuccessBox();
                                                      }
                                                            
                                                    }
                                                            
                                                },
                                                  child: Text('Vote'),color: UIColor.primaryColor,
                                                ),
                                                
                                                SizedBox(width: 10.0,),
                                                RaisedButton(
                                                  onPressed: (){
                                                    Navigator.of(context).pop(true);
                                                  },
                                                  child: Text('Cancel'),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),]  
                                    );
                                  },
                                );
                              //  Dialogs.materialDialog(
                              //     msg: 'Vote Your Fav Contestants',
                              //       lottieBuilder: Lottie.asset(
                              //         'assets/cong_example.json',
                              //         fit: BoxFit.contain,
                              //       ),
                              //     context: context,
                              //     dialogWidth: kIsWeb ? 0.3 : null,

                              //     actions: [
                              //       Column(
                              //         mainAxisAlignment: MainAxisAlignment.center,
                              //         crossAxisAlignment: CrossAxisAlignment.center,
                              //         children: [
                              //           Text('Type Ur Code'.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                              //         SizedBox(height: 10.0,),
                              //         Container(
                              //           margin: EdgeInsets.all(20.0),
                              //           child: TextFormField(
                              //             onChanged: ((code){
                              //               inputCode = code;
                              //             }),
                              //             keyboardType: TextInputType.number,
                              //             decoration: InputDecoration.collapsed(hintText: '12345678'),
                              //           ),
                              //         ),
                              //         ],
                              //       ),
                              //       IconsOutlineButton(
                              //         onPressed: ()async{          
                              //           for( var code in demoCodes.docs ){
                              //             if(inputCode != code.id){
                              //               print("error code ="+inputCode);
                              //               Navigator.of(context).pop(true);
                              //               return showAlertBox();
                              //             }
                              //             else if( inputCode == code.id){
                              //               FirebaseFirestore.instance
                              //                 .collection('candidates')
                              //                 .doc(kingOrQueen)
                              //                 .collection(fresherOrWhole)
                              //                 .doc(widget.no)
                              //                 .collection('votes')
                              //                 .doc(code.id).set({'code': code.id});
                              //               FirebaseFirestore.instance
                              //                 .collection('votes')
                              //                 .doc(kingOrQueen)
                              //                 .collection(fresherOrWhole)
                              //                 .doc(code.id)
                              //                 .delete();
                              //                 Navigator.of(context).pop(true);
                              //               return showSuccessBox();
                              //             }
                                                
                              //           }
                                                
                              //       },
                              //         text: 'Vote',
                              //         iconData: Icons.cancel_outlined,
                              //         textStyle: TextStyle(color: Colors.grey),
                              //         iconColor: Colors.green,
                              //       ),
                              //       IconsButton(
                              //         onPressed: () {},
                              //         text: 'Cancel',
                              //         iconData: Icons.delete,
                              //         color: Colors.red,
                              //         textStyle: TextStyle(color: Colors.white),
                              //         iconColor: Colors.white,
                              //       ),
                              //     ],
                              //  );
                              });
                            },
                          
                          color: UIColor.primaryColor,
                          icon: Icon(Icons.favorite,size: 30.0),
                        ),
                            
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
          ],
        )
      ],),
    );
  }
}
