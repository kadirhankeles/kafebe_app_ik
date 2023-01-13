import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/payrollView/payroll_view_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PayrollViewScreen extends GetView<PayrollViewController> {
  const PayrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff850000),
          actions: [
            IconButton(
                onPressed: () async {
                  final temp = await getTemporaryDirectory();
                  final path = '${temp.path}/payroll.pdf';

                  final file = File(path);
                  file.writeAsBytesSync(controller.resultData!);
                  final xFile = XFile(path);
                  await Share.shareXFiles([xFile], text: 'Payroll');
                },
                icon: Icon(Icons.share))
          ],
        ),
        backgroundColor: Colors.white,
        body: Scaffold(
            body: Obx(() => controller.isLoading.value == true
                ? SfPdfViewer.memory(
                    controller.resultData!,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ))));
  }
}
