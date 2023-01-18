

import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/my_team_model.dart';
import 'package:kafebe_app_ik/app/data/services/team/my_team_service.dart';
import 'package:kafebe_app_ik/app/modules/home/home_controller.dart';

import '../../data/models/getLanding_PageInfo_model.dart';

class TeamController extends GetxController {
  GetLandingPageInfoModel? getLandingPageInfoModel;
  MyTeamModel? myTeamModel;
  RxBool isLoading = false.obs;

  List<int> statuCode = [1,2,3];
  List<String> statuString = [
    "Direkt Bağlı Çalışanlar",
    "Vekaleten Bağlı Çalışanlar",
    "Fonksiyonel Bağlı Çalışanlar",
  ];
dynamic argumentData = Get.arguments;
  RxString screenString = "Direkt Bağlı Çalışanlar".obs;
  @override
  void onInit() {
    
    getMyTeamData(DateTime.now().toString(), statuCode[0],argumentData[0]['idHR'] );
    super.onInit();
  }

  getMyTeamData(String date, int eType, String idHR) async{
    isLoading.value=false;
    myTeamModel = await MyTeamService().myTeamService(date, eType, idHR);
    isLoading.value=true;
  }
 
 
}
