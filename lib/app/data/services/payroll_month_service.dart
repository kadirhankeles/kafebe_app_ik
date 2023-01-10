import 'dart:convert';

import 'package:get/get.dart';

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
            'fwjsDtQ5LOOSrVyWHJZ8WtpMbyULaoqLqhsKVFPxsaOLK6Q6hVxv6RY029XG+f04~1~string~638089957386235973',
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
