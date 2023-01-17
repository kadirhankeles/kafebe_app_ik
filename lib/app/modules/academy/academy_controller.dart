import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/learning_global_model.dart';
import 'package:kafebe_app_ik/app/data/services/academy/academy_service.dart';

class AcademyController extends GetxController {
  RxBool isLoading = false.obs;

  LearningGlobalModel? learningGlobalModel;

  List<int> statuCode =[99,0,1];
  List<String> statuString=[
    "Tümü",
    "Tamamlanan",
    "Tamamlanmamış",
   
  ];

  @override
  void onInit() async {
    await getAcademyData();
    super.onInit();
  }

  getAcademyData() async {
    isLoading.value = false;
    learningGlobalModel = await getAcademyService();
    isLoading.value = true;
  }

  

  educationCompleteStatusControl(int index) {
    switch (learningGlobalModel
        ?.data?.talentActivityList?[index].aCTIVITYCOMPLETESTATUS) {
      case 1:
        return "Tamamlanmış";
      case 0:
        return "Tamamlanmamış";
      
    }
  }

  educationSuccessStatusControl(int successIndex) {
    switch (learningGlobalModel
        ?.data?.talentActivityList?[successIndex].aCTIVITYSUCCESSSTATUS) {
      case 1:
        return "Başarılı";
      case 2:
        return "Devam ediyor";
    }
  }

  // controller
  //                                                       .learningGlobalModel
  //                                                       ?.data
  //                                                       ?.talentActivityList?[
  //                                                           index]
  //                                                       .aCTIVITYCOMPLETESTATUS == 1
  //                                                       ? "${controller.learningGlobalModel?.data?.talentActivityList?[index].aCTIVITYCOMPLETESTATUSTXT}"
  //                                                       : "",
}
