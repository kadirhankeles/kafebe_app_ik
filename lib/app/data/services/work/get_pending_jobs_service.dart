import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/get_pending_jobs.dart';
import 'package:kafebe_app_ik/app/utils/api_token.dart';

Future<GetPendingJobsModel?> getPendingJobsService(String statu) async {
  GetPendingJobsModel? getPendingJobsModel = GetPendingJobsModel();
  var headers = {
    'Accept': 'application/json',
    'vbtauthorization': apiToken,
  };
var params = {
    'ID_WORK_STATUS_ARRAY': statu,
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://suniktest.suntekstil.com.tr/mobileapi/api/RequestManagement/GetPendingJobs?$query');
  var res = await http.post(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.post error: statusCode= ${res.statusCode}');
  getPendingJobsModel = await GetPendingJobsModel.fromJson(jsonDecode(res.body));
  print(res.body);
  return getPendingJobsModel;
}
