import 'package:get/get.dart';

import 'employeeLeave_controller.dart';



class EmployeeLeaveBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EmployeeLeaveController());
  }
}
