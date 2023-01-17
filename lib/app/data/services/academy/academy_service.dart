import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/learning_global_model.dart';

Future<LearningGlobalModel?> getAcademyService() async {
  LearningGlobalModel data = LearningGlobalModel();
  var headers = {
    'Accept': 'application/json',
    'vbtauthorization':
        'OUe2zBIiiR8ssMB3zcXiStx5nR++if0xHH14R+BL7qmodjN47fMv9U1cB8ytSQdG~1694~string~638095601262503520',
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
