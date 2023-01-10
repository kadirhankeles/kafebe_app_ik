import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/GetLandingPageInfo_model.dart';
import 'package:kafebe_app_ik/app/data/models/getProfilPicture_model.dart';
import 'package:kafebe_app_ik/app/data/services/GetLandingPageInfo_service.dart';
import 'package:kafebe_app_ik/app/data/services/getProfilPicture_service.dart';

class HomeController extends GetxController{
  GetLandingPageInfoModel? getLandingPageInfoModel;
  GetProfilPictureModel? getProfilPictureModel;
  RxBool isLoading = false.obs;
  RxBool isProfilPicture = false.obs;

  void onInit() async {
    await getLandingPageInfoData();
    getProfilPictureData();
    super.onInit();
  }
  getLandingPageInfoData() async {
    getLandingPageInfoModel=await GetLandingPageInfoService();
    isLoading.value = true;
  }

  getProfilPictureData() async{
    getProfilPictureModel = await getProfilPictureService();
    isProfilPicture.value = true;
  }

  Image baseToImage(String path){
   Uint8List bytes = base64.decode(path);
   return Image.memory(bytes, fit: BoxFit.cover,);
  }

}