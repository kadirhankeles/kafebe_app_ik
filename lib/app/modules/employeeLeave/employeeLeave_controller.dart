


import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/employee_leave_model.dart';
import 'package:kafebe_app_ik/app/data/services/approval/getEmployeesLeaveByPastMonth_service.dart';

class EmployeeLeaveController extends GetxController {
 EmployeeLeaveModel? employeeLeaveModel;
 RxBool isLoading = false.obs;
  @override
  void onInit() async{
    dynamic argumentData = Get.arguments;
    getEmployeeLeaveData(argumentData[0]['id'],argumentData[1]['month']);
   //getEmployeeLeaveData(249, 12);
  }
 
  getEmployeeLeaveData(String idMaster, String month) async{
    isLoading.value=false;
    employeeLeaveModel = await GetEmployeesLeaveByPastMonth().getEmployeesLeaveByPastMonth(idMaster,month);
    isLoading.value=true;
  }
}
