import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/widgets/login_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/app_constant.dart';
import '../../widgets/user_name_text_form_widget.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
          Positioned(
            child: Container(
                height: 100.h,
                width: 100.w,
                child: Image.asset(
                  "assets/im_background.png",
                  fit: BoxFit.fill,
                  color: AppConstant.loginBackground,
                )),
          ),
          Positioned(
              top: 8.h,
              left: 80.w,
              child: InkWell(
                child: Container(
                  height: 4.h,
                  width: 8.w,
                  decoration: BoxDecoration(
                      color: AppConstant.loginLanguage,
                      borderRadius: AppConstant.globalRadius),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "TR",
                      )),
                ),
              )),
          Positioned(
              top: 0.h,
              left: 42.w,
              child: SafeArea(
                child: Image.asset(
                  "assets/im_sun_new.png",
                  scale: 1.4,
                ),
              )),
          Positioned(
            top: 33.h,
            left: 5.w,
            child: Container(width: 81.w, child: AppConstant.loginInfo),
          ),
          Obx(() => Positioned(
              top: 40.h,
              left: 5.w,
              child: Row(
                children: [
                  SizedBox(width: 60.w, child: AppConstant.loginSms),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.w),
                    child: Switch(
                      activeColor: AppConstant.loginSw,
                      activeTrackColor: AppConstant.loginSwTrack,
                      inactiveThumbColor: AppConstant.loginInSw,
                      inactiveTrackColor: AppConstant.loginInSwTrack,
                      value: controller.switchControl.value,
                      onChanged: (value) {
                        controller.switchControl.value = value;
                      },
                    ),
                  )
                ],
              ))),
          Obx(
            () => Positioned(
              top: 50.h,
              left: 5.w,
              child: Container(
                height: 28.h,
                width: 90.w,
                child: Column(
                  children: [
                    Container(
                      height: 7.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.w),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            prefixIcon: Icon(
                              Icons.table_rows_rounded,
                              color: Color(0xffe53935),
                            ),
                          ),
                          iconSize: 8.w,
                          //  borderRadius: BorderRadius.circular(2.w),
                          hint: Text(
                            "Şehir Seçiniz",
                          ),
                          items: controller.companyList
                              .map((String e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          value: controller.companySelect.value,
                          onChanged: (String? value) {
                            controller.companySelect.value = value!;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    UserNameTextFormField("Kullanıcı Adı", controller.userNameController),
                    SizedBox(
                      height: 2.h,
                    ),
                    PasswordTextFormField(
                        controllerr: controller.passwordController, hintText: "Şifre"),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 90.h,
              left: 65.w,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(30.w, 6.h),
                      side: BorderSide(color: Colors.white, width: 0.5.w),
                      backgroundColor: AppConstant.loginButton,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    
                  controller.loginApp(controller.userNameController.text, controller.passwordController.text);
                  },
                  child: Text(
                    "Giriş",
                    style: TextStyle(fontSize: 2.5.h),
                  ))),
          Obx(()=> controller.isLoading.value == true
          ? Center(child: CircularProgressIndicator(),)
          : Container(),
          )        
        ]),
      ),
    );
  }
}
