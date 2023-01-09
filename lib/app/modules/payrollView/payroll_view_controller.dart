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
    getData();
    super.onInit();
  }

  getData() async {
    try {
      isLoading.value = false;
      PayrollDataModel? payrollData = await monthService.getPayrollPeriodMonth(
          PayrollPeriodModel(
              year: 2021,
              month: 2,
              documentid: "e5fa86c3-2cd0-4ca2-b9b9-95b1c0e54544"));
      print(payrollData);

      Uint8List? bytes = base64.decode(payrollData!.data.toString());
      resultData = bytes;
      isLoading.value = true;
    } catch (e) {
      print("controller->null");
    }
  }
}
