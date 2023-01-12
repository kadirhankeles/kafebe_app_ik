import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/notification_list_model.dart';
import 'package:kafebe_app_ik/app/data/services/notification/get_push_messages_service.dart';

class NotificationController extends GetxController {
  NotificationListModel? notificationListModel;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    getPushMessagesData();
    // await NotificationListService().getPushMessagesService();

    super.onInit();
  }

  getPushMessagesData() async {
    isLoading.value = false;
    notificationListModel =
        await NotificationListService().getPushMessagesService();

    isLoading.value = true;
  }
}
