import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool loginVisibility = true.obs;
  RxBool switchControl = false.obs;

  RxString companySelect = "Şirket Seçiniz".obs;
  RxList<String> companyList = <String>["Şirket Seçiniz", "Sun"].obs;

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  bool dene = true;

  chanceVisibility() {
    loginVisibility.value = !loginVisibility.value;
  }

  chanceVisibilityIcon() {
    if (loginVisibility == false) {
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
}
