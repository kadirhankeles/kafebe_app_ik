import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kafebe_app_ik/app/modules/leave/leave_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/app_pages.dart';

class LeaveScreen extends GetView<LeaveController> {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Obx(
          () => Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff850000),
              centerTitle: true,
              title: const Text("İzin Talebi"),
              actions: [
                controller.pageController.value == 1
                    ? IconButton(onPressed: () {}, icon: Icon(Icons.search))
                    : controller.pageController.value == 0
                        ? IconButton(
                            onPressed: () {
                              // Get.toNamed(Routes.LEAVE_ADD);
                            },
                            icon: Icon(Icons.add))
                        : IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.filter_alt_rounded))
              ],
              bottom: TabBar(
                  onTap: (value) {
                    controller.pageController.value = value;
                    print(value);
                  },
                  indicatorWeight: 1.w,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(
                      text: 'İzinlerim',
                    ),
                    Tab(
                      text: 'Çalışan İzinleri',
                    ),
                    Tab(
                      text: 'İzin Takvimi',
                    ),
                  ]),
            ),
            backgroundColor: Colors.grey.shade300,
            body: TabBarView(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2.h),
                      width: 100.w,
                      height: 16.h,
                      color: Colors.white10,
                      child: Obx(() => controller.isLoadingLeave.value == true
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TitleTextWidget(
                                        text: "Yıllık İzin Bakiyesi"),
                                    ValueTextWidget(
                                        color: controller
                                                    .employeeLeaveModel
                                                    .data!
                                                    .employeeEarnedRightsList![
                                                        0]
                                                    .aNNUALLEAVEBALANCE <
                                                0
                                            ? Colors.red
                                            : Colors.black,
                                        value: controller
                                            .employeeLeaveModel
                                            .data!
                                            .employeeEarnedRightsList![0]
                                            .aNNUALLEAVEBALANCE
                                            .toString()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TitleTextWidget(
                                      text: "İlgili Yıl İzin Hakediş Tarihi",
                                    ),
                                    ValueTextWidget(
                                      value: DateFormat('dd.MM.yyyy').format(
                                          DateTime.parse(controller
                                              .employeeLeaveModel
                                              .data!
                                              .employeeEarnedRightsList![0]
                                              .nEXTLEAVEALLOWANCEDATE
                                              .toString())),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TitleTextWidget(
                                        text:
                                            "İlgili Yıl İzin Hakediş Gün Sayısı"),
                                    ValueTextWidget(
                                      value: controller
                                          .employeeLeaveModel
                                          .data!
                                          .employeeEarnedRightsList![0]
                                          .nEXTLEAVEALLOWANCEDAYS
                                          .toString(),
                                    )
                                  ],
                                ),
                              ],
                            )
                          : Center(child: CircularProgressIndicator())),
                    ),
                    Expanded(
                        child: Obx(() => controller.isLoadingLeave.value == true
                            ? ListView.builder(
                                itemCount: controller.employeeLeaveModel.data!
                                    .employeeLeaveList!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.LEAVE_DETAIL,
                                          arguments: [
                                            {
                                              'listname': controller
                                                  .employeeLeaveModel
                                                  .data!
                                                  .employeeLeaveList![index]
                                                  .pICKLISTVACATIONTYPENAME
                                                  .toString()
                                            },
                                            {
                                              'sdate': controller
                                                  .employeeLeaveModel
                                                  .data!
                                                  .employeeLeaveList![index]
                                                  .sDATE
                                                  .toString()
                                            },
                                            {
                                              'edate': controller
                                                  .employeeLeaveModel
                                                  .data!
                                                  .employeeLeaveList![index]
                                                  .eDATE
                                                  .toString()
                                            },
                                            {
                                              'wdate': controller
                                                  .employeeLeaveModel
                                                  .data!
                                                  .employeeLeaveList![index]
                                                  .wDATE
                                                  .toString()
                                            },
                                            {
                                              'day': controller
                                                  .employeeLeaveModel
                                                  .data!
                                                  .employeeLeaveList![index]
                                                  .dAY
                                                  .toString()
                                            },
                                            {
                                              'address': controller
                                                  .employeeLeaveModel
                                                  .data!
                                                  .employeeLeaveList![index]
                                                  .aDDRESS
                                                  .toString()
                                            },
                                            {
                                              'comment': controller
                                                  .employeeLeaveModel
                                                  .data!
                                                  .employeeLeaveList![index]
                                                  .cOMMENT
                                                  .toString()
                                            }
                                          ]);
                                    },
                                    child: Container(
                                      // padding: EdgeInsets.all(1.5.h),
                                      margin: EdgeInsets.all(0.3.h),
                                      width: 100.w,
                                      height: 14.h,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ValueTextWidget(
                                                  value:
                                                      "${controller.employeeLeaveModel.data!.employeeLeaveList![index].pICKLISTVACATIONTYPENAME}"),
                                              ValueTextWidget(
                                                  value:
                                                      "${DateFormat('dd.MM.yyyy').format(DateTime.parse(controller.employeeLeaveModel.data!.employeeLeaveList![index].sDATE.toString()))} - ${DateFormat('dd.MM.yyyy').format(DateTime.parse(controller.employeeLeaveModel.data!.employeeLeaveList![index].eDATE.toString()))}"),
                                              SizedBox(
                                                child: controller
                                                            .employeeLeaveModel
                                                            .data!
                                                            .employeeLeaveList![
                                                                index]
                                                            .bUTTONTYPE ==
                                                        "thumbs-up"
                                                    ? TextButton.icon(
                                                        onPressed: () {
                                                          Get.dialog(
                                                              AlertDialog(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white
                                                                          .withOpacity(
                                                                              .9),
                                                                  content:
                                                                      SizedBox(
                                                                          height: 19.5
                                                                              .h,
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                "İzin Kullanım Bilgisi Güncelleme",
                                                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 1.h,
                                                                              ),
                                                                              Text(
                                                                                "${DateFormat('dd.MM.yyyy').format(DateTime.parse(controller.employeeLeaveModel.data!.employeeLeaveList![index].sDATE.toString()))} - ${DateFormat('dd.MM.yyyy').format(DateTime.parse(controller.employeeLeaveModel.data!.employeeLeaveList![index].eDATE.toString()))} tarihleri arasındaki iznin kullanım bilgisi 'Kullandım' olarak güncellenecektir. Onaylıyor musunuz?",
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  TextButton(
                                                                                      onPressed: () {
                                                                                        Get.back();
                                                                                      },
                                                                                      child: Text(
                                                                                        "VAZGEÇ",
                                                                                        style: TextStyle(
                                                                                          color: Color(0xff7f0000),
                                                                                        ),
                                                                                      )),
                                                                                  TextButton(
                                                                                      onPressed: () {
                                                                                        controller.getUpdateLeaveData(index);
                                                                                        controller.getEmployeLeaveData();
                                                                                        Get.back();
                                                                                      },
                                                                                      child: Text(
                                                                                        "TAMAM",
                                                                                        style: TextStyle(
                                                                                          color: Colors.green,
                                                                                        ),
                                                                                      )),
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ))));
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: Colors.red,
                                                        ),
                                                        label: Text(
                                                          "Kullanmadım",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.red),
                                                        ))
                                                    : controller
                                                                .employeeLeaveModel
                                                                .data!
                                                                .employeeLeaveList![
                                                                    index]
                                                                .bUTTONTYPE ==
                                                            "check"
                                                        ? ValueTextWidget(
                                                            value: 'Kullandım',
                                                            color: Colors.green,
                                                          )
                                                        : ValueTextWidget(
                                                            value: '',
                                                          ),
                                              )
                                            ],
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                //textbutton izin süresi
                                              },
                                              child: Text(
                                                controller
                                                    .employeeLeaveModel
                                                    .data!
                                                    .employeeLeaveList![index]
                                                    .dAY
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                  ;
                                },
                              )
                            : Center(child: CircularProgressIndicator())))
                  ],
                ),
                Icon(Icons.directions_transit, size: 350),
                Icon(Icons.directions_car, size: 350),
              ],
            ),
          ),
        ));
  }
}

class ValueTextWidget extends StatelessWidget {
  const ValueTextWidget(
      {Key? key, required this.value, this.color = Colors.black})
      : super(key: key);
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context)
          .textTheme
          .bodyText2!
          .copyWith(fontSize: 16.5, color: color),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 16.5.sp,
          ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
