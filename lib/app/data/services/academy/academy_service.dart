import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/learning_global_model.dart';

Future<LearningGlobalModel?> getAcademyService() async {
  LearningGlobalModel data = LearningGlobalModel();
  var headers = {
    'Accept': 'application/json',
    'vbtauthorization':
        'ZqN33no4KcO7HjUnoFb4qivobG3vwG5SR4WjVmsd/kWKT8kUvQJ84tQHlG72RYNM~1694~string~638095464010792720',
  };

  var params = {
    'idHrEmployee': '7212',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse(
      'https://suniktest.suntekstil.com.tr/mobileapi/api/LearningGlobalMobile/GetMobileLearnAndImprovementData?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200)
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
  data = LearningGlobalModel.fromJson(jsonDecode(res.body));
  return data;
}
