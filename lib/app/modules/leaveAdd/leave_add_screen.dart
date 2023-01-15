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
          backgroundColor: const Color(0xff850000),
          centerTitle: true,
          title: const Text("İzin Talebi"),
        ),
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: SizedBox(
            child: Obx(
              () => controller.isLoading.value == true
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TitleTextWidget(
                          text: "İzin Türü",
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 1.w, right: 1.w),
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
                                style: const TextStyle(color: Colors.black87),
                              ),
                            ),
                            items: controller.leaveTypeModel!.data!
                                .map((vacationType) {
                              return DropdownMenuItem<int>(
                                value: vacationType.pICKLISTVACATIONTYPEID,
                                child: Text(
                                    vacationType.pICKLISTVACATIONTYPENAME!),
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
                              print("seçilen id =  $selectedId"); //id değeri
                            },
                          ),
                        ),
                        const CustomDivider(),
                        const TitleTextWidget(text: "İzin Başlangıç Tarihi"),
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
                            child: CustomContainerDate(
                                obxValue: Obx(
                              () => TitleTextWidget(
                                  text: controller.selectedStartDate.string),
                            ))),
                        const CustomDivider(),
                        const TitleTextWidget(text: "İzin Bitiş Tarihi"),
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
                          child: CustomContainerDate(
                              obxValue: Obx(
                            () => TitleTextWidget(
                                text: controller.selectedFinishDate.string),
                          )),
                        ),
                        const CustomDivider(),
                        const TitleTextWidget(text: "İşe Başlama Tarihi"),
                        CustomContainerDate(
                          obxValue: Obx(
                            () => TitleTextWidget(
                                text: controller.startDay.value),
                          ),
                        ),
                        const CustomDivider(),
                        const TitleTextWidget(text: "İzin Gün Sayısı"),
                        CustomContainerDate(
                          obxValue: Obx(
                            () => TitleTextWidget(
                                text: controller.leaveDay.value),
                          ),
                        ),
                        const CustomDivider(),
                        const TitleTextWidget(
                            text: "İzni Geçireceği Adres/Telefon"),
                        Container(
                          width: 100.w,
                          height: 10.h,
                          color: Colors.white70,
                          child: TextFormField(
                            maxLines: 5,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Lütfen adres girin";
                              }
                              return null;
                            },
                            // onSaved: (value) => _address = value,
                          ),
                        ),
                        const CustomDivider(),
                        const TitleTextWidget(text: "Açıklama"),
                        Container(
                          width: 100.w,
                          height: 10.h,
                          color: Colors.white70,
                          child: TextFormField(
                            maxLines: 5,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Lütfen açıklama girin";
                              }
                              return null;
                            },
                            // onSaved: (value) => _address = value,
                          ),
                        ),
                        const CustomDivider(),
                        Container(
                          width: 100.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: Color(0xff850000),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  "Uygula",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
            ),
          ),
        ));
  }
}

class CustomContainerDate extends StatelessWidget {
  const CustomContainerDate({
    Key? key,
    required this.obxValue,
  }) : super(key: key);
  final Obx obxValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w, height: 5.h, color: Colors.white70, child: obxValue);
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.3.w,
      height: 2.h,
      color: Colors.grey,
    );
  }
}

//bu textleri container ile sarıp margin vererek sürekli sizedbox vermekten kurtulabiliriz!
//tarih seçimlerine null kontrolü yapılacak!

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h, top: 1.3.h, left: 1.w),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
