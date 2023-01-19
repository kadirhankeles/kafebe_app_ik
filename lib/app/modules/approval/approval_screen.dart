import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:kafebe_app_ik/app/modules/approval/approval_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/app_pages.dart';
import '../../widgets/detail_container.dart';

class ApprovalScreen extends GetView<ApprovalController> {
  const ApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xffF4F5FA),
      appBar: AppBar(
        title: Text("Onaylarım"),
        backgroundColor: Color(0xff7f0000),
        centerTitle: true,
        elevation: 0,
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
                                controller
                                    .getApprovalData(controller.statuCode[0]);
                                controller.statusString.value = controller.statuString[0];
                                Get.back();
                              },
                              child: Text("Tümü")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller
                                    .getApprovalData(controller.statuCode[1]);
                                controller.statusString.value = controller.statuString[1];
                                Get.back();
                              },
                              child: Text("Süreç Devam Ediyor")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller
                                    .getApprovalData(controller.statuCode[2]);
                                controller.statusString.value = controller.statuString[2];
                                Get.back();
                              },
                              child: Text("Onaylandı")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller
                                    .getApprovalData(controller.statuCode[3]);
                                controller.statusString.value = controller.statuString[3];
                                Get.back();
                              },
                              child: Text("Reddedildi")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller
                                    .getApprovalData(controller.statuCode[4]);
                                controller.statusString.value = controller.statuString[4];
                                Get.back();
                              },
                              child: Text("Revize Edildi")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller
                                    .getApprovalData(controller.statuCode[5]);
                                controller.statusString.value = controller.statuString[5];
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
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 3.h),
          child: Container(
            color: Color(0xffF4F5FA),
                  height: 3.h,
                  width: double.infinity,
                  child: Center(child: Obx(() =>  controller.isLoading==true?Text(controller.statusString.value):Container())),
                ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 1.h, left: 3.h, right: 3.h),
          child: requestData(),
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
                itemCount: controller
                    .getPendingRequestMasterMobileModel!.data!.totalCount,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("******");
                          print(controller.getPendingRequestMasterMobileModel!
                              .data!.pendingRequestList![index].iDMASTER);
                          Get.toNamed(Paths.APPROVALDETAIL, arguments: [
                            {
                              'id':
                                  '${controller.getPendingRequestMasterMobileModel!.data!.pendingRequestList![index].iDMASTER}'
                            },
                            {'detail': '2'}
                          ])!
                              .then((value) {
                            print("dsadsada");
                            controller.getApprovalData(-1);
                          });
                        },
                        child: DetailContainer(
                            name1: DateTime.tryParse(controller
                                    .getPendingRequestMasterMobileModel!
                                    .data!
                                    .pendingRequestList![index]
                                    .rEQDATE!)
                                .toString()
                                .substring(0, 16),
                            description1:
                                "${controller.getPendingRequestMasterMobileModel!.data!.pendingRequestList![index].rEQNAME}",
                            name2: "Talep No",
                            description2:
                                "${controller.getPendingRequestMasterMobileModel!.data!.pendingRequestList![index].iDMASTER}",
                            name3: "Talep Eden",
                            description3: controller
                                        .getPendingRequestMasterMobileModel!
                                        .data!
                                        .pendingRequestList![index]
                                        .aSSIGNEMPLOYEE ==
                                    null
                                ? "-"
                                : "${controller.getPendingRequestMasterMobileModel!.data!.pendingRequestList![index].rEQEMPLOYEE}",
                            name4: "Atanan Kişi",
                            description4:
                                "${controller.getPendingRequestMasterMobileModel!.data!.pendingRequestList![index].aSSIGNEMPLOYEE}",
                            name5: "Açıklama",
                            description5:
                                "${controller.getPendingRequestMasterMobileModel!.data!.pendingRequestList![index].eMPLOYEENAMESURNAME}",
                            icons: "assets/onaylarim.png"),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                    ],
                  );
                },
              ),
            )
          : Container(
              height: 80.h,
              child: Center(
                child: CircularProgressIndicator(color: Color(0xff7f0000),),
              ),
            ),
    );
  }
}
