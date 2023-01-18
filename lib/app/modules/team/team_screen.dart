import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/home/home_controller.dart';
import 'package:kafebe_app_ik/app/modules/team/team_controller.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TeamScreen extends GetView<TeamController> {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xffF4F5FA),
      appBar: AppBar(
        title: Text("Ekibim"),
        backgroundColor: Color(0xff7f0000),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.dialog(AlertDialog(
                    backgroundColor: Colors.white.withOpacity(.9),
                    content: Container(
                      height: 25.h,
                      child: Column(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getMyTeamData(
                                    DateTime.now().toString(),
                                    controller.statuCode[0],
                                    7217);
                                controller.screenString.value = controller.statuString[0];
                                Get.back();
                              },
                              child: Text("Direkt Bağlı Çalışanlar")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getMyTeamData(
                                    DateTime.now().toString(),
                                    controller.statuCode[1],
                                    7217);
                                controller.screenString.value = controller.statuString[1];
                                Get.back();
                              },
                              child: Text("Vekaleten Bağlı Çalışanlar")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                controller.getMyTeamData(
                                    DateTime.now().toString(),
                                    controller.statuCode[2],
                                    7217);
                                controller.screenString.value = controller.statuString[2];
                                Get.back();
                              },
                              child: Text("Fonksiyonel Bağlı Çalışanlar")),
                          TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("Vazgeç")),
                        ],
                      ),
                    )));
              },
              icon: Icon(Icons.filter_alt_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => controller.isLoading == true
                ? Container(
                    height: 4.5.h,
                    width: double.infinity,
                    child: Center(
                      child: Text(controller.screenString.value),
                    ),
                  )
                : Container()),
            Padding(
              padding: EdgeInsets.only(left: 2.h, right: 2.h),
              child: Container(
                width: 100.w,
                child: Obx(
                  () => controller.isLoading == true && controller.myTeamModel!.data!.length!=0
                      ? GridView.builder(
                          shrinkWrap: true,
                          itemCount: controller.myTeamModel!.data!.length,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 1.5.h,
                                  mainAxisSpacing: 3.h,
                                  childAspectRatio: 0.12.h),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: AppConstant.homeButton,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                          height: 7.h,
                                          width: 7.h,
                                          child: HomeController().baseToImage(
                                              controller.myTeamModel!
                                                  .data![index].pHOTOADDRESS
                                                  .toString()))),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  Container(
                                    child: Center(
                                        child: Text(
                                      "${controller.myTeamModel!.data![index].eMPLOYEENAME} ${controller.myTeamModel!.data![index].eMPLOYEESURNAME}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    )),
                                  ),
                                  SizedBox(
                                    height: .7.h,
                                  ),
                                  Container(
                                    child: Center(
                                        child: Text(
                                      "${controller.myTeamModel!.data![index].pOSITIONNAME}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    )),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      :controller.isLoading ==true && controller.myTeamModel!.data!.length==0?Container(height: 75.h, child: Center(child: Text("Çalışan Bulunmamaktadır!", textAlign: TextAlign.center, style: TextStyle(color: Color(0xff7f0000), fontSize: 16, fontWeight: FontWeight.bold),),),):
                       Container(
                              height: 80.h,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xff7f0000),
                                ),
                              ),
                            ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
