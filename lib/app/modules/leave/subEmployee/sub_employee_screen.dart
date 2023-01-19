import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kafebe_app_ik/app/modules/leave/leave_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubEmployeeScreen extends GetView<LeaveController> {
  const SubEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff850000),
          title: Text(
              "${controller.subEmployeeLeaveModel.data!.employeeEarnedRightsList![controller.root.value].eMPLOYEENAME.toString().toUpperCase()} ${controller.subEmployeeLeaveModel.data!.employeeEarnedRightsList![controller.root.value].eMPLOYEESURNAME.toString().toUpperCase()}")),
      body: Column(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TitleTextWidget(text: "Yıllık İzin Bakiyesi"),
                          ValueTextWidget(
                              color: controller
                                          .subEmployeeLeaveModel
                                          .data!
                                          .employeeEarnedRightsList![
                                              controller.root.value]
                                          .aNNUALLEAVEBALANCE <
                                      0
                                  ? Colors.red
                                  : Colors.black,
                              value: controller
                                  .subEmployeeLeaveModel
                                  .data!
                                  .employeeEarnedRightsList![
                                      controller.root.value]
                                  .aNNUALLEAVEBALANCE
                                  .toString()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TitleTextWidget(
                            text: "İlgili Yıl İzin Hakediş Tarihi",
                          ),
                          ValueTextWidget(
                            value: DateFormat('dd.MM.yyyy').format(
                                DateTime.parse(controller
                                    .subEmployeeLeaveModel
                                    .data!
                                    .employeeEarnedRightsList![
                                        controller.root.value]
                                    .nEXTLEAVEALLOWANCEDATE
                                    .toString())),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TitleTextWidget(
                              text: "İlgili Yıl İzin Hakediş Gün Sayısı"),
                          ValueTextWidget(
                            value: controller
                                .subEmployeeLeaveModel
                                .data!
                                .employeeEarnedRightsList![
                                    controller.root.value]
                                .nEXTLEAVEALLOWANCEDAYS
                                .toString(),
                          )
                        ],
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: Color(0xff850000),
                  ))),
          ),
        ],
      ),
    );
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
