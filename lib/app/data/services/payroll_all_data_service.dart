import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kafebe_app_ik/app/data/models/payroll_list_data_model.dart';

import '../models/payroll_all_model.dart';

class PayrollAllDataService extends GetConnect {
  Future<PayrollListDataModel?> getPayrollAllData() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'vbtauthorization':
            'cddoFeaQaed+cP2nkot5RzQYmWNhL/snHm/uhYIz9F9zQh3ZgGvzgAQ+4TpliJo2~1~string~638089912772763037',
      };

      var data = {"Date": "2023-01-10T17:36:46.601Z"};

      var url = Uri.parse(
          'https://suniktest.suntekstil.com.tr/mobileapi/api/EmployeeDocuments/GetPayrollPeriods');
      var res = await http.post(url, headers: headers, body: jsonEncode(data));
      if (res.statusCode != 200) {
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      }
      print(res.body);
      return PayrollListDataModel.fromJson(jsonDecode(res.body));
    } catch (e) {
      print(e);
    }
  }
}
