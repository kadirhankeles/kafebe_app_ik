import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/language/language_binding.dart';
import 'package:kafebe_app_ik/app/modules/language/language_screen.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_screen.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_screen.dart';

part 'app_routes.dart';
class AppPages{
  AppPages();
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(name: Paths.LOGIN, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: Paths.HOME, page: () =>  HomeScreen(), binding: HomeBinding()),
    GetPage(name: Paths.LANGUAGE, page: () =>  LanguageScreen(), binding: LanguageBinding()),
    
  ];

}