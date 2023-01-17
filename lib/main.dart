import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kafebe_app_ik/app/modules/splash/splash_binding.dart';
import 'package:kafebe_app_ik/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app/translation/test.dart';
import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DependencyInjection.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.SPLASH,
        //  initialBinding: SplashBinding(),
          enableLog: true,
          getPages: AppPages.routes,
          locale: Get.deviceLocale,
          translations: Messages(),
          title: 'Kafebe IK',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: Scaffold(
          //   body: Center(),
          // ),
        );
      },
      maxTabletWidth: 900, // Optional
    );
  }
}
