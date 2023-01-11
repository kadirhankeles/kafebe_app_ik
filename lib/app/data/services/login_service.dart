import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/login_model.dart';

Future<LoginModel?> getLoginService(String user, String password) async {
  
  LoginModel loginData = LoginModel();
  try {
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
  if (res.statusCode != 200)
    throw Exception('http.post error: statusCode= ${res.statusCode}');
  print(res.body+"dasdas");
  loginData = LoginModel.fromJson(jsonDecode(res.body));

  return loginData;
  } catch (e) {
    Get.defaultDialog(title: "Girmiş olduğunuz bilgiler hatalıdır.",middleText: "Lütfen tekrar deneyiniz.",);
    return null;
  }
  
}