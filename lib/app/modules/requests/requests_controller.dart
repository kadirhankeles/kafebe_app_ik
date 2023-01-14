
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/getMyRequestMasterMobile_model.dart';
import 'package:kafebe_app_ik/app/data/services/GetMyRequestMasterMobile_service.dart';

class RequestsController extends GetxController {
  GetMyRequestMasterMobileModel? getMyRequestMasterMobileModel;
  RxBool isLoading=false.obs;
  List<int> statuCode =[-1, 0, 1, 2, 4, 6];
  List<String> statuString=[
    "Tümü",
    "Süreç Devam Ediyor",
    "Onaylandı",
    "Reddedildi",
    "Revize Edildi",
    "Geri Gönderildi",
  ];
  @override
  void onInit() {
    getRequestData(statuCode[0]);
    super.onInit();
  }

  getRequestData(int statuCodes) async{
    isLoading.value=false;
    getMyRequestMasterMobileModel = await GetMyRequestMasterMobileService().getMyRequestMasterMobileService(statuCodes.toString());
    isLoading.value=true;
  }
}
