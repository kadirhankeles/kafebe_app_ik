import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/payroll_all_model.dart';
import 'package:kafebe_app_ik/app/data/models/payroll_list_data_model.dart';
import 'package:kafebe_app_ik/app/data/services/payroll_all_data_service.dart';

class PayrollController extends GetxController {
  PayrollAllDataService payrollAllDataService = PayrollAllDataService();
  PayrollListDataModel? payrollListDataModel;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    payrollAllDataService.getPayrollAllData();
    await getPayrollDataList();

    super.onInit();
  }

  getPayrollDataList() async {
    try {
      isLoading.value = false;
      payrollListDataModel = await payrollAllDataService.getPayrollAllData();

      isLoading.value = true;
    } catch (e) {
      print("null!");
    }
  }
}
