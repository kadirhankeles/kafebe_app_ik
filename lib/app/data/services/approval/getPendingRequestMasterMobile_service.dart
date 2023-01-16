import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/getPendingRequestMasterMobile_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';
class GetPendingRequestMasterMobileService extends GetConnect {
Future<GetPendingRequestMasterMobileModel?> getPendingRequestMasterMobileService(String statuCode) async {
  GetPendingRequestMasterMobileModel? data = GetPendingRequestMasterMobileModel();
  var headers = ServiceConstants.HEADER;

  var params = {
    'statu': '$statuCode',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('${ServiceConstants.BASE_URL}${ServiceConstants.GET_PENDING_REQUEST_MASTER_MOBILE}$query');
  var res = await http.post(url, headers: headers);
  if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }
  print(res.body);
  data = GetPendingRequestMasterMobileModel.fromJson(jsonDecode(res.body));
  return data;
}
}