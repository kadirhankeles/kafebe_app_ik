import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/employee_leave_model.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/sub_employee_leave_model.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/update_leave_model.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/employe_leave_service.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/sub_employee_leave_service.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/update_leave_service.dart';

class LeaveController extends GetxController {
  EmployeeLeaveModel employeeLeaveModel = EmployeeLeaveModel();
  EmployeeLeaveService employeeLeaveService = EmployeeLeaveService();

  UpdateLeaveService updateLeaveService = UpdateLeaveService();
  UpdateLeaveModel updateLeaveModel = UpdateLeaveModel();

  SubEmployeeLeaveService subEmployeeLeaveService = SubEmployeeLeaveService();
  SubEmployeeLeaveModel subEmployeeLeaveModel = SubEmployeeLeaveModel();

  RxBool isLoadingLeave = false.obs;
  RxBool isLoadingSub = false.obs;

  RxInt root = 0.obs;

  RxInt pageController = 0.obs;
  // RxInt idHr = 0.obs;

  @override
  void onInit() async {
    await getEmployeLeaveData();
    await getSubEmployeeLeaveData();
    super.onInit();
  }

  getEmployeLeaveData() async {
    isLoadingLeave.value = false;
    employeeLeaveModel = (await employeeLeaveService.getEmployeLeaveService())!;
    if (employeeLeaveModel.data == null) {
      return null;
    } else {
      // idHr.value=
      isLoadingLeave.value = true;
    }
  }

  getUpdateLeaveData(index) async {
    updateLeaveModel = await updateLeaveService.getUpdateLeave(
      employeeLeaveModel.data!.employeeLeaveList![index].iDEMPLOYEEVACATION,
    );
  }

  getSubEmployeeLeaveData() async {
    isLoadingSub.value = false;
    subEmployeeLeaveModel = await subEmployeeLeaveService.getSubEmployeeLeave(
        employeeLeaveModel.data!.employeeLeaveList![0].iDHREMPLOYEE!);
    isLoadingSub.value = true;
  }
}
