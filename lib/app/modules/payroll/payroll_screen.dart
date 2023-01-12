import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/payroll/payroll_controller.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/app_pages.dart';

class PayrollScreen extends GetView<PayrollController> {
  const PayrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffcfd8dc),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Color(0xff850000),
              toolbarHeight: 7.h,
              elevation: 0,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              title: GestureDetector(
                onTap: () {
                  print("object");
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 8.w,
                    ),
                    Obx(() => controller.isLoading.value == true
                        ? Container(
                            width: 47.w,
                            child: Text(
                              "Bordrolarım",
                              style: AppConstant.payrollLastStyle,
                              textAlign: TextAlign.center,
                            ),
                          )
                        : const Center(child: CircularProgressIndicator())),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                  child: Obx(
                () => controller.isLoading.value == true
                    ? Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  right: 2.5.h, left: 2.5.h, top: 1.h),
                              child: Container(
                                  height: 100.h,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    //physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount: controller
                                        .payrollListDataModel!.data!.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                              Routes.PAYROLLVIEW,
                                              arguments: [
                                                {
                                                  "year": controller
                                                      .payrollListDataModel!
                                                      .data![index]
                                                      .dOCUMENTYEAR,
                                                },
                                                {
                                                  "month": controller
                                                      .payrollListDataModel!
                                                      .data![index]
                                                      .dOCUMENTMONTH,
                                                },
                                                {
                                                  "uid": controller
                                                      .payrollListDataModel!
                                                      .data![index]
                                                      .uID
                                                }
                                              ],
                                            );
                                          },
                                          child: Container(
                                              height: 7.h,
                                              margin: EdgeInsets.only(
                                                  bottom: 0.6.h),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                elevation: 6,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 6.w,
                                                    ),
                                                    Container(
                                                      height: 7.h,
                                                      width: 70.w,
                                                      padding: EdgeInsets.only(
                                                          top: 2.h),
                                                      child: Text(
                                                        controller
                                                            .payrollListDataModel!
                                                            .data![index]
                                                            .dOCUMENTPERIOD!,
                                                        style: AppConstant
                                                            .payrollStyle,
                                                      ),
                                                    ),
                                                    Icon(Icons
                                                        .arrow_forward_rounded)
                                                  ],
                                                ),
                                                semanticContainer: true,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                              )));
                                    },
                                  ))),
                        ],
                      )
                    : Center(child: CircularProgressIndicator()),
              )),
            )
          ],
        ));
  }
}
