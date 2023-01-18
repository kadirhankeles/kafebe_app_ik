import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kafebe_app_ik/app/data/services/home/getProfilPicture_service.dart';
import 'package:kafebe_app_ik/app/routes/app_pages.dart';
import '../../data/models/getLanding_PageInfo_model.dart';
import '../../data/models/get_ProfilPicture_model.dart';
import '../../data/services/home/getLanding_Page_Info_service.dart';

class HomeController extends GetxController {
  GetLandingPageInfoModel? getLandingPageInfoModel;
  GetProfilPictureModel? getProfilPictureModel;
  RxBool isLoading = false.obs;
  RxBool isProfilPicture = false.obs;
  RxBool isCategoryName = false.obs;
  RxBool isNotiCount = false.obs;

  //! Menülerin isimlerinin ayıklanması için liste
  List<dynamic> manager = [];
  List<dynamic> managerSun = [];
  List<dynamic> employee = [];
  List<dynamic> employeeSun = [];
  List<dynamic> notificationCount = [];
  List<dynamic> menuName = [];

  String cacheToken = GetStorage().read("token");
  @override
  void onInit() async {
    await getLandingPageInfoData();
    await getProfilPictureData();

    super.onInit();
  }

  getLandingPageInfoData() async {
    isLoading.value = false;
    getLandingPageInfoModel =
        await LandingPageInfoService().getLandingPageInfoService();
    isLoading.value = true;
  }

  getProfilPictureData() async {
    isProfilPicture.value = false;
    isCategoryName.value = false;
    isNotiCount.value = false;
    getProfilPictureModel =
        await ProfilPictureService().getProfilPictureService();
    await menuNameAndNotification(
        getLandingPageInfoModel,
        getLandingPageInfoModel!.data!.isManager,
        getLandingPageInfoModel!.data!.sunAkademi);
    isProfilPicture.value = true;
    isCategoryName.value = true;
    isNotiCount.value = true;
  }

  Image baseToImage(String path) {
    Uint8List bytes = base64.decode(path);
    if (path == "null") {
      return Image.network(
          "https://static.vecteezy.com/system/resources/previews/007/409/979/original/people-icon-design-avatar-icon-person-icons-people-icons-are-set-in-trendy-flat-style-user-icon-set-vector.jpg");
    } else
      return Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
  }

  menuNameAndNotification(GetLandingPageInfoModel? getLandingPageInfoModel,
      bool? isManager, bool? sunAkademi) {
    int index = 0;
    getLandingPageInfoModel!.data!.menuInfo!.forEach(
      (element) {
        menuName.add(element.mENUNAME.toString());
        print(element.mENUNAME.toString());

        if (isManager == true && sunAkademi == true) {
          index++;
          if (element.mENUNAME.toString() == "MyRequests" ||
              element.mENUNAME.toString() == "MyApprovals" ||
              element.mENUNAME.toString() == "MyTeam" ||
              element.mENUNAME.toString() == "MyWorks" ||
              element.mENUNAME.toString() == "SunAkademi") {
                if(element.mENUNAME.toString() == "MyRequests"){
                  managerSun.add("Taleplerim");
                } else if (element.mENUNAME.toString() == "MyApprovals"){
                  managerSun.add("Onaylarım");
                }else if (element.mENUNAME.toString() == "MyTeam"){
                  managerSun.add("Ekibim");
                }else if (element.mENUNAME.toString() == "MyWorks"){
                  managerSun.add("İşlerim");
                }else if (element.mENUNAME.toString() == "SunAkademi"){
                  managerSun.add("Sun Akademi");
                }
          }
        } else if (isManager == true && sunAkademi == false) {
          index++;
          if (element.mENUNAME == "MyRequests" ||
              element.mENUNAME == "MyApprovals" ||
              element.mENUNAME == "MyTeam" ||
              element.mENUNAME == "MyWorks") {
            if(element.mENUNAME.toString() == "MyRequests"){
                  manager.add("Taleplerim");
                } else if (element.mENUNAME.toString() == "MyApprovals"){
                  manager.add("Onaylarım");
                }else if (element.mENUNAME.toString() == "MyWorks"){
                  manager.add("İşlerim");
                }else if (element.mENUNAME.toString() == "MyTeam"){
                  manager.add("Ekibim");
                }
          }
        } else if (isManager == false && sunAkademi == true) {
          index++;
          if (element.mENUNAME == "MyRequests" ||
              element.mENUNAME == "MyApprovals" ||
              element.mENUNAME == "MyWorks" ||
              element.mENUNAME == "SunAkademi") {
            if(element.mENUNAME.toString() == "MyRequests"){
                  employeeSun.add("Taleplerim");
                } else if (element.mENUNAME.toString() == "MyApprovals"){
                  employeeSun.add("Onaylarım");
                }else if (element.mENUNAME.toString() == "MyWorks"){
                  employeeSun.add("İşlerim");
                }else if (element.mENUNAME.toString() == "SunAkademi"){
                  employeeSun.add("Sun Akademi");
                }
          }
        } else if (isManager == false && sunAkademi == false) {
          index++;
          if (element.mENUNAME == "MyRequests" ||
              element.mENUNAME == "MyApprovals" ||
              element.mENUNAME == "MyWorks") {
           if(element.mENUNAME.toString() == "MyRequests"){
                  employee.add("Taleplerim");
                } else if (element.mENUNAME.toString() == "MyApprovals"){
                  employee.add("Onaylarım");
                }else if (element.mENUNAME.toString() == "MyWorks"){
                  employee.add("İşlerim");
                }
          }
        }
      },
    );
    notificationCount.add(getLandingPageInfoModel.data!.myRequestCount);
    notificationCount.add(getLandingPageInfoModel.data!.getMyApprovalCount);
    notificationCount.add(getLandingPageInfoModel.data!.getMyWorks);
  }

  //Model Sıfırlama eklenecek
  cacheRemoveAndGoToLogin() async {
    Get.defaultDialog(
      title: "Dikkat!",
      middleText: "Çıkış yapmak isteidiğinize emin misiniz?",
      cancel: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            Get.back();
          },
          child: const Text("Vazgeç")),
      confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            Get.delete();
            Get.delete<HomeController>();
            GetStorage().write("token", "");
            Get.offAllNamed(Routes.LOGIN);
          },
          child: const Text("Onayla")),
    );
  }

  @override
  void onClose() async {
    GetStorage().write("token", "");

    // TODO: implement onClose
    super.onClose();
  }
}
