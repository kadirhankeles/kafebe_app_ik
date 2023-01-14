import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/requests_detail/request_detail_controller.dart';


class RequestDetailBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(RequestDetailController());
  }

}