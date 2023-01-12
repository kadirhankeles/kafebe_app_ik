import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

import '../models/login_model.dart';

class LoginService extends GetConnect {
  Future<LoginModel?> getLoginService(String user, String password) async {
    LoginModel loginData = LoginModel();
    try {
      var headers = ServiceConstants.HEADER;

      var data = {
        "SelectedIdLanguage": 0,
        "Email": user,
        "Password": password,
        "FirmId": 5,
        "PinCode": "string",
        "DeviceID": "string",
        "DomainFirmId": 0
      };

      var url =
          ('${ServiceConstants.BASE_URL}${ServiceConstants.ACCOUNT_TOKEN}');

      var res = await post(url, headers: headers, jsonEncode(data));

      if (res.statusCode != 200) {
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      }

      print("sa" + res.body);
      loginData = LoginModel.fromJson(jsonDecode(res.body));
      return loginData;
    } catch (e) {
      Get.defaultDialog(
        title: "Girmiş olduğunuz bilgiler hatalıdır.",
        middleText: "Lütfen tekrar deneyiniz.",
      );

      return null;
    }
  }
}
