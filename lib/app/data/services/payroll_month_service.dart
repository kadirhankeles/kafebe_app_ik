import 'dart:convert';

import 'package:get/get.dart';

import '../models/payroll_data_model.dart';
import '../models/payroll_period_model.dart';

class PayrollMonthService extends GetConnect {
  Future<PayrollDataModel?> getPayrollPeriodMonth() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'vbtauthorization':
            'hqh56tIbTPOTnjL8n5BugiQVfk5iJBlF8uWxAfhxlaJFupcaGSu85nrX8EqX/8To~1~string~638089539004943367',
        'userId': '5',
      };

      var url =
          'https://suniktest.suntekstil.com.tr/mobileapi/api/EmployeeDocuments/EmployeePayrollDownload';
      var res = await post(
          url,
          {
            "YEAR": 2021,
            "MONTH": 2,
            "DOCUMENTUID": "e5fa86c3-2cd0-4ca2-b9b9-95b1c0e54544"
          },
          headers: headers);

      print("service->${res.body}");
      return PayrollDataModel.fromJson(res.body);
    } catch (e) {
      return null;
    }
  }
}
