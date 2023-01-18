import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/requests_detail/request_detail_controller.dart';
import 'package:kafebe_app_ik/app/widgets/info_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RequestDetailScreen extends GetView<RequestDetailController> {
  const RequestDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7f0000),
        centerTitle: true,
        title: Text("Taleplerim"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          child: Obx(() => controller.isLoading==true?InfoContainer(top1: controller.getRequestByIdModel!.data!.rEQNAME.toString(), des1: DateTime.tryParse(controller.getRequestByIdModel!.data!.rEQDATE!).toString().substring(0, 16), top2: "Talep Eden", des2: controller.getRequestByIdModel!.data!.rEQEMPLOYEE.toString(), top3: "Atanan Kişi", des3: controller.getRequestByIdModel!.data!.aSSIGNEMPLOYEE.toString(), detail1: "Talep No", detailDes1: controller.getRequestByIdModel!.data!.iDMASTER.toString(), keyValue: controller.keyValue, bottom1: DateTime.tryParse(controller.getRequestByIdModel!.data!.hISTORY![0].cONFIRMDATE!).toString().substring(0, 16), bottomDes1: '${controller.getRequestByIdModel!.data!.hISTORY![0].eMPLOYEENAMESURNAME} ${controller.getRequestByIdModel!.data!.hISTORY![0].iDHREMPLOYEECONFIRM}', bottom2: controller.getRequestByIdModel!.data!.hISTORY![0].dESCRIPTION.toString(), bottomDes2: controller.getRequestByIdModel!.data!.hISTORY![0].cONFIRMDESCRIPTION.toString(), image1: 'assets/taleplerim.png', image2: 'assets/new_talep_tarihce.png', ):Container(height: 100.h, child: Center(child: CircularProgressIndicator(color: Color(0xff7f0000),),),)),
        ),
      )
    );
  }
}