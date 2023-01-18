import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/requests/requests_controller.dart';
import 'package:kafebe_app_ik/app/routes/app_pages.dart';
import 'package:kafebe_app_ik/app/widgets/detail_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RequestsScreen extends GetView<RequestsController> {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String statusString="Tümü";
    return Scaffold(
      backgroundColor: Color(0xffF4F5FA),
      appBar: AppBar(
        backgroundColor: Color(0xff7f0000),
        centerTitle: true,
        title: Text("Taleplerim"),
        actions: [
          IconButton(
              onPressed: () {
                Get.dialog(AlertDialog(
                    backgroundColor: Colors.white.withOpacity(.9),
                    content: Container(
                      height: 50.h,
                      child: Column(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getRequestData(controller.statuCode[0]);
                                statusString = controller.statuString[0];
                                Get.back();
                              },
                              child: Text("Tümü")),
                          
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getRequestData(controller.statuCode[1]);
                                statusString = controller.statuString[1];
                                Get.back();
                              },
                              child: Text("Süreç Devam Ediyor")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getRequestData(controller.statuCode[2]);
                                statusString = controller.statuString[2];
                                Get.back();
                              },
                              child: Text("Onaylandı")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getRequestData(controller.statuCode[3]);
                                statusString = controller.statuString[3];
                                 Get.back();
                              },
                              child: Text("Reddedildi")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getRequestData(controller.statuCode[4]);
                                statusString = controller.statuString[4];
                                 Get.back();
                              },
                              child: Text("Revize Edildi")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getRequestData(controller.statuCode[5]);
                                statusString = controller.statuString[5];
                                 Get.back();
                              },
                              child: Text("Geri Gönderildi")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("Vazgeç")),
                        ],
                      ),
                    )));
              },
              icon: Icon(Icons.filter_alt_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 1.h, left: 3.h, right: 3.h),
          child: Column(
            children: [
              Container(
                height: 3.h,
                width: double.infinity,
                child: Center(child: Obx(() =>  controller.isLoading==true?Text(statusString):Container())),
              ),
              SizedBox(
                height: 2.h,
              ),
              requestData(),
            ],
          ),
        ),
      ),
    );
  }

  Obx requestData() {
    return Obx(
                () => controller.isLoading == true
                    ? Container(
              width: double.infinity,
              child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 1.h),
                        shrinkWrap: true,
                        itemCount: controller.getMyRequestMasterMobileModel!.data!.totalCount,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Paths.REQUESTSDETAIL, arguments: [{'id': '${controller.getMyRequestMasterMobileModel!.data!.myRequestList![index].iDMASTER}'},{'detail': '1'}]);
                                },
                                child: DetailContainer(
                                    name1: DateTime.tryParse(controller
                                            .getMyRequestMasterMobileModel!
                                            .data!
                                            .myRequestList![index]
                                            .rEQDATE!)
                                        .toString()
                                        .substring(0, 16),
                                    description1:
                                        "${controller.getMyRequestMasterMobileModel!.data!.myRequestList![index].rEQNAME}",
                                    name2: "Talep No",
                                    description2:
                                        "${controller.getMyRequestMasterMobileModel!.data!.myRequestList![index].iDMASTER}",
                                    name3: "Atanan Kişi",
                                    description3: controller
                                                .getMyRequestMasterMobileModel!
                                                .data!
                                                .myRequestList![index]
                                                .aSSIGNEMPLOYEE ==
                                            null
                                        ? "-"
                                        : "${controller.getMyRequestMasterMobileModel!.data!.myRequestList![index].aSSIGNEMPLOYEE}",
                                    name4: "Açıklama",
                                    description4:
                                        "${controller.getMyRequestMasterMobileModel!.data!.myRequestList![index].rEQEMPLOYEE}",
                                    name5: "Durum",
                                    description5:
                                        "${controller.getMyRequestMasterMobileModel!.data!.myRequestList![index].sTATUNAME}",
                                    icons: "assets/taleplerim.png"),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                            ],
                          );
                        },
                      )
                    ,
              ): Container(height: 80.h, child: Center(child: CircularProgressIndicator(color: Color(0xff7f0000),),),),
            );
  }
}
