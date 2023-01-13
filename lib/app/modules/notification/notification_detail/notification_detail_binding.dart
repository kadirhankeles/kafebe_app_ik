import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/notification/notification_detail/notification_detail_controller.dart';

class NotificationDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NotificationDetailController());
  }
}
