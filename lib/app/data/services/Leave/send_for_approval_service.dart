import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/Leave/error_model.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/send_for_approval_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';
import 'package:kafebe_app_ik/app/utils/api_token.dart';

class SendForApprovalService extends GetConnect {
  dynamic res;
  Future<SendForApprovalModel?> sendForApproval(id, startDate, endDate, wDate,
      daysOff, String sHour, String eHour, adress, comment) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'vbtauthorization': apiToken
    };

    try {
      var url = Uri.parse(
          '${ServiceConstants.BASE_URL}${ServiceConstants.SEND_FOR_APPROVAL}');
      res = await http.post(url,
          headers: headers,
          body: jsonEncode({
            "ID_EMPLOYEE_VACATION": 123123,
            "ID_GN_PICKLIST_DETAIL_VACATION_TYPE": id,
            "SDATE": startDate,
            "EDATE": endDate,
            "SHOUR": "00.00",
            "EHOUR": "00.00",
            "DAY": daysOff.toString(),
            "HOUR": 0,
            "MINUTE": 0,
            "WDATE": wDate,
            "EARNED_DATE": startDate,
            "EARNED_DAY": 0,
            "ADDRESS": adress,
            "COMMENT": comment,
            "ATTACHMENT": []
          }));
      print(SendForApprovalModel.fromJson(jsonDecode(res.body)).data!.mESSAGE);
    } catch (e) {
      print(ErrorModel.fromJson(jsonDecode(res.body)).message);
      Get.snackbar(
          "error", "${ErrorModel.fromJson(jsonDecode(res.body)).message}");
    }
    // return SendForApprovalModel.fromJson(jsonDecode(res.body));
    return null;
  }
}
