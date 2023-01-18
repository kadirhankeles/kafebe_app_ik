import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/employee_detail_cv_model.dart';
import 'package:kafebe_app_ik/app/data/services/team/employee_detail_cv_service.dart';


class TeamDetailController extends GetxController {
  EmployeeDetailCV? employeeDetailCV;
  RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    dynamic argumentData = Get.arguments;
    employeeDetailCVData(argumentData[0]['idHR']);
    print(argumentData[0]['idHR']);
    super.onInit();
  }

  employeeDetailCVData(String idHR) async{
    isLoading.value=false;
    employeeDetailCV = await employeeDetailCVService(idHR);
    isLoading.value=true;

  }
 
 
}
