
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/getPendingRequestMasterMobile_model.dart';
import 'package:kafebe_app_ik/app/data/services/approval/getPendingRequestMasterMobile_service.dart';

class ApprovalController extends GetxController {
  GetPendingRequestMasterMobileModel? getPendingRequestMasterMobileModel;
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
    getApprovalData(statuCode[0]);
    super.onInit();
  }
  getApprovalData(int statuCode) async{
    isLoading.value=false;
    getPendingRequestMasterMobileModel = await GetPendingRequestMasterMobileService().getPendingRequestMasterMobileService(statuCode.toString());
    isLoading.value=true;
  }
 
}
