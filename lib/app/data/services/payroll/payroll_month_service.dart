import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

import '../../models/payroll_data_model.dart';

class PayrollMonthService extends GetConnect {
  Future<PayrollDataModel?> getPayrollPeriodMonth(year, month, dId) async {
      String cacheToken=GetStorage().read("token");


    Map<String,String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'vbtauthorization': cacheToken
    };
//userid isteyebilir?
    var url =
        '${ServiceConstants.BASE_URL}${ServiceConstants.PAYROLL_MONTH_SERVICE}';

    var res = await post(
        url, {"YEAR": year, "MONTH": month, "DOCUMENTUID": dId},
        headers: headers);

    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }

    print("service->${res.body}");

    return PayrollDataModel.fromJson(res.body);
  }
}
