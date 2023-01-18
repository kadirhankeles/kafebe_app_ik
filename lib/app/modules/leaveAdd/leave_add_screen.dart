import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/leaveAdd/leave_add_controller.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LeaveAddScreen extends GetView<LeaveAddController> {
  const LeaveAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff850000),
          centerTitle: true,
          title: const Text("İzin Talebi"),
        ),
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(2.h),
            child: Container(
              decoration: AppConstant.homeButton,
              child: Obx(
                () => controller.isLoading.value == true
                    ? Padding(
                      padding:  EdgeInsets.all(2.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const TitleTextWidget(
                              text: "İzin Türü",
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  border:
                                      Border.all(color: Colors.black, width: 0.4)),
                              child: DropdownButton<int>(
                                borderRadius: BorderRadius.circular(3.w),
                                isExpanded: true,
                                hint: Container(
                                  margin: EdgeInsets.only(left: 1.w),
                                  child: Text(
                                    controller.selectedValue.toString(),
                                    style: const TextStyle(color: Colors.black87),
                                  ),
                                ),
                                items: controller.leaveTypeModel!.data!
                                    .map((vacationType) {
                                  return DropdownMenuItem<int>(
                                    value: vacationType.pICKLISTVACATIONTYPEID,
                                    child: Text(
                                        vacationType.pICKLISTVACATIONTYPENAME!),
                                    onTap: () {
                                      controller.selectedValue.value = vacationType
                                          .pICKLISTVACATIONTYPENAME
                                          .toString();
                              
                                      controller.selectedLeaveID!.value =
                                          vacationType.pICKLISTVACATIONTYPEID!;
                                    },
                                  );
                                }).toList(),
                                onChanged: (selectedId) {
                                  print(
                                      "seçilen id =  ${controller.selectedLeaveID}"); //id değeri
                                },
                              ),
                            ),
                            const CustomDivider(),
                            const TitleTextWidget(text: "İzin Başlangıç Tarihi"),
                            GestureDetector(
                                onTap: () async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2030),
                                    // locale: Locale('tr', 'TR'),
                                  );
                              
                                  if (newDate != null) {
                                    controller.tempStartDate = newDate;
                                    var x = newDate.toString().split(' ')[0];
                              
                                    List<String> startDateParts = x.split('-');
                                    controller.selectedStartDate.value =
                                        '${startDateParts[2]}.${startDateParts[1]}.${startDateParts[0]}';
                                  }
                                  controller.deleteData();
                                  controller.tempFinishDate = null;
                                },
                                child: CustomContainerDate(
                                    obxValue: Obx(
                                  () => TitleTextWidget(
                                      text: controller.selectedStartDate.string),
                                ))),
                            const CustomDivider(),
                            const TitleTextWidget(text: "İzin Bitiş Tarihi"),
                            GestureDetector(
                              onTap: () async {
                                if (controller.selectedStartDate.value == "-") {
                                  Get.snackbar('Uyarı', "Başlangıç Değeri Giriniz");
                                } else {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: controller.tempStartDate!,
                                    firstDate: controller.tempStartDate!,
                                    lastDate: DateTime(2030),
                                    // locale: Locale('tr', 'TR'),
                                  );
                              
                                  if (newDate.runtimeType == DateTime) {
                                    controller.tempFinishDate = newDate;
                                    if (controller.tempStartDate!.compareTo(
                                            controller.tempFinishDate!) !=
                                        1) {
                                      var x = newDate.toString().split(' ')[0];
                                      List<String> finishDateParts = x.split('-');
                                      controller.selectedFinishDate.value =
                                          '${finishDateParts[2]}.${finishDateParts[1]}.${finishDateParts[0]}';
                                    }
                                  }
                                }
                              },
                              child: CustomContainerDate(
                                  obxValue: Obx(
                                () => TitleTextWidget(
                                    text: controller.selectedFinishDate.string),
                              )),
                            ),
                            const CustomDivider(),
                            const TitleTextWidget(text: "İşe Başlama Tarihi"),
                            CustomContainerDate(
                              color: Colors.grey,
                              obxValue: Obx(
                                () => TitleTextWidget(
                                    text: controller.selectedFinishDate.value == "-"
                                        ? "-"
                                        : controller
                                            .nextWorkDay(controller.tempFinishDate!,
                                                controller.jobStart)
                                            .toString()),
                              ),
                            ),
                            const CustomDivider(),
                            const TitleTextWidget(text: "İzin Gün Sayısı"),
                            CustomContainerDate(
                              color: Colors.grey,
                              obxValue: Obx(
                                () => TitleTextWidget(
                                    text: controller.selectedFinishDate.value == "-"
                                        ? "-"
                                        : daysOff(controller.tempStartDate!,
                                                controller.leaveDay!)
                                            .toString()),
                              ),
                            ),
                            const CustomDivider(),
                            const TitleTextWidget(
                                text: "İzni Geçireceği Adres/Telefon"),
                            Container(
                              margin: EdgeInsets.only(left: 1.w, right: 1.w),
                              width: 100.w,
                              height: 10.h,
                              color: Colors.white70,
                              child: TextFormField(
                                controller: controller.textAddresController,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Lütfen adres girin";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const CustomDivider(),
                            const TitleTextWidget(text: "Açıklama"),
                            Container(
                              margin: EdgeInsets.only(left: 1.w, right: 1.w),
                              width: 100.w,
                              height: 10.h,
                              color: Colors.white70,
                              child: TextFormField(
                                controller: controller.textCommentController,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Lütfen açıklama girin";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const CustomDivider(),
                            Container(
                                margin: EdgeInsets.only(bottom: 1.h),
                                width: 100.w,
                                height: 6.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xff850000),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        if (controller.sendControl() == true) {
                                          await controller.getWorkStartDateData();
                                          await controller.getSendForApprovalData();
                                          controller.deleteValues();
                                        }
                                      },
                                      child: Center(
                                        child: Text(
                                          "Uygula",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ))),
                          ],
                        ),
                    )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff7f0000),
                        ),
                      ),
              ),
            ),
          ),
        ));
  }
}

class CustomContainerDate extends StatelessWidget {
  const CustomContainerDate({
    Key? key,
    required this.obxValue,
    this.color = Colors.white70,
  }) : super(key: key);
  final Obx obxValue;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(width: 100.w, height: 5.h, color: color, child: obxValue);
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.3.w,
      height: 2.h,
      color: Colors.grey,
    );
  }
}

//bu textleri container ile sarıp margin vererek sürekli sizedbox vermekten kurtulabiliriz!
//tarih seçimlerine null kontrolü yapılacak!

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h, top: 1.3.h, left: 1.w),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
