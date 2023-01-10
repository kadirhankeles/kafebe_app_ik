import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/payroll/payroll_controller.dart';

class PayrollBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PayrollController());
  }
}
