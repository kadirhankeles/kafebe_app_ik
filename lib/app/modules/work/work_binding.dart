import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/work/work_controller.dart';

class WorkBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WorkController());
  }
}
