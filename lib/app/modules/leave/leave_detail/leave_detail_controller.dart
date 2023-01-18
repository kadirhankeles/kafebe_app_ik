import 'package:get/get.dart';

class LeaveDetailController extends GetxController {
  RxBool isLoading = false.obs;
  dynamic argumentData;
  String listName = "";
  String sDate = "";
  String eDate = "";
  String wDate = "";
  String day = "";
  String address = "";
  String comment = "";

  @override
  void onInit() async {
    argumentData = await Get.arguments;
    getDatas();

    super.onInit();
  }

  getDatas() async {
    isLoading.value = false;
    listName = await argumentData[0]['listname'];
    sDate = await argumentData[1]['sdate'];
    eDate = await argumentData[2]['edate'];
    wDate = await argumentData[3]['wdate'];
    day = await argumentData[4]['day'];
    address = await argumentData[5]['address'];
    comment = await argumentData[6]['comment'];
    isLoading.value = true;
  }
}
