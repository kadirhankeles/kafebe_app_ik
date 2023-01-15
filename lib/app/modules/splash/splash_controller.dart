// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kafebe_app_ik/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final cacheToken = GetStorage();
  String splashPhoto = "assets/splash.png";
  
  @override
  void onInit() {
    print("splash view");
    super.onInit();
  }

  @override
  void onReady() async {
    
    if (cacheToken.read("token") != null) {
    await  Future.delayed(Duration(milliseconds: 2000), () {
        Get.toNamed(Routes.HOME);
      });
    } else {
    await  Future.delayed(Duration(milliseconds: 2000), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
    super.onReady();
  }

  
}
