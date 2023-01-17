import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/employee_leave_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';
class GetEmployeesLeaveByPastMonth extends GetConnect {
Future<EmployeeLeaveModel?> getEmployeesLeaveByPastMonth(String idMaster, String month) async {
  EmployeeLeaveModel? data = EmployeeLeaveModel();
  var headers = ServiceConstants.HEADER;

  var params = {
    'IdMaster': idMaster,
    'month': month,
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('${ServiceConstants.BASE_URL}${ServiceConstants.GET_EMPLOYEES_LEAVE_BY_PAST_MONTH}$query');
  var res = await http.post(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.post error: statusCode= ${res.statusCode}');
  print(res.body);
  data = await EmployeeLeaveModel.fromJson(jsonDecode(res.body));
  return data;
}
}