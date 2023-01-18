// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/splash/splash_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        height: 100.h,
        width: 100.w,
        child: Image.asset(
          controller.splashPhoto,
          fit: BoxFit.fitWidth,
         ),
       
      ),
    );
  }
}
