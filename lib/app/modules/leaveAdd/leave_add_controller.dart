import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/leave_types_model.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/leave_types_service.dart';

class LeaveAddController extends GetxController {
  LeaveTypeModel? leaveTypeModel;

  RxString selectedValue = "Seçiniz...".obs;
  RxBool isLoading = false.obs;
  RxString selectedStartDate = "-".obs;
  RxString selectedFinishDate = "-".obs;
  RxString startDay = "-".obs;
  RxString leaveDay = "-".obs;

  @override
  void onInit() async {
    await getLeaveTypesData();

    super.onInit();
  }

  getLeaveTypesData() async {
    isLoading.value = false;
    leaveTypeModel = await LeaveTypesService().getLeaveTypes();
    isLoading.value = true;
  }
}
