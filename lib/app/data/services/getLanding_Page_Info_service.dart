import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/utils/api_token.dart';

import '../models/getLanding_PageInfo_model.dart';

Future<GetLandingPageInfoModel?> GetLandingPageInfoService() async {
  GetLandingPageInfoModel? data = GetLandingPageInfoModel();
  try {
    var headers = {
      'Accept': 'application/json',
      'vbtauthorization':
          '$apiToken',
    };

    var params = {
      'isFirstLogin': 'true',
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse(
        'https://suniktest.suntekstil.com.tr/mobileapi/api/EmployeeReport/GetLandingPageInfo?$query');
    var res = await http.get(url, headers: headers);
    if (res.statusCode != 200)
      throw Exception('http.get error: statusCode= ${res.statusCode}');
    print(res.body);
    data = GetLandingPageInfoModel.fromJson(jsonDecode(res.body));

    return data;
  } catch (e) {
    print(e);
  }
}
