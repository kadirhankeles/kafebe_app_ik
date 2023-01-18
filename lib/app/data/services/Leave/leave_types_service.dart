import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/Leave/leave_types_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

class LeaveTypesService extends GetConnect {
  Future<LeaveTypeModel> getLeaveTypes() async {
    var headers = ServiceConstants.HEADER;

    var url = Uri.parse(
        '${ServiceConstants.BASE_URL}${ServiceConstants.LEAVE_TYPES}');
    var res = await  http.post(url, headers: headers);
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }

    return LeaveTypeModel.fromJson(jsonDecode(res.body));
  }
}
