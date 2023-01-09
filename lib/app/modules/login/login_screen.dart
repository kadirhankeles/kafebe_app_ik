import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/widgets/login_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/app_constant.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
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
              //top: 3.h,
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
                        controller.switchControl.value =
                            !controller.switchControl.value;
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
                          border: Border.all(color: Colors.grey, width: 0.5.w)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
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
                    loginTextFormField(
                        "Kullanıcı Adı",
                        controller.userName,
                        TextInputType.text,
                        false,
                        AppConstant.loginTextFormFieldIcon),
                    SizedBox(
                      height: 2.h,
                    ),
                    /* passwordTextFormField(
                        "Şifre",
                        controller.password,
                        TextInputType.visiblePassword,
                        true,
                        AppConstant.passwordTextFormFieldIcon,
                        AppConstant.loginSufIcon), */
                    PasswordTextFormField(
                        controllerr: controller.password, hintText: "Şifre")
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
                     // controller.loginToHome();
                     controller.loginTransition();
                  },
                  child: Text(
                    "Giriş",
                    style: TextStyle(fontSize: 2.5.h),
                  ))),
          /* Positioned(
              top: 80.h,
              child: Container(
                height: 10.h,
                width: 80.w,
                child: PasswordTextFormField(
                  controllerr: controller.password,
                  hintText: "Şifre deneme",
                ),
              )) */
        ]),
      ),
    );
  }

  TextFormField loginTextFormField(String hintText, controller,
      TextInputType inputKeyboardType, bool obsecure, Icon textFormIcon) {
    return TextFormField(
      obscureText: obsecure,
      keyboardType: inputKeyboardType,
      controller: controller,
      cursorColor: AppConstant.loginCursor,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.w),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.w),
              borderSide: BorderSide(color: Colors.grey)),
          prefixIcon: textFormIcon),
    );
  }

  TextFormField passwordTextFormField(
      String hintText,
      controller,
      TextInputType inputKeyboardType,
      bool obsecure,
      Icon textFormIcon,
      Icon sufIcon) {
    return TextFormField(
      obscureText: obsecure,
      keyboardType: inputKeyboardType,
      controller: controller,
      cursorColor: AppConstant.loginCursor,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.w),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.w),
              borderSide: BorderSide(color: Colors.grey)),
          prefixIcon: textFormIcon,
          suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.visibility,
                color: Colors.grey,
              ))),
    );
  }
}

/* class PasswordTextFormField extends GetView<LoginController> {
  final String hintText;
  final  controller;
  final bool obscureText;
  final TextInputType inputKeyboardType;
  final Icon textFormIcon;
  final Function onPressed;

  const PasswordTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.inputKeyboardType,
    required this.textFormIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.userName,
      obscureText: obscureText,
      keyboardType: inputKeyboardType,
      cursorColor: AppConstant.loginCursor,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.w),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.w),
              borderSide: BorderSide(color: Colors.grey)),
          prefixIcon: textFormIcon,
          suffixIcon: IconButton(onPressed: onPressed(), icon: Icon(controller.chanceVisibilityIcon()) )
          ),
    );
  }
} */

/* class UserTextFormField extends GetView<LoginController> {
  final String hintText;
  final  controller;
  final bool obsecureText;
  final TextInputType inputKeyboardType;
  final Icon textFormIcon;
  const UserTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.obsecureText,
    required this.inputKeyboardType,
    required this.textFormIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.password,
      obscureText: obsecureText,
      keyboardType: inputKeyboardType,
      cursorColor: AppConstant.loginCursor,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.w),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.w),
              borderSide: BorderSide(color: Colors.grey)),
          prefixIcon: textFormIcon),
    );
  }
} */
