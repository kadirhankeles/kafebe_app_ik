import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/learning_global_model.dart';
import 'package:kafebe_app_ik/app/data/services/academy/academy_service.dart';

class AcademyController extends GetxController{

  RxBool isLoading = false.obs;
  
  LearningGlobalModel? learningGlobalModel;

  @override
  void onInit() async{
    await getAcademyData();
    super.onInit();
  }

  getAcademyData()async{
    isLoading.value = false;
    await getAcademyService();
    isLoading.value = true;
  }

}