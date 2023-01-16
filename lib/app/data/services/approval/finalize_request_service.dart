
import 'dart:convert';

import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/finalize_request_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';
import 'package:http/http.dart' as http;

class FinalizeRequestService extends GetConnect {
Future<FinalizeRequestModel?> getFinalizeRequestService(String? idMaster, int? statu, String desc) async {
  FinalizeRequestModel? finalizeData = FinalizeRequestModel();
   var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'vbtauthorization': 'DOuOdnX2FEhrQv/Zjuu71jyyi+fUQSm9ovQltKf283XdNuhw6F90dmS9+BVabnDg~2270~string~638094734573015689',
  };

  var data = { 
   "ID_MASTER": idMaster, 
   "Statu": statu, 
   "Explanation": desc, 
   "isInsteadApprove": false, 
   "InsteadApproverOrigin": 0  
 };

  var url = Uri.parse('https://suniktest.suntekstil.com.tr/mobileapi/api/RequestManagement/FinalizeRequest');
  var res = await http.post(url, headers: headers, body: json.encode(data));
  if (res.statusCode != 200) throw Exception('http.post error: statusCode= ${res.statusCode}');
  finalizeData = await FinalizeRequestModel.fromJson(jsonDecode(res.body));
  print(res.body);
  return finalizeData;
}
}

