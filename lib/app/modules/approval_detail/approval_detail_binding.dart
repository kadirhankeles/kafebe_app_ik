import 'package:get/get.dart';

import 'approval_detail_controller.dart';

class ApprovalDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ApprovalDetailController());
  }
}
