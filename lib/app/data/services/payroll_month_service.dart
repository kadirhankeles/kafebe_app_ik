import 'dart:convert';

import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/utils/api_token.dart';

import '../models/payroll_data_model.dart';
import '../models/payroll_period_model.dart';

class PayrollMonthService extends GetConnect {
  Future<PayrollDataModel?> getPayrollPeriodMonth(year, month, dId) async {
    try {
      print("sa");
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'vbtauthorization':
            '$apiToken',
        'userId': '5',
      };

      var url =
          'https://suniktest.suntekstil.com.tr/mobileapi/api/EmployeeDocuments/EmployeePayrollDownload';
      var res = await post(
          url, {"YEAR": year, "MONTH": month, "DOCUMENTUID": dId},
          headers: headers);

      print("service->${res.body}");
      return PayrollDataModel.fromJson(res.body);
    } catch (e) {
      return null;
    }
  }
}
