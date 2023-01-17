import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/leaveAdd/leave_add_controller.dart';

class LeaveAddBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LeaveAddController());
  }
}
