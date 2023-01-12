import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/login_model.dart';
import 'package:kafebe_app_ik/app/data/services/getProfilPicture_service.dart';
import 'package:kafebe_app_ik/app/data/services/payroll_all_data_service.dart';
import 'package:kafebe_app_ik/app/data/services/payroll_month_service.dart';

import '../../data/services/login_service.dart';
import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  //LoginService loginService = LoginService();

  RxBool loginVisibility = true.obs;
  RxBool switchControl = false.obs;

  RxString companySelect = "Şirket Seçiniz".obs;
  RxList<String> companyList = <String>["Şirket Seçiniz", "Sun"].obs;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginModel? loginModel;
  RxBool isLoading = false.obs;

  bool dene = true;

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

  /* loginToHome() async {
    if (userName.text.isNotEmpty && password.text.isNotEmpty) {
      print("dialog penceresi açıldı.");
      Get.dialog(
          barrierDismissible: false,
          Center(
            child: CircularProgressIndicator(),
          ));
    }
    await Duration(milliseconds: 3000);
    print("dialog pençeresi kapandı.");
    if (Get.isDialogOpen!) {
      Get.back();
    }
  } */

  loginTransition() async {
    if (dene == true) {
      Get.dialog(
          barrierDismissible: false,
          Center(
            child: CircularProgressIndicator(),
          ));
    }
    await Future.delayed(Duration(milliseconds: 3000));
    dene = false;
    if (Get.isDialogOpen!) {
      Get.back();
      dene = true; //Görmek için koydum proje devam ederken sil.
    }
  }

  loginData(String user, String password) async {
    isLoading.value = true;
    /* user = userNameController.text;
    password = passwordController.text; */
    if (user.isEmpty || password.isEmpty) {
      Get.defaultDialog(
          title: "Lütfen kullanıcı adı ve şifre bilgilerini giriniz.");
      isLoading.value = false;
    } else {
      loginModel = await getLoginService(user, password);
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
}
