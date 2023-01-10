import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/models/payroll_data_model.dart';
import '../../data/models/payroll_period_model.dart';
import '../../data/services/payroll_month_service.dart';

class PayrollViewController extends GetxController {
  PayrollMonthService monthService = PayrollMonthService();
  Uint8List? resultData;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  getData() async {
    try {
      isLoading.value = false;
      PayrollDataModel? payrollData =
          await monthService.getPayrollPeriodMonth();
      print("payrolldata: $payrollData");

      Uint8List? bytes = base64.decode(payrollData!.data.toString());
      resultData = bytes;
      isLoading.value = true;
    } catch (e) {
      print("controller: null");
    }
  }
}
