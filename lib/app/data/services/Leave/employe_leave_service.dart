import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/Leave/employee_leave_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

class EmployeeLeaveService extends GetConnect {
  Future<EmployeeLeaveModel?> getEmployeLeaveService() async {
    try {
      var headers = ServiceConstants.HEADER2;

      var url = Uri.parse(
          '${ServiceConstants.BASE_URL}${ServiceConstants.EMPLOYEE_LEAVE}');
      var res = await http.post(url, headers: headers);
      if (res.statusCode != 200) {
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      }
      print(res.body);
      return EmployeeLeaveModel.fromJson(jsonDecode(res.body));
    } catch (e) {
      print(e);
      return null;
    }
  }
}
