import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/getRequestById_model.dart';

import '../constants/service_constants.dart';

class GetRequestByIdService extends GetConnect {
  Future<GetRequestByIdModel?> getRequestByIdService(String idMaster, String detailType) async {
    GetRequestByIdModel? data = GetRequestByIdModel();
      String cacheToken=GetStorage().read("token");


    Map<String,String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'vbtauthorization': cacheToken
    };

    var params = {
      'IdMaster': idMaster,
      'DetailType': detailType,
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
