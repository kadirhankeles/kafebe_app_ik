import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/services/constants/service_constants.dart';

import '../models/payroll_data_model.dart';

class PayrollMonthService extends GetConnect {
  Future<PayrollDataModel?> getPayrollPeriodMonth(year, month, dId) async {
    var headers = ServiceConstants.HEADER;
//userid isteyebilir?
    var url =
        '${ServiceConstants.BASE_URL}${ServiceConstants.PAYROLL_MONTH_SERVICE}';

    var res = await post(
        url, {"YEAR": year, "MONTH": month, "DOCUMENTUID": dId},
        headers: headers);

    await ServiceConstants().responseControll(res.statusCode);

    print("service->${res.body}");

    return PayrollDataModel.fromJson(res.body);
  }
}
