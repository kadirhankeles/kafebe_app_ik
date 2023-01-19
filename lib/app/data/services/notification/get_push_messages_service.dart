import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kafebe_app_ik/app/data/models/notification_list_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';
import 'package:http/http.dart' as http;

class NotificationListService extends GetConnect {
  Future<NotificationListModel> getPushMessagesService() async {
      String cacheToken=GetStorage().read("token");


    Map<String,String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'vbtauthorization': cacheToken
    };

    var url = Uri.parse(
        '${ServiceConstants.BASE_URL}${ServiceConstants.GET_PUSH_MESSAGES}');

    var res = await http.post(url, headers: headers);
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }
    print(res.body);

    return NotificationListModel.fromJson(jsonDecode(res.body));
  }
}
