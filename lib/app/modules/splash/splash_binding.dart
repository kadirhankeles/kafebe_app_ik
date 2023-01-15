import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(() => SplashController());
  }

}