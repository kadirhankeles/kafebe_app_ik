import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/payroll_list_data_model.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

class PayrollAllDataService extends GetConnect {
  Future<PayrollListDataModel?> getPayrollAllData() async {
    var headers = ServiceConstants.HEADER;

    var data = {"Date": "2023-01-10T17:36:46.601Z"};

    var url =
        "${ServiceConstants.BASE_URL}${ServiceConstants.PAYROLL_ALL_DATA_SERVICE}";
    var res = await post(url, data, headers: headers);

    await ServiceConstants().responseControll(res.statusCode);

    print(res.body);

    return PayrollListDataModel.fromJson(res.body);
  }
}
