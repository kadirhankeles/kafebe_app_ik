import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kafebe_app_ik/app/modules/work/work_controller.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WorkScreen extends GetView<WorkController> {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5FA),
      appBar: AppBar(
        title: Text("İşlerim"),
        backgroundColor: Color(0xff7f0000),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.dialog(AlertDialog(
                    backgroundColor: Colors.white.withOpacity(.9),
                    content: Container(
                      height: 30.h,
                      child: Column(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getPendingJobsData("");
                                controller.statu.value = "Tümü";
                                Get.back();
                              },
                              child: Text("Tümü")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getPendingJobsData("1");
                                controller.statu.value = "Bekliyor";
                                Get.back();
                              },
                              child: Text("Bekliyor")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getPendingJobsData("2");
                                controller.statu.value = "Tamamlandı";
                                Get.back();
                              },
                              child: Text("Tamamlandı")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getPendingJobsData("5");
                                controller.statu.value = "Reddedildi";
                                Get.back();
                              },
                              child: Text("Reddedildi")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("Vazgeç")),
                        ],
                      ),
                    )));
              },
              icon: Icon(Icons.filter_alt_rounded))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 2.h, right: 2.h),
        child: Container(
          child: Obx(
            () => controller.isLoading == true&&
                          controller.getPendingJobsModel!.data!.totalCount != 0
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller
                        .getPendingJobsModel!.data!.pendingJobsList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 1.h, top: 1.5.h),
                        child: Container(
                          height: 25.h,
                          width: double.infinity,
                          decoration: AppConstant.homeButton,
                          child: Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 5.h,
                                      width: 5.h,
                                      child: Image.asset(
                                        "assets/islerim.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      "${DateFormat('dd.MM.yyyy H:m').format(DateTime.parse(controller.getPendingJobsModel!.data!.pendingJobsList![index].wORKCREATIONDATE.toString()))}",
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "İş No",
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 13),
                                ),
                                Text(
                                    "${controller.getPendingJobsModel!.data!.pendingJobsList![index].iDWORK}"),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  "Talep Eden",
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 13),
                                ),
                                Container(
                                    width: 75.w,
                                    child: Text(
                                      controller
                                                  .getPendingJobsModel!
                                                  .data!
                                                  .pendingJobsList![index]
                                                  .aSSIGNEMPLOYEE ==
                                              null
                                          ? " -"
                                          : "${controller.getPendingJobsModel!.data!.pendingJobsList![index].aSSIGNEMPLOYEE}",
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Text(
                                  "Durumu",
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 13),
                                ),
                                Text(controller
                                            .getPendingJobsModel!
                                            .data!
                                            .pendingJobsList![index]
                                            .wORKSTATUSNAME ==
                                        null
                                    ? " -"
                                    : "${controller.getPendingJobsModel!.data!.pendingJobsList![index].wORKSTATUSNAME}"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : controller.isLoading.value == true &&
                        controller.getPendingJobsModel!.data!.totalCount == 0
                    ? Container(
                        height: 75.h,
                        child: Center(
                          child: Text(
                            "Mevcut İş Kaydınız Bulunmamaktadır!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff7f0000),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : Container(
                        height: 75.h,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff7f0000),
                          ),
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
