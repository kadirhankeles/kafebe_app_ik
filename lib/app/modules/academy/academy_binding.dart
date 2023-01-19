import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/academy/academy_controller.dart';

class AcademyBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AcademyController());
  }
}