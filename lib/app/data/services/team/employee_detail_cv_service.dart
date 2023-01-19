import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/employee_detail_cv_model.dart';
import 'package:kafebe_app_ik/app/utils/api_token.dart';

Future<EmployeeDetailCV?> employeeDetailCVService(String idHR) async {
  EmployeeDetailCV? employeeDetailCV = EmployeeDetailCV();
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'vbtauthorization': apiToken,
  };

  var data = { 
   "ID_GN_LANGUAGE": 1, 
   "ID_HR_EMPLOYEE": idHR  
 };

  var url = Uri.parse('https://suniktest.suntekstil.com.tr/mobileapi/api/EmployeeReport/EmployeeDetailCV');
  var res = await http.post(url, headers: headers, body: jsonEncode(data));
  if (res.statusCode != 200) throw Exception('http.post error: statusCode= ${res.statusCode}');
  employeeDetailCV = EmployeeDetailCV.fromJson(jsonDecode(res.body));
  print(res.body);
  return employeeDetailCV;
}