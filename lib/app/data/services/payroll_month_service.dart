import 'dart:convert';

import 'package:get/get.dart';

import '../models/payroll_data_model.dart';
import '../models/payroll_period_model.dart';

class PayrollMonthService extends GetConnect {
  Future<PayrollDataModel?> getPayrollPeriodMonth(
      PayrollPeriodModel payrollPeriodModel) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'vbtauthorization':
            'SGOWIS2oeVxajWmqrsmzc968ym6YRHWFNpZ6UJABAAmZN24u+bSoi9CxIjjrlPnR~1~string~638088683596946516',
        'userId': '5',
      };

      var url =
          'https://suniktest.suntekstil.com.tr/mobileapi/api/EmployeeDocuments/EmployeePayrollDownload';
      var res =
          await post(url, jsonEncode(payrollPeriodModel), headers: headers);

      print("service->${res.body}");
      return PayrollDataModel.fromJson(jsonDecode(res.body));
    } catch (e) {
      return null;
    }
  }
}
