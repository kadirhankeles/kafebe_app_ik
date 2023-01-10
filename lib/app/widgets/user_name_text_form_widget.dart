import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/login/login_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/app_constant.dart';

class UserNameTextFormField extends GetView<LoginController> {
  final TextEditingController controllerrr;
  final String hintText;
  const UserNameTextFormField(
    this.hintText,
    this.controllerrr, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.userNameController,
      cursorColor: AppConstant.loginCursor,
      keyboardType: TextInputType.emailAddress,
      cursorHeight: 3.h,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: AppConstant.globalRadius,
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: AppConstant.globalRadius,
            borderSide: BorderSide(color: Colors.grey)),
        prefixIcon: AppConstant.loginTextFormFieldIcon,
      ),
    );
  }
}
