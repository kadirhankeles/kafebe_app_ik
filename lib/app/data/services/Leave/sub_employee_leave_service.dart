import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/Leave/sub_employee_leave_model.dart';
import 'package:kafebe_app_ik/app/utils/api_token.dart';

class SubEmployeeLeaveService extends GetConnect {
  Future<SubEmployeeLeaveModel> getSubEmployeeLeave(idhr) async {
    var headers = {
      'Accept': 'application/json',
      'vbtauthorization': apiToken,
    };

    var params = {
      'IdHrEmployee': idhr,
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse(
        'https://suniktest.suntekstil.com.tr/mobileapi/api/EmployeeLeave/GetSubEmployeesLeave?$query');
    var res = await http.post(url, headers: headers);
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }
    print(res.body);
    return SubEmployeeLeaveModel.fromJson(jsonDecode(res.body));
  }
}
