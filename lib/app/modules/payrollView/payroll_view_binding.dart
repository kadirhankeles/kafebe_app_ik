import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/payrollView/payroll_view_controller.dart';

class PayrollViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PayrollViewController());
  }
}
