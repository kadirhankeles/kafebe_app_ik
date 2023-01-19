import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:kafebe_app_ik/app/data/services/notification/bulk_delete_messages_services.dart';
import 'package:kafebe_app_ik/app/data/services/notification/read_push_messages_service.dart';
import 'package:kafebe_app_ik/app/modules/notification/notification_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../data/services/notification/delete_push_messages_service.dart';
import '../../routes/app_pages.dart';
import '../approval_detail/approval_detail_screen.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  deleteFunction(index) async {
    {
      print("onpressed");

      await DeletePushMessagesService().deletePushMessages(controller
          .notificationListModel!.data![index].iDPUSHNOTIFICATIONDETAIL);
      controller.getPushMessagesData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff850000),
          title: Center(
            child: Text(
              "Bildirimler",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          actions: [
            Obx(() => controller.hasData.value == true
                ? IconButton(
                    onPressed: () {
                      Get.dialog(AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
                          actionsAlignment: MainAxisAlignment.center,
                          title: Center(child: Text("Dikkat!")),
                          actions: [
                            Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green),
                                        onPressed: () async{
                                          BulkDeleteMessagesService()
                                              .bulkDeleteMessages(2);
                                          await controller.getPushMessagesData();
                                          Get.back();
                                        },
                                        child: const Text("Hepsini Sil!")),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green),
                                        onPressed: () async{
                                          BulkDeleteMessagesService()
                                              .bulkDeleteMessages(1);
                                         await controller.getPushMessagesData();
                                          Get.back();
                                        },
                                        child: const Text(
                                            "Sadece Okunanları  Sil!")),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text("Vazgeç!")),
                                  ]),
                            ),
                          ]));
                    },
                    icon: const Icon(Icons.delete_forever),
                  )
                : Text(""))
          ],
        ),
        body: Obx(() => controller.isLoading.value == true
            ? controller.hasData.value == true
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount:
                              controller.notificationListModel!.data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                ReadPushMessagesService().readPushMessages(
                                    controller.notificationListModel!
                                        .data![index].iDPUSHNOTIFICATIONDETAIL);
                                controller.getPushMessagesData();

                                if (controller.notificationListModel!
                                        .data![index].rEQDIRECTION ==
                                    1) {
                                  print(
                                      "req 1 -> TaleplerimDetaySayfasınaGidecek");
                                  Get.toNamed(Routes.REQUESTSDETAIL,
                                      arguments: [
                                        {
                                          "id": controller
                                              .notificationListModel!
                                              .data![index]
                                              .iDMASTER
                                              .toString(),
                                        },
                                        {
                                          "detail": controller
                                              .notificationListModel!
                                              .data![index]
                                              .iDPUSHNOTIFICATIONDETAIL
                                              .toString()
                                        }
                                      ]);
                                } else if (controller.notificationListModel!
                                        .data![index].rEQDIRECTION ==
                                    2) {
                                  if (controller.notificationListModel!
                                          .data![index].rEQTYPE ==
                                      6) {
                                    print(
                                        "req 2 --> reqtype 6 --> taleplerim detay");
                                    Get.toNamed(Routes.REQUESTSDETAIL,
                                        arguments: [
                                          {
                                            "id": controller
                                                .notificationListModel!
                                                .data![index]
                                                .iDMASTER
                                                .toString(),
                                          },
                                          {
                                            "detail": controller
                                                .notificationListModel!
                                                .data![index]
                                                .iDPUSHNOTIFICATIONDETAIL
                                                .toString()
                                          }
                                        ]);
                                  } else {
                                    print(
                                        "req2 --> reqtype else --> onaylarım detay");

                                    Get.toNamed(Routes.APPROVALDETAIL,
                                        arguments: [
                                          {
                                            "id": controller
                                                .notificationListModel!
                                                .data![index]
                                                .iDMASTER
                                                .toString()
                                          },
                                          {
                                            "detail": controller
                                                .notificationListModel!
                                                .data![index]
                                                .iDPUSHNOTIFICATIONDETAIL
                                                .toString()
                                          }
                                        ]);
                                  }
                                } else {
                                  Get.toNamed(Routes.NOTIFICATION_DETAIL,
                                      arguments: [
                                        {
                                          "title": controller
                                              .notificationListModel!
                                              .data![index]
                                              .mESSAGETITLE!
                                        },
                                        {
                                          "body": controller
                                              .notificationListModel!
                                              .data![index]
                                              .mESSAGEBODY!
                                        }
                                      ]);
                                }
                              },
                              child: NotificationWidget(
                                date: DateTime.parse(
                                  controller.notificationListModel!.data![index]
                                      .nOTIFICATIONDATE!,
                                ).toString().substring(0, 16),
                                title: controller.notificationListModel!
                                    .data![index].mESSAGETITLE!,
                                message: controller.notificationListModel!
                                    .data![index].mESSAGEBODY!,
                                isRead: (controller.notificationListModel!
                                    .data![index].iSREAD)!,
                                onPressedDelete: () {
                                  deleteFunction(index);
                                  Get.back();
                                },
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Text(
                    "Kayıt Yok!",
                    style: Theme.of(context).textTheme.headline5,
                  ))
            : const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff7f0000),
                ),
              )));
  }
}

//develop branchinde ortak widgetlara eklenecek!

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
    this.date = "-",
    this.title = "-",
    this.message = "-",
    required this.isRead,
    required this.onPressedDelete,
  }) : super(key: key);
  final String date;
  final String title;
  final String message;
  final Callback onPressedDelete;

  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.3.h, vertical: 1.3.h),
      padding: EdgeInsets.all(1.h),
      width: 95.w,
      height: 12.h,
      decoration: BoxDecoration(
          color: Colors.white60,  borderRadius: BorderRadius.circular(3.w) ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10.w,
            child: Icon(Icons.mail,
                color: isRead == false ? Colors.red : Colors.grey),
          ),
          Container(
            margin: EdgeInsets.only(left: 1.w),
            width: 63.w,
            height: 10.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NotificationTextWidget(text: date),
                NotificationTextWidget(
                  text: title,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                NotificationTextWidget(text: message),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
            child: IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    radius: 2.w,
                    title: "Dikkat!",
                    middleText: "Bildirimi Silmek Üzeresiniz",
                    cancel: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Vazgeç")),
                    confirm: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: onPressedDelete,
                        child: const Text("Onayla")),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.grey,
                )),
          )
        ],
      ),
    );
  }
}

class NotificationTextWidget extends StatelessWidget {
  const NotificationTextWidget({
    Key? key,
    required this.text,
    this.color = Colors.black87,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);
  final String text;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: color, fontWeight: fontWeight),
    );
  }
}
