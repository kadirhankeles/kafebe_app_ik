import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/services/payroll_all_data_service.dart';

class PayrollController extends GetxController {
  PayrollAllDataService payrollAllDataService = PayrollAllDataService();

  @override
  void onInit() {
    payrollAllDataService.getPayrollAllData();
    super.onInit();
  }
}
