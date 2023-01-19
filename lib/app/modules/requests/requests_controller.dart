
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/getMyRequestMasterMobile_model.dart';
import 'package:kafebe_app_ik/app/data/services/requests/GetMyRequestMasterMobile_service.dart';
import 'package:kafebe_app_ik/app/modules/requests_detail/request_detail_controller.dart';

class RequestsController extends GetxController {
  GetMyRequestMasterMobileModel? getMyRequestMasterMobileModel;
  RequestDetailController? requestDetailController;
  RxBool isLoading=false.obs;
  RxString statusString="Süreç Devam Ediyor".obs;
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
    getRequestData(statuCode[1]);
    super.onInit();
  }

  getRequestData(int statuCodes) async{
    isLoading.value=false;
    getMyRequestMasterMobileModel = await GetMyRequestMasterMobileService().getMyRequestMasterMobileService(statuCodes.toString());
    isLoading.value=true;
  }
}
