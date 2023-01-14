import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/notification_list_model.dart';
import 'package:kafebe_app_ik/app/data/services/notification/get_push_messages_service.dart';

class NotificationController extends GetxController {
  NotificationListModel? notificationListModel;
  RxBool hasData = false.obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    getPushMessagesData();

    super.onInit();
  }

  getPushMessagesData() async {
    isLoading.value = false;
    hasData.value = false;
    notificationListModel =
        await NotificationListService().getPushMessagesService();
    isLoading.value = true;
    if (notificationListModel!.data!.isNotEmpty) {
      hasData.value = true;
    }
  }
}
