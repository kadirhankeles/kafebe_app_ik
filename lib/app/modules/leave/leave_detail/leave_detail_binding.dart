import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/leave/leave_detail/leave_detail_controller.dart';
import 'package:kafebe_app_ik/app/modules/leaveAdd/leave_add_controller.dart';

class LeaveDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LeaveDetailController());
  }
}
