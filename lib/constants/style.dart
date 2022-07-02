import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class UIColor{
  static const Color primaryColor = Color(0xff656CF5);
  // static const Color clayColor = Color(0xffe3f2f8);
  static const Color clayColor = Color(0xffECF0F3);


  static const Color blackColor = Color(0xff000000);}

class UIStyle{
  static const TextStyle ucsMdyStyle = TextStyle(
    fontFamily: 'Brush Script',
    fontSize: 20.0,
    color: UIColor.blackColor,
  );
  static const TextStyle fresherWelcomeStyle = TextStyle(
    fontFamily: 'Phosphate',
    fontSize: 28.0,
    color: UIColor.blackColor,
  );
  static const TextStyle candidateStyle = TextStyle(
    fontFamily: 'DIN Condensed',
    fontSize: 18.0,
    color: UIColor.blackColor,
  );
  static const TextStyle votetextStyle = TextStyle(
    fontFamily: 'DIN Condensed',
    fontSize: 30.0,
    wordSpacing: 1.5,
    color: UIColor.blackColor,
  );
  static const TextStyle voteGreyStyle = TextStyle(
    fontFamily: 'DIN Condensed',
    fontSize: 25.0,
    wordSpacing: 1.2,
    color: Colors.grey,
  );
  static const TextStyle normalStyle = TextStyle(
    fontFamily: '',
    fontSize: 25.0,
    wordSpacing: 1.2,
    color: Colors.grey,
  );
  static TextStyle hi = GoogleFonts.poppins(
    fontSize:18,
    color: Colors.black,
    
  );
}