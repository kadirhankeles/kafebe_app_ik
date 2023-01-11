import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppConstant {
  //Color
  static Color loginBackground = Color(0xffe53935);
  static Color loginLanguage = Color(0xffbdbdbd);
  static const loginCursor = Color(0xffe53935);
  static const loginPrefix = Color(0xffe53935);
  static const loginButton = Color(0xffe53935);
  static const loginSw = Color(0xffe53935);
  static const loginSwTrack = Color(0xffef9a9a);
  static const loginInSw = Color(0xffe0e0e0);
  static const loginInSwTrack = Color(0xff9e9e9e);

  //BorderRadius
  static BorderRadius globalRadius = BorderRadius.circular(2.w);

  //Icon
  static const loginTextFieldIcon = Icons.person;
  static const loginTextFormFieldIcon = Icon(Icons.person, color: Color(0xffe53935));
  static const passwordTextFormFieldIcon = Icon(Icons.key, color: Color(0xffe53935));
  static const loginSufIcon = Icon(Icons.visibility, color: Colors.grey);

  //TextStyle

  static const loginInfoStyle = TextStyle(fontSize: 15);
  static const loginSmsStyle = TextStyle(fontSize: 15);

  //Text
  static const loginInfo = Text("Mobil uygulamayı kullanmak için lütfen giriş yapınız.",style: loginInfoStyle,);
  static const loginSms = Text("Bilgisayar şifrem yok. SMS ile şifre almak istiyorum.", style: loginSmsStyle,);

  static TextStyle homeIzinlerimAciklama =
      TextStyle(color: Colors.black, fontSize: 13);

  static TextStyle homeNameSurname = TextStyle(fontSize: 12);

  static TextStyle homeButtonWhite =
      TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700);
  static TextStyle homeButtonBlack =
      TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700);

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
  static BoxDecoration homeRedButton = BoxDecoration(
    color: Color(0xff7f0000),
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
      color: Color(0xffe0e0e0).withOpacity(.8),
      borderRadius: BorderRadius.circular(15));

  static BoxDecoration payrollLastpayroll = BoxDecoration(
    color: Color(0xff7f0000),
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
      child: Image.asset(
        "${path}",
        height: 3.h,
        width: 3.h,
        fit: BoxFit.cover,
      ),
    );
  }
  Container homeCircularWhite(String path) {
    return Container(
      height: 6.h,
      width: 6.h,
      child: Image.asset(
        "${path}",
        height: 3.h,
        width: 3.h,
        fit: BoxFit.cover,
        color: Colors.white,
      ),
    );
  }
}
