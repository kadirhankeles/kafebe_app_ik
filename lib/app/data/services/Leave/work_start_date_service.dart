import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

import 'package:kafebe_app_ik/app/data/models/Leave/work_start_date_model.dart';
import 'package:kafebe_app_ik/app/utils/api_token.dart';

class WorkStartDateService extends GetConnect {
  Future<WorkStartDateModel?> getWorkStartDateService(
    idHr,
    idLeave,
    String startDate,
    String endDate,
  ) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'vbtauthorization': apiToken
    };
    try {
      var data = {
        "ID_HR_EMPLOYEE": idHr,
        "ID_GN_PICKLIST_DETAIL_VACATION_TYPE": idLeave,
        "SDATE": startDate,
        "EDATE": endDate,
        "SHOUR": "string",
        "EHOUR": "string"
      };

      var url = Uri.parse(
          '${ServiceConstants.BASE_URL}${ServiceConstants.WORK_START}');
      var res = await http.post(url, headers: headers, body: jsonEncode(data));
      if (res.statusCode != 200) {
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      }
      print(res.body);
      return WorkStartDateModel.fromJson(jsonDecode(res.body));
    } catch (e) {
      print(e);
      return null;
    }
  }
}
