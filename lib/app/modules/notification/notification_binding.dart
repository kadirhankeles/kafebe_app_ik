import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/notification/notification_controller.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
  }
}
