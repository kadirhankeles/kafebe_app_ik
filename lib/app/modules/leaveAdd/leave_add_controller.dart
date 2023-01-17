import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/employee_leave_model.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/leave_types_model.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/send_for_approval_model.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/work_start_date_model.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/employe_leave_service.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/leave_types_service.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/send_for_approval_service.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/work_start_date_service.dart';

class LeaveAddController extends GetxController {
  SendForApprovalService sendForApprovalService = SendForApprovalService();
  WorkStartDateService workStartDateService = WorkStartDateService();

  TextEditingController textAddresController = TextEditingController();
  TextEditingController textCommentController = TextEditingController();

  LeaveTypeModel? leaveTypeModel;
  EmployeeLeaveModel? employeeLeaveModel;
  WorkStartDateModel? workStartDateModel;
  SendForApprovalModel? sendForApprovalModel;

  Duration? duration;

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
        textAddresController.text,
        textCommentController.text,
        startHour.toString(),
        finisHour.toString());
    isLoadingApproval.value = true;
    // print('fdb --> ${sendForApprovalModel!.data!.mESSAGE}');
  }

//işe başlama tarihini veren ve cumartesi,pazar durumunda güne ekleme yapan fonksiyon
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

  bool daysOffCheck() {
    if (daysOff(tempStartDate!, leaveDay!) >= 20) {
      Get.snackbar("Dikkat!", "Girilen Değerleri Tekrar Gözden Geçirin");
      return false;
    } else {
      return true;
    }
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
