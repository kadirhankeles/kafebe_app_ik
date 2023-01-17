import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/learning_global_model.dart';

Future<LearningGlobalModel?> getAcademyService() async {
  LearningGlobalModel data = LearningGlobalModel();
  var headers = {
    'Accept': 'application/json',
    'vbtauthorization':
        '0oEwdfQklSM9V2/kVGS1O4v+V+QX8TkfGc07n96LRJrNrbMUvhBYJ1F94qExE0rK~1694~string~638095742710838802',
  };

  var params = {
    'idHrEmployee': '6641',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse(
      'https://suniktest.suntekstil.com.tr/mobileapi/api/LearningGlobalMobile/GetMobileLearnAndImprovementData?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200)
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
  data = LearningGlobalModel.fromJson(jsonDecode(res.body));
  print(data.data?.talentActivityList?[0].aCTIVITYNAME);
  return data;
}
