import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kafebe_app_ik/app/data/models/academy_model/academy_completed_model.dart';
import 'package:kafebe_app_ik/app/modules/academy/academy_controller.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AcademyScreen extends GetView<AcademyController> {
  const AcademyScreen({super.key});

  @override
  Widget build(BuildContext context) {
   // String statusString = "Tümü";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF4F5FA),
      appBar: AppBar(
        backgroundColor: AppConstant.loginBackground,
        title: Text("Sun Akademi"),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Get.dialog(AlertDialog(
        //             backgroundColor: Colors.white.withOpacity(.9),
        //             content: Container(
        //               height: 30.h,
        //               child: Column(
        //                 children: [
        //                   TextButton(
        //                       style: TextButton.styleFrom(
        //                         foregroundColor: Colors.black,
        //                       ),
        //                       onPressed: () async {
        //                         controller.activityIndex.value = 0;
        //                         await controller.getAcademyData();
        //                         // controller.educationCompleteStatusControl(
        //                         //     controller.statuCode[1]);
        //                         statusString = controller.statuString[1];
        //                         //  AcedemyCompletedModel completedModel2 = AcedemyCompletedModel(activitySuccessStatus2: activitySuccessStatus2, activityCompleteStatus2: activityCompleteStatus2)
        //                         // controller.addActivity2(activ2)

        //                         Get.back();
        //                       },
        //                       child: Text("Tamamlanan")),
        //                   TextButton(
        //                       style: TextButton.styleFrom(
        //                         foregroundColor: Colors.black,
        //                       ),
        //                       onPressed: () async {
        //                         controller.activityIndex.value = 1;
        //                         await controller.getAcademyData();
        //                         // controller.educationCompleteStatusControl(
        //                         //     controller.statuCode[2]);
        //                         statusString = controller.statuString[2];

        //                         Get.back();
        //                       },
        //                       child: Text("Tamamlanmadı")),
        //                   TextButton(
        //                       style: TextButton.styleFrom(
        //                         foregroundColor: Colors.black,
        //                       ),
        //                       onPressed: () async {
        //                         controller.activityIndex.value = 2;
        //                         await controller.getAcademyData();
        //                         statusString = controller.statuString[0];
        //                         Get.back();
        //                       },
        //                       child: Text("Tümü")),
        //                 ],
        //               ),
        //             )));
        //       },
        //       icon: Icon(Icons.filter_alt_rounded))
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 2.h, left: 2.h,),
        child: SingleChildScrollView(
          child: Container(
            height: 90.h,
              child: Obx(
                () => controller.isLoading.value == true
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.learningGlobalModel?.data
                            ?.talentActivityList?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 2.h),
                            height: 30.h,
                            width: 100.w,
                            decoration: AppConstant.homeButton,
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: 5.h,
                                          width: 10.w,
                                          child: Image.asset(
                                              "assets/my_jobs.png")),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${DateFormat('dd.MM.yyyy HH:mm').format(DateTime.parse(controller.learningGlobalModel!.data!.talentActivityList![index].aCTIVITYSTARTDATE.toString()))}", style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                                            // "16.02.2023 17:09 - 31.01.2023 23:59",
                                           /* "${controller.learningGlobalModel!.data!.talentActivityList![index].aCTIVITYSTARTDATE.toString().split("T").first}/${controller.learningGlobalModel!.data!.talentActivityList![index].aCTIVITYSTARTDATE.toString().split("T").last}-${controller.learningGlobalModel!.data!.talentActivityList![index].aCTIVITYENDDATE.toString().split("T").first}/${controller.learningGlobalModel!.data!.talentActivityList![index].aCTIVITYENDDATE.toString().split("T").last}",
                                            style:
                                                TextStyle(color: Colors.grey),*/
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          SizedBox(
                                            width: 65.w,
                                            child: Text(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              "${controller.learningGlobalModel?.data?.talentActivityList?[index].aCTIVITYNAME}",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.2.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 3.w,
                                      left: 1.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Puan",
                                          style: TextStyle(color: Colors.grey.shade500, fontSize: 13)
                                        ),
                                        Text(
                                          // "Completed Date",
                                          // "${controller.learningGlobalModel?.data?.talentActivityList?[index].cOMPLETIONDATE?.split("T").first ?? "_"}",
                                          //'${DateFormat("dd.MM.yyyy").format(DateTime.parse(controller.learningGlobalModel?.data?.talentActivityList?[index].cOMPLETIONDATE))}',
                                          // "${DateFormat('dd.MM.yyyy').format(DateTime.parse(controller.learningGlobalModel?.data?.talentActivityList?[index].cOMPLETIONDATE))}",
                                          controller
                                                      .learningGlobalModel!
                                                      .data!
                                                      .talentActivityList![
                                                          index]
                                                      .cOMPLETIONDATE ==
                                                  null
                                              ? "_"
                                              : '${DateFormat('dd.MM.yyyy').format(DateTime.parse(controller.learningGlobalModel!.data!.talentActivityList![index].cOMPLETIONDATE.toString()))}',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 2.h),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 1.2.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // "0",
                                          // "${controller.learningGlobalModel?.data?.talentActivityList?[index].aCTIVITYSCORE}"
                                          //     .substring(0, 3),
                                          controller
                                              .learningGlobalModel!
                                              .data!
                                              .talentActivityList![index]
                                              .aCTIVITYSCORE
                                              .toString()
                                              .split(".")
                                              .first,
                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        Text(
                                          "Durum",
                                          style:TextStyle(color: Colors.grey.shade500, fontSize: 13)
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Text(
                                          controller
                                              .learningGlobalModel!
                                              .data!
                                              .talentActivityList![index]
                                              .aCTIVITYCOMPLETESTATUSTXT
                                              .toString(),
                                          // "Tamamlanmamış",
                                          //   "${controller.educationCompleteStatusControl(controller.learningGlobalModel?.data?.talentActivityList?[index].aCTIVITYCOMPLETESTATUS)}",

                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        Text(
                                          "Başarı Durumu",
                                          style:TextStyle(color: Colors.grey.shade500, fontSize: 13)
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Text(
                                          controller
                                              .learningGlobalModel!
                                              .data!
                                              .talentActivityList![index]
                                              .aCTIVITYSUCCESSSTATUSTXT
                                              .toString(), //"Devam Ediyor",
                                          //  "${controller.educationSuccessStatusControl(controller.learningGlobalModel?.data?.talentActivityList?[index].aCTIVITYCOMPLETESTATUS)}",
                                        ),
                                      ],
                                    ),
                                  )
                                ], // buraaaaa
                              ),
                            ),
                          );
                        },
                      )
                    : Container(
                        child: Center(
                        child: CircularProgressIndicator(),
                      )),
              )),
        ),
      ),
    );
  }
}
