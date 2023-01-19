
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/get_pending_jobs.dart';
import 'package:kafebe_app_ik/app/data/services/work/get_pending_jobs_service.dart';

class WorkController extends GetxController {
  GetPendingJobsModel? getPendingJobsModel;
  RxBool isLoading =false.obs;
  RxString statu = "Bekliyor".obs;
  @override
  void onInit() {
    getPendingJobsData("1");
    super.onInit();
  }

  getPendingJobsData(String statu) async{
    isLoading.value = false;
    getPendingJobsModel = await getPendingJobsService(statu);
    isLoading.value=true;
  }
  
 
 
}
