

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/finalize_request_model.dart';
import 'package:kafebe_app_ik/app/data/models/getLanding_PageInfo_model.dart';
import 'package:kafebe_app_ik/app/data/services/approval/finalize_request_service.dart';
import 'package:kafebe_app_ik/app/data/services/home/getLanding_Page_Info_service.dart';
import 'package:kafebe_app_ik/app/modules/approval/approval_controller.dart';

import '../../data/models/getPendingRequestMasterMobile_model.dart';
import '../../data/models/getRequestById_model.dart';
import '../../data/services/requests/getRequestById_service.dart';

class ApprovalDetailController extends GetxController {
  GetRequestByIdModel? getRequestByIdModel;
  GetLandingPageInfoModel? getLandingPageInfoModel;
  FinalizeRequestModel? finalizeRequestModel;

  RxBool isLoading=false.obs;
  RxBool isLoading1=false.obs;

  List<String> keyValue = [];
  RxInt idHR=0.obs;
  dynamic argumentData = Get.arguments;
  TextEditingController description = TextEditingController();
  @override
  void onInit() async{
    
    getLandingPageInfoModel = await LandingPageInfoService().getLandingPageInfoService();
    GetPendingRequestMasterMobileModel? getPendingRequestMasterMobileModel;
    getApprovalDetailData(argumentData[0]['id'],argumentData[1]['detail']);
    //getApprovalDetailData("642", "2");
    super.onInit();
  }
  void onReady() async{
    getApprovalDetailData(argumentData[0]['id'],argumentData[1]['detail']);
  }
  
  getApprovalDetailData(String idMaster, String detailType) async {
    
    print("Buraya girdi");
    isLoading.value = false;
    getRequestByIdModel =
        await GetRequestByIdService().getRequestByIdService(idMaster,detailType);
    
    getRequestByIdModel!.data!.rEQUESTDETAILKEYVALUE!.forEach((element) {
      keyValue.add(element.name.toString());
      if (element.value.toString() == "null") {
        keyValue.add("-");
      } else
        keyValue.add(element.value.toString());
    });
    idHR.value = await getLandingPageInfoModel!.data!.idHrEmployee!;
    isLoading.value = true;
  }

  getFinalizeRequestData(String? idMaster, int? statu, String desc) async{
    isLoading1.value=false;
    finalizeRequestModel = await FinalizeRequestService().getFinalizeRequestService(idMaster, statu, desc);
    await ApprovalController().getApprovalData(-1);
    isLoading1.value=true;
    Get.back();
    Get.back();
  }
 
}
