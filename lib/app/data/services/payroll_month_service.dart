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
            'cddoFeaQaed+cP2nkot5RzQYmWNhL/snHm/uhYIz9F9zQh3ZgGvzgAQ+4TpliJo2~1~string~638089912772763037',
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
