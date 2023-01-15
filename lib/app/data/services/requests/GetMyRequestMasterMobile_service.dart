import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/getMyRequestMasterMobile_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

class GetMyRequestMasterMobileService extends GetConnect {
  Future<GetMyRequestMasterMobileModel?> getMyRequestMasterMobileService(
      String statuCode) async {
    GetMyRequestMasterMobileModel? data = GetMyRequestMasterMobileModel();
    var headers = ServiceConstants.HEADER;

    var params = {
      'statuArray': '$statuCode',
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse(
        '${ServiceConstants.BASE_URL}${ServiceConstants.GET_MY_REQUEST_MASTER_MOBILE}$query');
    var res = await http.post(url, headers: headers);
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }

    print(res.body);
    data = GetMyRequestMasterMobileModel.fromJson(jsonDecode(res.body));

    return data;
  }
}
