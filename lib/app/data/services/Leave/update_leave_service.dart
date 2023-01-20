import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/Leave/update_leave_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';
import 'package:kafebe_app_ik/app/utils/api_token.dart';

class UpdateLeaveService extends GetConnect {
  Future<UpdateLeaveModel> getUpdateLeave(
    id,
  ) async {
    String cacheToken = GetStorage().read("token");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'vbtauthorization': cacheToken
    };

    var params = {
      'idLeave': id,
      'isUsed': true,
      'selfService': 'true',
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse(
        'https://suniktest.suntekstil.com.tr/mobileapi/api/EmployeeLeave/UpdateLeaveUsed?$query');
    var res = await http.post(url, headers: headers);
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }
    print(res.body);
   
    return UpdateLeaveModel.fromJson(jsonDecode(res.body));
  }
}
