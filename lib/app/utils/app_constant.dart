import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppConstant {
  //Color
  static Color loginBackground = Color(0xffe53935);

  //TextStyle
   static TextStyle homeIzinlerimAciklama =
      TextStyle(color: Colors.black, fontSize: 13);
  
  //Box decoration
  static BoxDecoration homeTopContainer = BoxDecoration(color: Color(0xffa51818), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)));

  static BoxDecoration homeProfilePhoto = BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(50));

  static BoxDecoration homeButton = BoxDecoration(
    color: Color(0xffFDFDFC),
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Color(0xffECECF4),
        spreadRadius: .2,
        blurRadius: 0.8,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ],
  );

 

 
  ClipRRect homeCircularPhoto(String path) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
            height: 7.h,
            width: 7.h,
            child: Image(
              image: NetworkImage("${path}"),
              fit: BoxFit.cover,
            )));
  }
}
