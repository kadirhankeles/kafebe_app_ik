import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppConstant {
  //Color
  static Color loginBackground = Color(0xffe53935);

  //TextStyle
  static TextStyle homeIzinlerimAciklama =
      TextStyle(color: Colors.white, fontSize: 13);

  static TextStyle homeNameSurname = TextStyle(fontSize: 12);

  //Box decoration
  static BoxDecoration homeTopContainer = BoxDecoration(
      color: Color(0xff7f0000),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)));

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

  static BoxDecoration homeIzinlerimContainer = BoxDecoration(
      color: Color(0xff7f0000).withOpacity(.8),
      borderRadius: BorderRadius.circular(15));

  static BoxDecoration payrollLastpayroll = BoxDecoration(
    color: Color(0xffe53935),
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(.2),
        spreadRadius: 2,
        blurRadius: 6,
        offset: Offset(3, 6), // changes position of shadow
      ),
    ],
  );

  static TextStyle payrollLastStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
  static TextStyle payrollStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
      letterSpacing: .1.h);

  Container homeCircularPhoto(String path) {
    return Container(
      height: 6.h,
      width: 6.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          "${path}",
          height: 2.h,
          width: 2.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
