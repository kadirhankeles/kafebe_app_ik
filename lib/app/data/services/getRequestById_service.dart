import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/getRequestById_model.dart';

import 'constants/service_constants.dart';

class GetRequestByIdService extends GetConnect {
  Future<GetRequestByIdModel?> getRequestByIdService(String idMaster) async {
    GetRequestByIdModel? data = GetRequestByIdModel();
    var headers = ServiceConstants.HEADER;

    var params = {
      'IdMaster': idMaster,
      'DetailType': '1',
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse(
        '${ServiceConstants.BASE_URL}${ServiceConstants.GET_REQUEST_BY_ID}$query');
    var res = await http.post(url, headers: headers);
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }
    print(res.body);
    data = GetRequestByIdModel.fromJson(jsonDecode(res.body));
    return data;
  }
}
