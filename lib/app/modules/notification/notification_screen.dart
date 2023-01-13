import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:kafebe_app_ik/app/modules/notification/notification_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/app_pages.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

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
            IconButton(
                onPressed: () {
                  //tüm bildirimleri sil butonu
                },
                icon: const Icon(Icons.delete_forever))
          ],
        ),
        body: Obx(() => controller.isLoading.value == true
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.notificationListModel!.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (controller.notificationListModel!.data![index]
                                    .rEQDIRECTION ==
                                1) {
                              print("req 1 -> TaleplerimDetaySayfasınaGidecek");
                              // Get.toNamed(TaleplerimDetaySayfasıYazılacak,arguments:["idMaster":controller
                              // .notificationListModel!.data![index].iDMASTER]);
                            } else if (controller.notificationListModel!
                                    .data![index].rEQDIRECTION ==
                                2) {
                              if (controller.notificationListModel!.data![index]
                                      .rEQTYPE ==
                                  6) {
                                print(
                                    "req 2 --> reqtype 6 --> taleplerim detay");
                                // Get.toNamed(TaleplerimDetaySayfasıYazılacak,arguments:["idMaster":controller
                                // .notificationListModel!.data![index].iDMASTER]),
                              } else {
                                print(
                                    "req2 --> reqtype else --> onaylarım detay");
                                // Get.toNamed(OnaylarımDetaySayfasıYazılacak,arguments:["idMaster":controller
                                // .notificationListModel!.data![index].iDMASTER]),

                              }
                            } else {
                              Get.toNamed(Routes.NOTIFICATION_DETAIL,
                                  arguments: [
                                    {
                                      "title": controller.notificationListModel!
                                          .data![index].mESSAGETITLE!
                                    },
                                    {
                                      "body": controller.notificationListModel!
                                          .data![index].mESSAGEBODY!
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
                                  .data![index].iSREAD)!),
                        );
                      },
                    ),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
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
  }) : super(key: key);
  final String date;
  final String title;
  final String message;

  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.3.h, vertical: 1.3.h),
      padding: EdgeInsets.all(1.h),
      width: 95.w,
      height: 12.h,
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(3.w)),
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
                    title: "Dikkat!",
                    middleText: "Bildirimi Silmek Üzeresiniz",
                    confirm: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Vazgeç")),
                    cancel: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () async {
                          Get.back();
                          Get.snackbar("Başarılı", "Bildirim Silindi",
                              overlayBlur: 1.1,
                              barBlur: 30,
                              duration: Duration(milliseconds: 900));
                        },
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
