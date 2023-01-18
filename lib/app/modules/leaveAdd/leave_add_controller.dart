import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/employee_leave_model.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/leave_types_model.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/send_for_approval_model.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/work_start_date_model.dart';
import 'package:kafebe_app_ik/app/data/models/getLanding_PageInfo_model.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/employe_leave_service.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/leave_types_service.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/send_for_approval_service.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/work_start_date_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LeaveAddController extends GetxController {
  SendForApprovalService sendForApprovalService = SendForApprovalService();
  WorkStartDateService workStartDateService = WorkStartDateService();

  TextEditingController textAddresController = TextEditingController();
  TextEditingController textCommentController = TextEditingController();

  LeaveTypeModel? leaveTypeModel;
  GetLandingPageInfoModel? getLandingPageInfoModel;
  EmployeeLeaveModel? employeeLeaveModel;
  WorkStartDateModel? workStartDateModel;
  SendForApprovalModel? sendForApprovalModel;

  Duration? duration;
  double? izinHakedis = 30;

  RxBool isLoading = false.obs;
  RxBool isLoadingDate = false.obs;
  RxBool isLoadingApproval = false.obs;

  RxString selectedValue = "Seçiniz...".obs;
  RxString selectedStartDate = "-".obs;
  RxString selectedFinishDate = "-".obs;
  RxString startHour = "00.00".obs;
  RxString finisHour = "00.00".obs;

  DateTime? leaveDay;
  DateTime? tempStartDate;
  DateTime? tempFinishDate;
  DateTime? jobStart;

  RxInt? selectedLeaveID = 0.obs;
  RxInt? idHr = 0.obs;

  @override
  void onInit() async {
    await getLeaveTypesData();
    await getEmployeeLeaveData();

    dynamic arguments = Get.arguments;
    izinHakedis = arguments[0]["izin"];

    super.onInit();
  }

  getLeaveTypesData() async {
    isLoading.value = false;
    leaveTypeModel = await LeaveTypesService().getLeaveTypes();
    isLoading.value = true;
  }

  getEmployeeLeaveData() async {
    employeeLeaveModel = await EmployeeLeaveService().getEmployeLeaveService();
    idHr!.value =
        employeeLeaveModel!.data!.employeeEarnedRightsList![0].iDHREMPLOYEE!;
  }

  getWorkStartDateData() async {
    isLoadingDate.value = false;
    workStartDateModel = await workStartDateService.getWorkStartDateService(
      idHr!.value,
      selectedLeaveID!.value,
      tempStartDate.toString(),
      tempFinishDate.toString(),
    );
    isLoadingDate.value = true;
  }

  getSendForApprovalData() async {
    isLoadingApproval.value = false;
    sendForApprovalModel = await sendForApprovalService.sendForApproval(
      selectedLeaveID!.value,
      tempStartDate.toString(),
      tempFinishDate.toString(),
      workStartDateModel!.data!.wDATE.toString(),
      workStartDateModel!.data!.dAY,
      startHour.toString(),
      finisHour.toString(),
      textAddresController.text,
      textCommentController.text,
    );
    isLoadingApproval.value = true;
  }

  String nextWorkDay(DateTime selectedDate, jobStart) {
    if (selectedDate.runtimeType == DateTime ||
        jobStart.runtimeType == DateTime) {
      DateTime nextDay = selectedDate.add(const Duration(days: 1));
      leaveDay = nextDay;
      print(LeaveAddController().leaveDay);
      var x = nextDay.toString().split(' ')[0];
      List<String> finishDateParts = x.split('-');
      jobStart =
          '${finishDateParts[2]}.${finishDateParts[1]}.${finishDateParts[0]}';

      return jobStart;
    } else {
      return "-";
    }
  }

//izin başlangıç tarihine tekrar girince diğer verileri sıfırlamak için fonksiyon
  deleteData() {
    selectedFinishDate.value = "-";
  }

//20 değeri kullanıcının izin hakediş tarihi olarak güncellenecek
  bool sendControl() {
    if (selectedValue.value == "Seçiniz..." ||
        tempStartDate.runtimeType != DateTime ||
        tempFinishDate.runtimeType != DateTime) {
      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.white.withOpacity(.9),
          content: Container(
            height: 11.8.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hata",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text("Lütfen değerleri kontrol ediniz."),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "TAMAM",
                          style: TextStyle(
                            color: Color(0xff7f0000),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      );

      /* Get.snackbar(
        "Hata",
        "Lütfen Değerleri Kontrol Ediniz!",
      ); */
      return false;
    } else {
      if ((daysOff(tempStartDate!, leaveDay!) > izinHakedis!)) {
        Get.dialog(
          AlertDialog(
            backgroundColor: Colors.white.withOpacity(.9),
            content: Container(
              height: 12.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hata!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                      "Yeterli İzin Hakkınız Yok! (İzin Hakkınız: $izinHakedis)"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "TAMAM",
                            style: TextStyle(
                              color: Color(0xff7f0000),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
        /*  Get.snackbar("Hata!",
            "Yeterli İzin Hakkınız Yok! (İzin Hakkınız: $izinHakedis)"); */
        return false;
      }
    }

    return true;
  }

  deleteValues() {
    selectedValue.value = "Seçiniz...";
    selectedStartDate.value = "-";
    selectedFinishDate.value = "-";
    textAddresController.text = "";
    textCommentController.text = "";
  }
}

//izin gün sayısını hesaplama
int daysOff(DateTime start, DateTime end) {
  if (start.runtimeType == DateTime && end.runtimeType == DateTime) {
    Duration duration = end.difference(start);
    return duration.inDays;
  } else {
    return 0;
  }
}
