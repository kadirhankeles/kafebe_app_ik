import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kafebe_app_ik/app/routes/app_pages.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    print("Önbellekte tutulan token: ${cacheToken.read("token")}");
    super.onInit();
  }

  @override
  void onReady() async{
    if(cacheToken.read("token") != null){
      Get.offAndToNamed(Routes.LOGIN);
    }else{
      Get.offAndToNamed(Routes.HOME);
    }
    super.onReady();
  }

  GetStorage cacheToken = GetStorage();

  
}