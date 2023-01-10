import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/getProfilPicture_model.dart';

Future<GetProfilPictureModel> getProfilPictureService() async {
  GetProfilPictureModel? data = GetProfilPictureModel();
  var headers = {
    'Accept': 'application/json',
    'vbtauthorization': 'cddoFeaQaed+cP2nkot5RzQYmWNhL/snHm/uhYIz9F9zQh3ZgGvzgAQ+4TpliJo2~1~string~638089912772763037',
  };

  var url = Uri.parse('https://suniktest.suntekstil.com.tr/mobileapi/api/EmployeeReport/GetProfilPicture');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
  data = GetProfilPictureModel.fromJson(jsonDecode(res.body));

  return data;
}