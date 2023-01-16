import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

import '../models/getLanding_PageInfo_model.dart';

class LandingPageInfoService extends GetConnect {
  Future<GetLandingPageInfoModel?> getLandingPageInfoService() async {
    GetLandingPageInfoModel? data = GetLandingPageInfoModel();

    var headers = ServiceConstants.HEADER;

    var params = {
      'isFirstLogin': 'true',
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse(
        '${ServiceConstants.BASE_URL}${ServiceConstants.GET_LANDING_PAGE_INFO}$query');
    var res = await get(
      url,
      headers: headers,
    );

    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }

    print(res.body);
    data = GetLandingPageInfoModel.fromJson(jsonDecode(res.body));

    return data;
  }
}
