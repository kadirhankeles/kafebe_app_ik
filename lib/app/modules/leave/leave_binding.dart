import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/leave/leave_controller.dart';

class LeaveBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LeaveController());
  }
}
