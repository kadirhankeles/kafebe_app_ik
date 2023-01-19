import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/learning_global_model.dart';
import 'package:kafebe_app_ik/app/data/services/academy/academy_service.dart';

import '../../data/models/academy_model/academy_all_over_model.dart';
import '../../data/models/academy_model/academy_completed_model.dart';
import '../../data/models/academy_model/academy_continuing_model.dart';

class AcademyController extends GetxController {
  RxBool isLoading = false.obs;

  LearningGlobalModel? learningGlobalModel;
  AcademyConfirmModel? academyConfirmModel;

  List<int> statuCode = [99, 0, 1];
  List<String> statuString = [
    "Tümü",
    "Tamamlanan",
    "Tamamlanmamış",
  ];
// -----------------------------------------------------------
  RxInt activityIndex = 0.obs;

  var activity1 = [].obs; // Sacede bu kullanılıyor.
  //var activitySuccessAllOver1 = [].obs;
  //var activityCompleteAllOver1 = [].obs;

  var activity2 = [].obs; // Sacede bu kullanılıyor.
  //var activitySuccessCompleted2 = [].obs;
  //var activityCompleteCompleted2 = [].obs;

  var activity3 = [].obs; // Sacede bu kullanılıyor.
  //var activitySuccessContinuing3 = [].obs;
  //var activityCompleteCompleted3 = [].obs;

  // addActivity1(AcademyAllOverModel activ1) {
  //   activity1.add(activ1);
  // }

  // addActivity2(AcedemyCompletedModel activ2) {
  //   activity2.add(activ2);
  // }

  addActivity3(AcademyContinuingModel activ3) {
    activity3.add(activ3);
  }
// -----------------------------------------------------------
  @override
  void onInit() async {
    await getAcademyData();
    super.onInit();
  }

  getAcademyData() async {
    
    isLoading.value = false;
    learningGlobalModel = await getAcademyService();
    learningGlobalModel!.data!.talentActivityList!.forEach((element) async {
      // if (element.aCTIVITYCOMPLETESTATUS == 0) {
      //   academyConfirmModel =  learningGlobalModel;
      // } else if(element.aCTIVITYCOMPLETESTATUS == 1) {
        
      // }
    });
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

  
}
