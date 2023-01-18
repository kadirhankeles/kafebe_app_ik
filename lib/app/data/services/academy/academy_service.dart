import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/learning_global_model.dart';

Future<LearningGlobalModel?> getAcademyService() async {
  LearningGlobalModel data = LearningGlobalModel();
  String cacheToken=GetStorage().read("token");


    Map<String,String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'vbtauthorization': cacheToken
  // var headers = {
  //   'Accept': 'application/json',
  //   'vbtauthorization':
  //       'TvYsu26HUXWYomgz6zTmzbAmaeT2OnsqGIjDWOw+CAtWAg7rkYrZ4oMkkz3MyyHP~1694~string~638096538923023534',
  // };
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
