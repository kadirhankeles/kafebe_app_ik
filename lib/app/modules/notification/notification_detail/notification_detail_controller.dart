import 'package:get/get.dart';

class NotificationDetailController extends GetxController {
  RxString title = "".obs;
  RxString body = "".obs;
  @override
  void onInit() {
    dynamic arguments = Get.arguments;
    title.value = arguments[0]["title"];
    body.value = arguments[1]["body"];
    super.onInit();
  }
}
