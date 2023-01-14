import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/delete_push_messages_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

import '../../models/bulk_delete_messages_model.dart';

class BulkDeleteMessagesService extends GetConnect {
  Future<BulkDeleteMessagesModel> bulkDeleteMessages(value) async {
    var headers = ServiceConstants.HEADER;

    var params = {
      'AllOrReaded': '$value',
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var url = Uri.parse(
        '${ServiceConstants.BASE_URL}${ServiceConstants.BULK_DELETE_MESSAGES}$query');
    var res = await http.post(url, headers: headers);
    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }
    print(res.body);
    print("tümünü silme servisi");

    return BulkDeleteMessagesModel.fromJson(jsonDecode(res.body));
  }
}
