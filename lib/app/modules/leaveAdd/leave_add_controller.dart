import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/Leave/leave_types_model.dart';
import 'package:kafebe_app_ik/app/data/services/Leave/leave_types_service.dart';

class LeaveAddController extends GetxController {
  LeaveTypeModel? leaveTypeModel;

  Duration? duration;

  RxString selectedValue = "Seçiniz...".obs;
  RxBool isLoading = false.obs;
  RxString selectedStartDate = "-".obs;
  RxString selectedFinishDate = "-".obs;
  DateTime? leaveDay;
  DateTime? tempStartDate;
  DateTime? tempFinishDate;
  DateTime? jobStart;

  @override
  void onInit() async {
    await getLeaveTypesData();

    super.onInit();
  }

  getLeaveTypesData() async {
    isLoading.value = false;
    leaveTypeModel = await LeaveTypesService().getLeaveTypes();
    isLoading.value = true;
  }

//işe başlama tarihini veren ve cumartesi,pazar durumunda güne ekleme yapan fonksiyon
  String nextWorkDay(DateTime selectedDate, jobStart) {
    if (selectedDate.runtimeType == DateTime ||
        jobStart.runtimeType == DateTime) {
      DateTime nextDay = selectedDate.add(Duration(days: 1));
      while (nextDay.weekday == 7 || nextDay.weekday == 6) {
        nextDay = nextDay.add(Duration(days: 1));
      }
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
