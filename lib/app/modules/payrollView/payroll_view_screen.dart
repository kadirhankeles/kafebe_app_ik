import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/payrollView/payroll_view_binding.dart';
import 'package:kafebe_app_ik/app/modules/payrollView/payroll_view_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PayrollViewScreen extends GetView<PayrollViewController> {
  const PayrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Scaffold(
            body: Obx(() => controller.isLoading == true
                ? SfPdfViewer.memory(
                    controller.resultData!,
                    initialZoomLevel: 2,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ))));
  }
}
