import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/delete_push_messages_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

class DeletePushMessagesService extends GetConnect {
  Future<DeletePushMessagesModel> deletePushMessages(id) async {
    var headers = ServiceConstants.HEADER;

    var params = {
      'ID_PUSH_NOTIFICATION_DETAIL': "$id",
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse(
        '${ServiceConstants.BASE_URL}${ServiceConstants.DELETE_PUSH_MESSAGES}$query');
    var res = await http.post(url, headers: headers);
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }
    print(res.body);
    print("silindi");

    return DeletePushMessagesModel.fromJson(jsonDecode(res.body));
  }
}
