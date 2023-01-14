import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/language/language_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LanguageScreen extends GetView<LanguageController> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff850000),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        child: Column(
          children: [
            SizedBox(
              height: 90.h,
              width: double.infinity,
              child: ListView.builder(
                itemCount: controller.getLanguageModel?.data?.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(bottom: 2.h),
                  child: Obx(
                    () => controller.isLoading == true
                        ? Row(
                            children: [
                              Container(
                                height: 4.h,
                                width: 4.w,
                                child: controller.baseToImage(controller
                                    .getLanguageModel!.data![index].lANGUAGELOGO
                                    .toString()),
                              ),
                              SizedBox(
                                height: 10.w,
                              ),
                              Text(
                                  "${controller.getLanguageModel?.data?[index].lANGUAGENAME}")
                            ],
                          )
                        : Container(
                            child: Center(
                            child: CircularProgressIndicator(),
                          )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
