import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kafebe_app_ik/app/data/models/login_model.dart';
import 'package:kafebe_app_ik/app/data/models/saved_data_model.dart';
import 'package:kafebe_app_ik/app/data/services/getProfilPicture_service.dart';
import 'package:kafebe_app_ik/app/data/services/payroll_all_data_service.dart';
import 'package:kafebe_app_ik/app/data/services/payroll_month_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/services/login_service.dart';
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
        color: Colors.blue,
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
          title: "Lütfen kullanıcı adı ve şifre bilgilerini giriniz.");
      isLoading.value = false;
    } else if (companySelect.value == companySelectControl.value) {
      Get.defaultDialog(title: "Lütfen şirket seçiniz");
      isLoading.value = false;
    } else {
      loginModel = (await getLoginService(user, password))!;

      await cacheToken.write("token", loginModel.token);
      await cacheToken.write("isManager", loginModel.isManager);
      await cacheToken.write("refleshToken", loginModel.refreshToken);
      await cacheToken.write("userId", loginModel.userID);
      isLoading.value = false;
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

  // @override
  // void onInit() {
  //   savedData ??= SavedDataModel();
  //   super.onInit();
  // }

}
