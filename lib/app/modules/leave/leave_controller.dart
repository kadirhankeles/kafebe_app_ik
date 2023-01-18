import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/employee_leave_model.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/update_leave_model.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/employe_leave_service.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/update_leave_service.dart';

class LeaveController extends GetxController {
  EmployeeLeaveModel employeeLeaveModel = EmployeeLeaveModel();
  EmployeeLeaveService employeeLeaveService = EmployeeLeaveService();

  UpdateLeaveService updateLeaveService = UpdateLeaveService();
  UpdateLeaveModel updateLeaveModel = UpdateLeaveModel();

  RxBool isLoadingLeave = false.obs;

  RxInt pageController = 0.obs;

  @override
  void onInit() {
    getEmployeLeaveData();
    super.onInit();
  }

  getEmployeLeaveData() async {
    isLoadingLeave.value = false;
    employeeLeaveModel = (await employeeLeaveService.getEmployeLeaveService())!;
    if (employeeLeaveModel.data == null) {
      return null;
    } else {
      isLoadingLeave.value = true;
    }
  }

  getUpdateLeaveData(index) async {
    updateLeaveModel = await updateLeaveService.getUpdateLeave(
      employeeLeaveModel.data!.employeeLeaveList![index].iDEMPLOYEEVACATION,
    );
  }
}
