import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../models/login_model/login_model.dart';

Future<LoginModel?> getLoginService(String user, String password) async {
  LoginModel loginData = LoginModel();

  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  var data = {
    "SelectedIdLanguage": 0,
    "Email": user,
    "Password": password,
    "FirmId": 5,
    "PinCode": "string",
    "DeviceID": "string",
    "DomainFirmId": 0
  };

  var url = Uri.parse(
      'https://suniktest.suntekstil.com.tr/mobileapi/api/Account/Token');
  var res = await http.post(url, headers: headers, body: jsonEncode(data));
  // if (res.statusCode != 200)
  //   throw Exception('http.post error: statusCode= ${res.statusCode}');
  print(res.body + "dasdas");
  loginData = LoginModel.fromJson(jsonDecode(res.body));
  if (res.statusCode == 200) {
Get.offAllNamed(Routes.HOME);
  } else {
    Get.defaultDialog(
      title: "Girmiş olduğunuz bilgiler hatalıdır",
      middleText: "Lütfen tekrar deneyiniz.",
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
  }

  return loginData;
}
