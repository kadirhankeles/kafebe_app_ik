import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/language/language_controller.dart';

class LanguageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageController());
  }

}