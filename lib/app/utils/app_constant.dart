import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppConstant {
  //Color
  static Color loginBackground = Color(0xffe53935);

  //TextStyle

  //padding

  static BoxDecoration homeProfilePhoto = BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(50));
  static BoxDecoration homeButton = BoxDecoration(
    color: Color(0xffe53935),
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(.2),
        spreadRadius: 2,
        blurRadius: 6,
        offset: Offset(3, 6), // changes position of shadow
      ),
    ],
  );
  static BoxDecoration homeIzinlerimduzen = BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(10));
  static TextStyle homeIzinlerimAciklama =
      TextStyle(color: Colors.white, fontSize: 13);
  ClipRRect homeCircularPhoto(String path) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
            height: 8.h,
            width: 8.h,
            child: Image(
              image: NetworkImage("${path}"),
              fit: BoxFit.cover,
            )));
  }
}
