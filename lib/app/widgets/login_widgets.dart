import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../modules/login/login_controller.dart';
import '../utils/app_constant.dart';

class PasswordTextFormField extends GetView<LoginController> {
  final TextEditingController controllerr;
  final String hintText;

  const PasswordTextFormField({
    super.key,
    required this.controllerr,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          controller: controller.password,
          cursorColor: AppConstant.loginCursor,
          keyboardType: TextInputType.visiblePassword,
          obscureText: controller.loginVisibility.value,
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
            prefixIcon: AppConstant.passwordTextFormFieldIcon,
            suffixIcon: IconButton(
                onPressed: () {
                  controller.chanceVisibility();
                },
                icon: controller.chanceVisibilityIcon()),
          ),
        ));
  }
}
