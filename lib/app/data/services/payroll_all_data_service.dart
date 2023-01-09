import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/payroll_all_model.dart';

class PayrollAllDataService extends GetConnect {
  Future<PayrollAllDataModel> getPayrollAllData() async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'vbtauthorization':
          'vlkT6cG0bB7WCKcBivV4HBXtpGMn9Unoo4pM8sn9SqnyQarn+NvGDOoG4BAMUipM~1~123~638085978845528626',
    };

    var params = {
      'api_key':
          'vlkT6cG0bB7WCKcBivV4HBXtpGMn9Unoo4pM8sn9SqnyQarn+NvGDOoG4BAMUipM~1~123~638085978845528626',
    };
    var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    var data = '{ "Date": "2023-01-06T11:49:25.648Z" }';

    var url = Uri.parse(
        'https://suniktest.suntekstil.com.tr/mobileapi/api/EmployeeDocuments/GetPayrollPeriods?$query');
    var res = await http.post(url, headers: headers, body: data);
    if (res.statusCode != 200)
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    print(res.body);
    return PayrollAllDataModel.fromJson(jsonDecode(res.body));
  }
}
