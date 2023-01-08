import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool loginVisibility = true.obs;
  RxBool switchControl = false.obs;

  RxString companySelect = "Şirket Seçiniz".obs;
  RxList<String> companyList = <String>["Şirket Seçiniz", "Sun"].obs;

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  chanceVisibility() {
    loginVisibility.value = !loginVisibility.value;
  }

  chanceVisibilityIcon() {
    if (loginVisibility == false) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }

  loginToHome() async {
    if (userName.text.isNotEmpty && password.text.isNotEmpty) {
      Get.dialog(
          barrierDismissible: false,
          Center(
            child: CircularProgressIndicator(),
          ));
    }
    await Duration(milliseconds: 3000);
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
