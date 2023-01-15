// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';
// import 'package:kafebe_app_ik/app/modules/login/login_controller.dart';

// import '../models/login_model.dart';

// class LoginService extends GetConnect {

//   Future<LoginModel?> getLoginService(String user, String password) async {
//     LoginModel loginData = LoginModel();
//     LoginController dd = LoginController();
//     try {
//       var headers = ServiceConstants.HEADER;

//       var data = {
//         "SelectedIdLanguage": 0,
//         "Email": user,
//         "Password": password,
//         "FirmId": 5,
//         "PinCode": "string",
//         "DeviceID": "string",
//         "DomainFirmId": 0
//       };

//       var url =
//           ('https://suniktest.suntekstil.com.tr/mobileapi/api/Account/Token');

//       var res = await post(url, headers: headers, jsonEncode(data));

//       if (res.statusCode != 200) {
//         throw Exception('http.post error: statusCode= ${res.statusCode}');
//       }

//       print("sa" + res.body);
//       loginData = LoginModel.fromJson(jsonDecode(res.body));
//       return loginData;
//     } catch (e) {
//       dd.isLoading.value = false;
//       Get.defaultDialog(
//         title: "Girmiş olduğunuz bilgiler hatalıdır.",
//         middleText: "Lütfen tekrar deneyiniz.",
//       );

//       return null;
//     }
//   }
// }

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/modules/login/login_controller.dart';
import 'package:kafebe_app_ik/app/routes/app_pages.dart';

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
    print(res.body + "dasdas");
    loginData = LoginModel.fromJson(jsonDecode(res.body));
    Get.toNamed(Routes.HOME);
    return loginData;
  } catch (e) {
   Get.defaultDialog(
      title: "Girmiş olduğunuz bilgiler hatalıdır.",
      middleText: "Lütfen tekrar deneyiniz.",
      
    );
    
  }
}
