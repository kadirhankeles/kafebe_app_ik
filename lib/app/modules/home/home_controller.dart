import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/services/getProfilPicture_service.dart';
import '../../data/models/getLanding_PageInfo_model.dart';
import '../../data/models/get_ProfilPicture_model.dart';
import '../../data/services/getLanding_Page_Info_service.dart';

class HomeController extends GetxController {
  GetLandingPageInfoModel? getLandingPageInfoModel;
  GetProfilPictureModel? getProfilPictureModel;
  RxBool isLoading = false.obs;
  RxBool isProfilPicture = false.obs;

  void onInit() async {
    await getLandingPageInfoData();
    await getProfilPictureData();
    super.onInit();
  }

  getLandingPageInfoData() async {
    getLandingPageInfoModel =
        await LandingPageInfoService().getLandingPageInfoService();
    isLoading.value = true;
  }

  getProfilPictureData() async {
    getProfilPictureModel =
        await ProfilPictureService().getProfilPictureService();
    isProfilPicture.value = true;
  }

  Image baseToImage(String path) {
    Uint8List bytes = base64.decode(path);
    if (path == "null") {
      return Image.network(
          "https://media.licdn.com/dms/image/C4D0BAQGw5l4DIigpiQ/company-logo_200_200/0/1625655631414?e=2147483647&v=beta&t=zgHGi-aH97kbaaaEv2dPW4ZFM1sMNwvCpWJgoF0AxMM");
    } else
      return Image.memory(
        bytes,
        fit: BoxFit.cover,
      );
  }
}
