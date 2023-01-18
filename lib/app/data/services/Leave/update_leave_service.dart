import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/Leave/update_leave_model.dart';
import 'package:kafebe_app_ik/app/utils/api_token.dart';

class UpdateLeaveService extends GetConnect {
  Future<UpdateLeaveModel> getUpdateLeave(
    id,
  ) async {
    var headers = {
      'Accept': 'application/json',
      'vbtauthorization':
          "ms6ewfHx5BXyx3hycKoHvpaLaZeXkgwuZg9Cj7SHyrAW36wWOrfEvQxtJ99fizP9~2270~string~638096594116293034",
    };

    var params = {
      'idLeave': id,
      'isUsed': 'true',
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
