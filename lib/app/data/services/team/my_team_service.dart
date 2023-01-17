import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/my_team_model.dart';

class MyTeamService extends GetConnect {
Future<MyTeamModel> myTeamService(String date, int eType, int idHR) async {
  MyTeamModel? myTeamModel = MyTeamModel();
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'vbtauthorization': 'EQrWaeQAVQljt7bQbxQCQzYr9+YcZqU++ooxc4Fi7Jian/b5V/MBkCPD8nE3GiGr~2270~string~638095705466102004',
  };

  var data = { 
   "DATE": date, 
   "ID_GN_LANGUAGE": 1, 
   "SUB_EMPLOYEE_TYPE": eType, 
   "ID_HR_EMPLOYEE": idHR  
 };

  var url = Uri.parse('https://suniktest.suntekstil.com.tr/mobileapi/api/Team/GetMyTeam');
  var res = await http.post(url, headers: headers, body: jsonEncode(data));
  if (res.statusCode != 200) throw Exception('http.post error: statusCode= ${res.statusCode}');
  myTeamModel = await MyTeamModel.fromJson(jsonDecode(res.body));
  print(res.body);
  return myTeamModel;
}
}