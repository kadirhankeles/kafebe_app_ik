import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:kafebe_app_ik/app/modules/leaveAdd/leave_add_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LeaveAddScreen extends GetView<LeaveAddController> {
  LeaveAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff850000),
          centerTitle: true,
          title: Text("İzin Talebi"),
        ),
        backgroundColor: Colors.grey.shade300,
        body: Container(
          margin: EdgeInsets.all(2.3.h),
          child: Obx(
            () => controller.isLoading.value == true
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      titleTextWidget(
                        text: "İzin Türü",
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 1.h),
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(2.w),
                            border:
                                Border.all(color: Colors.black, width: 0.4)),
                        child: DropdownButton<int>(
                          borderRadius: BorderRadius.circular(5.w),
                          isExpanded: true,
                          hint: Container(
                            margin: EdgeInsets.only(left: 1.w),
                            child: Text(
                              controller.selectedValue.toString(),
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                          items: controller.leaveTypeModel!.data!
                              .map((vacationType) {
                            return DropdownMenuItem<int>(
                              value: vacationType.pICKLISTVACATIONTYPEID,
                              child:
                                  Text(vacationType.pICKLISTVACATIONTYPENAME!),
                              onTap: () {
                                controller.selectedValue.value = vacationType
                                    .pICKLISTVACATIONTYPENAME
                                    .toString();
                              },
                            );
                          }).toList(),
                          onChanged: (
                            selectedId,
                          ) {
                            // controller.selectedValue = newvalue ;
                            print("seçilen id =  ${selectedId}"); //id değeri
                          },
                        ),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      titleTextWidget(text: "İzin Başlangıç Tarihi"),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      GestureDetector(
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2030),
                            );
                            controller.selectedStartDate.value =
                                newDate.toString();
                          },
                          child: Container(
                            width: 90.w,
                            height: 5.h,
                            color: Colors.white70,
                            child: Obx(
                              () => Text(
                                controller.selectedStartDate.string,
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      titleTextWidget(text: "İzin Bitiş Tarihi"),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      GestureDetector(
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2030),
                            );
                            controller.selectedFinishDate.value =
                                newDate.toString();
                          },
                          child: Container(
                            width: 90.w,
                            height: 5.h,
                            color: Colors.white70,
                            child: Obx(
                              () => Text(
                                // controller.selectedFinishDate.substring(0, 10),
                                controller.selectedFinishDate.string,
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
          ),
        ));
  }
}

//bu textleri container ile sarıp margin vererek sürekli sizedbox vermekten kurtulabiliriz!
//tarih seçimlerine null kontrolü yapılacak!

class titleTextWidget extends StatelessWidget {
  const titleTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
