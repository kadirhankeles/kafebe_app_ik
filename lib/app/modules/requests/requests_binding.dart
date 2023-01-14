

import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/requests/requests_controller.dart';

class RequestsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RequestsController());
  }
}
