import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../models/language_model.dart';

class LanguageService extends GetConnect {
  Future<LanguageModel?> getLanguageService() async {
     LanguageModel languageModel = LanguageModel();
    var headers = {
      'Accept': 'application/json',
      'vbtauthorization':
          '7UInyw1F9pwFVESoVY1+l3MsLYeHNNNjjJUwxqvwpg+1/LlDhy8xKsRmT6KJGowY~2270~string~638092514895929163',
    };

    var url = Uri.parse(
        'https://suniktest.suntekstil.com.tr/mobileapi/api/Language/GetAllLanguage');
    var res = await http.get(url, headers: headers);
    if (res.statusCode != 200)
      throw Exception('http.get error: statusCode= ${res.statusCode}');
    print(res.body);

    languageModel= LanguageModel.fromJson(jsonDecode(res.body));
    return languageModel;
  }
}
// dene
