import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/payroll/payroll_controller.dart';

import 'approval_controller.dart';

class ApprovalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ApprovalController());
  }
}
