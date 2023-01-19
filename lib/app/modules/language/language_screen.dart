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
      body: Obx(()=>Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
        child: Column(
          children: [
             Expanded(
                child: controller.isLoading == true
                    ? ListView.builder(
                        itemCount: controller.getLanguageModel?.data?.length,
                        itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.only(bottom: 2.h),
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 2.h,
                                    width: 2.h,
                                    child: controller.baseToImage(controller
                                        .getLanguageModel!
                                        .data![index]
                                        .lANGUAGELOGO
                                        .toString()),
                                  ),
                                  SizedBox(
                                    height: 10.w,
                                    width: 5.w,
                                  ),
                                  Text(
                                    "${controller.getLanguageModel?.data?[index].lANGUAGENAME}",
                                  ),
                                ],
                              ),
                            )),
                      )
                    : ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(bottom: 2.h),
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 4.h,
                                  width: 4.h,
                                  child:
                                      Image.asset("${controller.flag[index]}"),
                                ),
                                SizedBox(
                                  height: 10.w,
                                  width: 5.w,
                                ),
                                Text(
                                  controller.languageList[index],
                                  style: TextStyle(fontSize: 2.h),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
            
          ],
        ),
      ),)
    );
  }
}
