import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/language_model.dart';
import 'package:kafebe_app_ik/app/routes/app_pages.dart';


import '../../data/services/language_service.dart';

class LanguageController extends GetxController{
  LanguageModel? getLanguageModel;
  RxBool isLoading = false.obs;
  
  

  void onInit() async {   
    await getLanguageData();
  }

  getLanguageData() async {
    isLoading.value = false;   
    getLanguageModel = await LanguageService().getLanguageService();
    isLoading.value = true;
  }

  Image baseToImage(String path) {
    Uint8List bytes = base64.decode(path);
    return Image.memory(
      bytes,
      fit: BoxFit.cover,
    );
  }


//Dil saçimi yapılmak istenirse bu method(selectLanguage) kullanılabilir.

/* RxInt languageIndex = 0.obs;
  selectLanguage(int language){
    languageIndex.value = language;
    Get.toNamed(Routes.LOGIN, parameters: {"selectedLanguage":"${languageIndex}"});
    print(languageIndex);
  } */
}