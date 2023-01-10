import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/GetLandingPageInfo_model.dart';

Future<GetLandingPageInfoModel?> GetLandingPageInfoService() async {
  GetLandingPageInfoModel? data = GetLandingPageInfoModel();
  var headers = {
    'Accept': 'application/json',
    'vbtauthorization': 'cddoFeaQaed+cP2nkot5RzQYmWNhL/snHm/uhYIz9F9zQh3ZgGvzgAQ+4TpliJo2~1~string~638089912772763037',
  };

  var params = {
    'isFirstLogin': 'true',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://suniktest.suntekstil.com.tr/mobileapi/api/EmployeeReport/GetLandingPageInfo?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
  data = GetLandingPageInfoModel.fromJson(jsonDecode(res.body));

  return data;
}