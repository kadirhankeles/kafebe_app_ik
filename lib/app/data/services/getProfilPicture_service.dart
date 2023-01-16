import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/get_ProfilPicture_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

class ProfilPictureService extends GetConnect {
  Future<GetProfilPictureModel?> getProfilPictureService() async {
    GetProfilPictureModel? data = GetProfilPictureModel();

    var headers = ServiceConstants.HEADER;

    var url =
        '${ServiceConstants.BASE_URL}${ServiceConstants.GET_PROFILE_PICTURE}';

    var res = await get(url, headers: headers);

    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }

    print(res.body);
    data = GetProfilPictureModel.fromJson(res.body);

    return data;
  }
}
