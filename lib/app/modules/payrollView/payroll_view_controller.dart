import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/payroll_list_data_model.dart';

import '../../data/models/payroll_data_model.dart';
import '../../data/models/payroll_period_model.dart';
import '../../data/services/payroll_all_data_service.dart';
import '../../data/services/payroll_month_service.dart';

class PayrollViewController extends GetxController {
  PayrollMonthService monthService = PayrollMonthService();
  PayrollListDataModel? payrollListDataModel;
  RxString monthPayroll = "".obs;

  Uint8List? resultData;
  RxBool isLoading = false.obs;
  // int x = Get.parameters["index"] as int;
  // int y = Get.arguments["index"];

  getData(year, month, uid) async {
    try {
      isLoading.value = false;
      PayrollDataModel? payrollData =
          await monthService.getPayrollPeriodMonth(year, month, uid);
      print("payrolldata: $payrollData");

      Uint8List? bytes = base64.decode(payrollData!.data.toString());
      resultData = bytes;
      isLoading.value = true;
    } catch (e) {
      print("controller: null");
    }
  }

  @override
  void onInit() {
    dynamic arguments = Get.arguments;

    // print("y $y");
    print(arguments);
    getData(arguments[0]['year'], arguments[1]['month'], arguments[2]['uid']);
    monthPayroll.value = arguments[3]['period'];
    print(monthPayroll);

    super.onInit();
  }
}
