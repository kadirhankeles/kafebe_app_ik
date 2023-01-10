import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppConstant{
  //Color
  static Color loginBackground = Color(0xffe53935);


  //TextStyle
  
  static BoxDecoration payrollLastpayroll =BoxDecoration(color: Color(0xffe53935), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15) ),boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(.2),
        spreadRadius: 2,
        blurRadius: 6,
        offset: Offset(3, 6), // changes position of shadow
      ),
    ], );

  static TextStyle payrollLastStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
  static TextStyle payrollStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: .1.h);


  //padding 
}
