import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kafebe_app_ik/app/data/models/login_model/login_model.dart';
import 'package:kafebe_app_ik/app/data/models/saved_data_model.dart';
import 'package:kafebe_app_ik/app/data/services/home/getProfilPicture_service.dart';
import 'package:kafebe_app_ik/app/data/services/payroll/payroll_all_data_service.dart';
import 'package:kafebe_app_ik/app/data/services/payroll/payroll_month_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/services/login/login_service.dart';
import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  //LoginService loginService = LoginService();

  RxBool loginVisibility = true.obs;
  RxBool switchControl = false.obs;

  RxString companySelect = "Şirket Seçiniz".obs;
  RxString companySelectControl = "Şirket Seçiniz".obs;
  RxList<String> companyList = <String>["Şirket Seçiniz", "Sun"].obs;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginModel loginModel = LoginModel();
  RxBool isLoading = false.obs;

  SharedPreferences? prefs;
  SavedDataModel? savedData;

  GetStorage cacheToken = GetStorage();

  chanceVisibility() {
    loginVisibility.value = !loginVisibility.value;
  }

  chanceVisibilityIcon() {
    if (loginVisibility.value == false) {
      return Icon(
        Icons.visibility,
        color: Color(0xff7f0000),
      );
    } else {
      return Icon(
        Icons.visibility_off,
        color: Colors.grey,
      );
    }
  }

  // loginData(String user, String password) async {
  //   isLoading.value = true;
  //
  //   if (user.isEmpty || password.isEmpty) {
  //     Get.defaultDialog(
  //         title: "Lütfen kullanıcı adı ve şifre bilgilerini giriniz.");
  //     isLoading.value = false;
  //   } else {
  //     loginModel = (await getLoginService(user, password))!;
  //     await cacheToken.write("token", loginModel.token);
  //     await cacheToken.write("isManager", loginModel.isManager);
  //     await cacheToken.write("refleshToken", loginModel.refreshToken);
  //     await cacheToken.write("userId", loginModel.userID);

  //     isLoading.value = false;
  //   }
  // }
  loginData(String user, String password) async {
    isLoading.value = true;

    if (user.isEmpty || password.isEmpty) {
      Get.defaultDialog(
        title: "Uyarı",
        middleText: "Lütfen kullanıcı adı ve şifre bilgilerinizi giriniz.",
        backgroundColor: Colors.grey.withOpacity(.9),
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        radius: 10,
        actions: [
          SizedBox(
            width: 45.w,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: .1.h, color: Colors.white),
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
      isLoading.value = false;
    } else if (companySelect.value == companySelectControl.value) {
      Get.defaultDialog(
        title: "Uyarı",
        middleText: "Lütfen şirket seçiniz.",
        backgroundColor: Colors.grey.withOpacity(.9),
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        radius: 10,
        actions: [
          SizedBox(
            width: 45.w,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: .1.h, color: Colors.white),
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
      isLoading.value = false;
    } else {
      loginModel = (await getLoginService(user, password))!;
      print(loginModel.token);
      print(loginModel.userID);
      
      isLoading.value = false;
      await cacheToken.write("token", loginModel.token);
      await cacheToken.write("isManager", loginModel.isManager);
      await cacheToken.write("refleshToken", loginModel.refreshToken);
      await cacheToken.write("userId", loginModel.userID);
      await cacheToken.write(loginModel.userID.toString(), loginModel.token);
      
    }
  }

  // loginApp(String user, String password) async {
  //   isLoading.value = true;
  //   if (user.isEmpty || password.isEmpty) {
  //     Get.defaultDialog(
  //         title: "Lütfen kullanıcı adı ve şifre bilgilerini giriniz.");
  //     isLoading.value = false;
  //   } else {

  //     loginModel = await loginService.getLoginService(user, password).then((value) =>  Get.toNamed(Routes.HOME));

  //     isLoading.value = false;

  //   }
  // }
  // setSavedData(SavedDataModel parameters) async {
  //   prefs!.setString("userInfo", jsonEncode(parameters.toJson()));
  // }

  // getSavedData() {
  //   savedData = jsonDecode(prefs!.getString("userInfo").toString());

  // }

   @override
   void onInit() {
    cacheToken.write("token", "");
   savedData ??= SavedDataModel();
     super.onInit();
   }

}
