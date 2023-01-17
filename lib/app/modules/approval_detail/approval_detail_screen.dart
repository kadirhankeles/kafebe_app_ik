import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/approval/approval_controller.dart';
import 'package:kafebe_app_ik/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/app_constant.dart';
import 'approval_detail_controller.dart';

class ApprovalDetailScreen extends GetView<ApprovalDetailController> {
  const ApprovalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5FA),
      appBar: AppBar(
        title: Text("Onaylarım"),
        backgroundColor: Color(0xff7f0000),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading == true
            ? SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Container(
                    width: double.infinity,
                    decoration: AppConstant.infoContainer,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Container(
                            height: 12.h,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 6.h,
                                      width: 6.h,
                                      child: Image.asset(
                                          "assets/holiday_icon.png"),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 0.8.h),
                                      height: 6.h,
                                      width: 40.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.getRequestByIdModel!
                                                .data!.rEQNAME
                                                .toString(),
                                            style: AppConstant.detailGrey,
                                          ),
                                          SizedBox(
                                            height: 0.6.h,
                                          ),
                                          Text(controller.getRequestByIdModel!
                                                      .data!.rEQDATE
                                                      .toString() ==
                                                  "null"
                                              ? "-"
                                              : DateTime.tryParse(controller
                                                      .getRequestByIdModel!
                                                      .data!
                                                      .rEQDATE!)
                                                  .toString()
                                                  .substring(0, 16)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  children: [
                                    Container(
                                      height: 5.h,
                                      width: 42.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Talep Eden",
                                            style: AppConstant.detailGrey,
                                          ),
                                          Text(
                                            controller.getRequestByIdModel!
                                                        .data!.rEQEMPLOYEE
                                                        .toString() ==
                                                    "null"
                                                ? "-"
                                                : controller
                                                    .getRequestByIdModel!
                                                    .data!
                                                    .rEQEMPLOYEE
                                                    .toString(),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 5.h,
                                      width: 42.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Atanan Kişi",
                                            style: AppConstant.detailGrey,
                                          ),
                                          Text(
                                            controller.getRequestByIdModel!
                                                        .data!.aSSIGNEMPLOYEE
                                                        .toString() ==
                                                    "null"
                                                ? "-"
                                                : controller
                                                    .getRequestByIdModel!
                                                    .data!
                                                    .aSSIGNEMPLOYEE
                                                    .toString(),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        controller.idHR ==
                                controller.getRequestByIdModel!.data!
                                    .iDHREMPLOYEEASSIGN && controller.getLandingPageInfoModel!.data!.isManager==true
                            ? Padding(
                                padding: EdgeInsets.all(1.h),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Paths.EMPLOYEELEAVE,
                                        arguments: [
                                          {
                                            'id':
                                                '${controller.getRequestByIdModel!.data!.iDMASTER}'
                                          },
                                          {'month': '12'}
                                        ]);
                                  },
                                  child: Container(
                                    height: 6.h,
                                    width: double.infinity,
                                    decoration: AppConstant.homeRedButton,
                                    child: Center(
                                        child: Text(
                                      "İzin Kullanım Bilgisi",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    )),
                                  ),
                                ),
                              )
                            : SizedBox(),
                        Container(
                          height: 5.5.h,
                          width: double.infinity,
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: EdgeInsets.all(1.5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Detay",
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Talep No",
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller
                                      .getRequestByIdModel!.data!.iDMASTER
                                      .toString()),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[0],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[1]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[2],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Container(
                                      height: 4.h,
                                      width: 50.w,
                                      child: Text(
                                        controller.keyValue[3],
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        maxLines: 2,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[4],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[5]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[6],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[7]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[8],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[9]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[10],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[11]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[12],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[13]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[14],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[15]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[16],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[17]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[18],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[19]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[20],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[21]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[22],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[23]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[24],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Container(
                                      height: 4.h,
                                      width: 50.w,
                                      child: Text(
                                        controller.keyValue[25],
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        maxLines: 2,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[26],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Container(
                                      height: 4.h,
                                      width: 40.w,
                                      child: Text(
                                        controller.keyValue[27],
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        maxLines: 2,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[28],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[29]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[30],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[31]),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.keyValue[32],
                                    style: AppConstant.detailGrey,
                                  ),
                                  Text(controller.keyValue[33]),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 5.5.h,
                          width: double.infinity,
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: EdgeInsets.all(1.5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tarihçe",
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller
                                .getRequestByIdModel!.data!.hISTORY!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 1.h, right: 1.h, top: 1.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 6.h,
                                      width: 6.h,
                                      child: Image.asset(
                                          "assets/new_talep_tarihce.png"),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 2.h,
                                            child: Text(
                                              DateTime.tryParse(controller
                                                      .getRequestByIdModel!
                                                      .data!
                                                      .hISTORY![index]
                                                      .cONFIRMDATE!)
                                                  .toString()
                                                  .substring(0, 16),
                                              style: AppConstant.detailGrey,
                                            )),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                            height: 6.h,
                                            width: 35.w,
                                            child: Text(
                                              '${controller.getRequestByIdModel!.data!.hISTORY![index].eMPLOYEENAMESURNAME} ${controller.getRequestByIdModel!.data!.hISTORY![index].pOSITIONNAME}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              textAlign: TextAlign.start,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 4.2.h,
                                          width: 35.w,
                                          child: Text(
                                            controller
                                                .getRequestByIdModel!
                                                .data!
                                                .hISTORY![index]
                                                .dESCRIPTION
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: AppConstant.detailGrey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                            height: 4.2.h,
                                            width: 35.w,
                                            child: Text(
                                              controller
                                                  .getRequestByIdModel!
                                                  .data!
                                                  .hISTORY![index]
                                                  .cONFIRMDESCRIPTION
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        controller.idHR ==
                                controller.getRequestByIdModel!.data!
                                    .iDHREMPLOYEEASSIGN && controller.getLandingPageInfoModel!.data!.isManager==true
                            ? Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(1.h),
                                    child: TextField(
                                      controller: controller.description,
                                      maxLines: 3,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(10),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: .6,
                                                color: Color.fromARGB(
                                                    255, 178, 176, 176))),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: .6,
                                              color: Color.fromARGB(
                                                  255, 178, 176, 176)),
                                        ),
                                        hintText: 'Açıklama Giriniz',
                                      ),
                                      autofocus: false,
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(1.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 41.w,
                                          height: 6.h,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                            ),
                                            onPressed: () {
                                              controller
                                                      .description.text.isEmpty
                                                  ? Get.dialog(AlertDialog(
                                                      backgroundColor: Colors
                                                          .white
                                                          .withOpacity(.9),
                                                      content: Container(
                                                          height: 12.h,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Onayla",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              SizedBox(
                                                                height: 1.h,
                                                              ),
                                                              Text(
                                                                  "Lütfen Açıklama Giriniz."),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "TAMAM",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xff7f0000),
                                                                        ),
                                                                      )),
                                                                ],
                                                              )
                                                            ],
                                                          ))))
                                                  : Get.dialog(AlertDialog(
                                                      backgroundColor: Colors
                                                          .white
                                                          .withOpacity(.9),
                                                      content: Container(
                                                          height: 15.h,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Reddet",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              SizedBox(
                                                                height: 1.h,
                                                              ),
                                                              Text(
                                                                  "Talebi reddetmek istediğinize emin misiniz?"),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "VAZGEÇ",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xff7f0000),
                                                                        ),
                                                                      )),
                                                                  SizedBox(
                                                                    width: 5.w,
                                                                  ),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        controller.getFinalizeRequestData(
                                                                            controller.getRequestByIdModel!.data!.iDMASTER.toString(),
                                                                            1000,
                                                                            controller.description.text.toString());
                                                                            
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "Reddet",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xff7f0000),
                                                                        ),
                                                                      ))
                                                                ],
                                                              )
                                                            ],
                                                          ))));
                                            },
                                            child: Text("Reddet"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        SizedBox(
                                          width: 41.w,
                                          height: 6.h,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.green,
                                            ),
                                            onPressed: () {
                                              Get.dialog(AlertDialog(
                                                  backgroundColor: Colors.white
                                                      .withOpacity(.9),
                                                  content: Container(
                                                      height: 15.h,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Onayla",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          Text(
                                                              "Talebi onaylamak istediğinize emin misiniz?"),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  child: Text(
                                                                    "VAZGEÇ",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff7f0000),
                                                                    ),
                                                                  )),
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                        controller.getFinalizeRequestData(
                                                                            controller.getRequestByIdModel!.data!.iDMASTER.toString(),
                                                                            2000,
                                                                            controller.description.text.toString());
                                                                      },
                                                                  child: Text(
                                                                    "ONAYLA",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff7f0000),
                                                                    ),
                                                                  ))
                                                            ],
                                                          )
                                                        ],
                                                      ))));
                                            },
                                            child: Text("Onayla"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              )
            : Container(height: 100.h, child: Center(child: CircularProgressIndicator(color:Color(0xff7f0000),)),),
      ),
    );
  }
}
