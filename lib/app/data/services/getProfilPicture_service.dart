import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/get_ProfilPicture_model.dart';

Future<GetProfilPictureModel?> getProfilPictureService() async {
  GetProfilPictureModel? data = GetProfilPictureModel();
  try {
    var headers = {
      'Accept': 'application/json',
      'vbtauthorization':
          'fwjsDtQ5LOOSrVyWHJZ8WtpMbyULaoqLqhsKVFPxsaOLK6Q6hVxv6RY029XG+f04~1~string~638089957386235973',
    };

    var url = Uri.parse(
        'https://suniktest.suntekstil.com.tr/mobileapi/api/EmployeeReport/GetProfilPicture');
    var res = await http.get(url, headers: headers);
    if (res.statusCode != 200)
      throw Exception('http.get error: statusCode= ${res.statusCode}');
    print(res.body);
    data = GetProfilPictureModel.fromJson(jsonDecode(res.body));

    return data;
  } catch (e) {
    print(e);
    return null;
  }
}
