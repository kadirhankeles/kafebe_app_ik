import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kafebe_app_ik/app/data/models/payroll_list_data_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

class PayrollAllDataService extends GetConnect {
  Future<PayrollListDataModel?> getPayrollAllData() async {
      String cacheToken=GetStorage().read("token");


    Map<String,String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'vbtauthorization': cacheToken
    };

    var data = {"Date": "2023-01-10T17:36:46.601Z"};

    var url =
        "${ServiceConstants.BASE_URL}${ServiceConstants.PAYROLL_ALL_DATA_SERVICE}";
    var res = await post(url, data, headers: headers);


    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }


    print(res.body);

    return PayrollListDataModel.fromJson(res.body);
  }
}
