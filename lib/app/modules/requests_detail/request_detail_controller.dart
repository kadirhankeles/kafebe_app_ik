import 'dart:convert';

import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/getMyRequestMasterMobile_model.dart';
import 'package:kafebe_app_ik/app/data/models/getRequestById_model.dart';
import 'package:kafebe_app_ik/app/data/services/getRequestById_service.dart';

class RequestDetailController extends GetxController {
  GetRequestByIdModel? getRequestByIdModel;
  RxBool isLoading=false.obs;
  List<String> keyValue=[];
  @override
  void onInit() async {
    dynamic argumentData = Get.arguments;
    getRequestDetailData(argumentData[0]['id']);
    super.onInit();
  }

  getRequestDetailData(String idMaster) async{
    print("Buraya girdi");
    isLoading.value=false;
    getRequestByIdModel = await GetRequestByIdService().getRequestByIdService(idMaster);
    getRequestByIdModel!.data!.rEQUESTDETAILKEYVALUE!.forEach((element) {
      keyValue.add(element.name.toString());
      if(element.value.toString() =="null"){
        keyValue.add("-");
      }else keyValue.add(element.value.toString());
      
     });
    isLoading.value=true;
  }
}
