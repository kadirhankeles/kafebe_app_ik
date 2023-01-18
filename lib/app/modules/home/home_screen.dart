import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/data/models/get_ProfilPicture_model.dart';
import 'package:kafebe_app_ik/app/modules/home/home_controller.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/app_pages.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> managerFalseSun = [
      "assets/request.png",
      "assets/approvals.png",
      "assets/works.png",
      "assets/educations.png",
    ];
    List<String> managerFalse = [
      "assets/request.png",
      "assets/approvals.png",
      "assets/works.png",
    ];

    List<String> managerTrueSun = [
      "assets/request.png",
      "assets/approvals.png",
      "assets/team.png",
      "assets/works.png",
      "assets/educations.png",
    ];
    List<String> managerTrue = [
      "assets/request.png",
      "assets/approvals.png",
      "assets/works.png",
      "assets/team.png",
    ];
    return Scaffold(
        backgroundColor: Color(0xffF4F5FA),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Color(0xff7f0000),
              toolbarHeight: 12.2.h,
              leadingWidth: 30.w,
              elevation: 0,
              //!PROFİL FOTOĞRAFI VE BİLGİLENDİRME BUTONU
              leading: Column(
                children: [
                  SizedBox(
                    height: 0.9.h,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 5.w),
                      Obx(
                        () => controller.isProfilPicture == true
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                    height: 7.h,
                                    width: 7.h,
                                    child: controller.baseToImage(controller
                                        .getProfilPictureModel!
                                        .data!
                                        .profilePicture
                                        .toString())))
                            : Container(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xff7f0000),
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        height: 3.h,
                        width: 3.h,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            splashRadius: 1.h,
                            onPressed: () {
                              Get.dialog(
                                AlertDialog(
                                  backgroundColor: Colors.white.withOpacity(.9),
                                  content: Container(
                                    height: 12.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Uyarı",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                            "Profilinizi güncellemeyi unutmayınız."),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  "TAMAM",
                                                  style: TextStyle(
                                                    color: Color(0xff7f0000),
                                                  ),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.info_outline_rounded,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: .7.h,
                  ),
                  Obx(
                    () {
                      return controller.isLoading == true
                          ? Container(
                              padding: EdgeInsets.only(left: 3.w),
                              width: 34.w,
                              child: Text(
                                  "${controller.getLandingPageInfoModel!.data!.nameSurname}",
                                  style: AppConstant.homeNameSurname,
                                  overflow: TextOverflow.ellipsis))
                          : Container();
                    },
                  )
                ],
              ),
              //! Profil fotoğrafı, isim ve bilgi butonu işlemi bitişi

              //! LOGO Başlangıç
              centerTitle: true,
              title: GestureDetector(
                onTap: () async {
                  await controller.getLandingPageInfoData();
                  await controller.getProfilPictureData();
                },
                child: Container(
                  height: 12.2.h,
                  width: 9.h,
                  //color: Colors.white,
                  child: Image(
                    image: AssetImage("assets/logo.png"),
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                ),
              ),
              //! LOGO Bitiş

              //! Bildirim başlangıç
              actions: [
                SizedBox(
                  height: 1.h,
                ),
                Stack(children: [
                  IconButton(
                      padding: EdgeInsets.only(top: 3.h),
                      onPressed: () {
                        Get.toNamed(Routes.NOTIFICATION);
                      },
                      icon: Icon(Icons.notifications_active),
                      color: Colors.yellow),
                  Positioned(
                    child: Obx(
                      () => controller.isNotiCount == true &&
                              controller.getLandingPageInfoModel!.data!
                                      .unReadedNotificationCount !=
                                  0
                          ? Container(
                              height: 2.h,
                              width: 2.h,
                              decoration: AppConstant.notiContainerWhite,
                              child: Center(
                                  child: Text(
                                "${controller.getLandingPageInfoModel!.data!.unReadedNotificationCount}",
                                style: AppConstant.notiStyleBlack,
                              )),
                            )
                          : Container(),
                    ),
                    top: 2.2.h,
                    left: 6.4.w,
                  )
                ]),
                SizedBox(
                  width: 3.w,
                ),
              ],
              //! Bildirim bitiş
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Container(
                  child: Stack(children: [
                    Positioned(
                        child: Container(
                      height: 25.h,
                      width: double.infinity,
                      decoration: AppConstant.homeTopContainer,
                    )),
                    Padding(
                      padding: EdgeInsets.only(left: 3.h, right: 3.h),
                      child: Column(
                        children: [
                          // ! Gridview'ın bulunduğu container yapısı
                          Container(
                            width: 100.w,
                            child: Obx(
                              () => controller.isLoading == true
                                  ? GridView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller
                                                      .getLandingPageInfoModel!
                                                      .data!
                                                      .isManager ==
                                                  true &&
                                              controller
                                                      .getLandingPageInfoModel!
                                                      .data!
                                                      .sunAkademi ==
                                                  true
                                          ? 5
                                          : controller.getLandingPageInfoModel!
                                                          .data!.isManager ==
                                                      true &&
                                                  controller
                                                          .getLandingPageInfoModel!
                                                          .data!
                                                          .sunAkademi ==
                                                      false
                                              ? 4
                                              : controller.getLandingPageInfoModel!
                                                              .data!.isManager ==
                                                          false &&
                                                      controller
                                                              .getLandingPageInfoModel!
                                                              .data!
                                                              .sunAkademi ==
                                                          true
                                                  ? 4
                                                  : 3,
                                      /*controller
                                          .getLandingPageInfoModel!
                                          .data!
                                          .menuInfo!
                                          .length,*/
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 4.h,
                                              mainAxisSpacing: 3.h,
                                              childAspectRatio: 0.15.h),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            if (controller
                                                        .getLandingPageInfoModel!
                                                        .data!
                                                        .isManager ==
                                                    true &&
                                                controller
                                                        .getLandingPageInfoModel!
                                                        .data!
                                                        .sunAkademi ==
                                                    true) {
                                              if (index == 0) {
                                                Get.toNamed(Paths.REQUESTS);
                                              } else if (index == 1) {
                                                Get.toNamed(Paths.APPROVAL);
                                              } else if (index == 2) {
                                                Get.toNamed(Paths.TEAM,
                                                    arguments: [
                                                      {
                                                        'idHR':
                                                            '${controller.getLandingPageInfoModel!.data!.idHrEmployee.toString()}'
                                                      }
                                                    ]);
                                              }
                                            }
                                            if (controller
                                                        .getLandingPageInfoModel!
                                                        .data!
                                                        .isManager ==
                                                    true &&
                                                controller
                                                        .getLandingPageInfoModel!
                                                        .data!
                                                        .sunAkademi ==
                                                    false) {
                                              if (index == 0) {
                                                Get.toNamed(Paths.REQUESTS);
                                              } else if (index == 1) {
                                                Get.toNamed(Paths.APPROVAL);
                                              } else if (index == 2) {
                                                Get.toNamed(Paths.TEAM,
                                                    arguments: [
                                                      {
                                                        'idHR':
                                                            '${controller.getLandingPageInfoModel!.data!.idHrEmployee.toString()}'
                                                      }
                                                    ]);
                                              }
                                            }
                                            if (controller
                                                        .getLandingPageInfoModel!
                                                        .data!
                                                        .isManager ==
                                                    false &&
                                                controller
                                                        .getLandingPageInfoModel!
                                                        .data!
                                                        .sunAkademi ==
                                                    true) {
                                              if (index == 0) {
                                                Get.toNamed(Paths.REQUESTS);
                                              } else if (index == 1) {
                                                Get.toNamed(Paths.APPROVAL);
                                              }
                                            }
                                            if (controller
                                                        .getLandingPageInfoModel!
                                                        .data!
                                                        .isManager ==
                                                    false &&
                                                controller
                                                        .getLandingPageInfoModel!
                                                        .data!
                                                        .sunAkademi ==
                                                    false) {
                                              if (index == 0) {
                                                Get.toNamed(Paths.REQUESTS);
                                              } else if (index == 1) {
                                                Get.toNamed(Paths.APPROVAL);
                                              }
                                            }
                                          },
                                          child: Stack(children: [
                                            Container(
                                              width: 20.h,
                                              decoration:
                                                  AppConstant.homeButton,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  //! Menü icon dizilimi başlangıç
                                                  AppConstant().homeCircularPhoto(controller
                                                                  .getLandingPageInfoModel!
                                                                  .data!
                                                                  .isManager ==
                                                              true &&
                                                          controller
                                                                  .getLandingPageInfoModel!
                                                                  .data!
                                                                  .sunAkademi ==
                                                              true
                                                      ? managerTrueSun[index]
                                                      : controller
                                                                      .getLandingPageInfoModel!
                                                                      .data!
                                                                      .isManager ==
                                                                  true &&
                                                              controller
                                                                      .getLandingPageInfoModel!
                                                                      .data!
                                                                      .sunAkademi ==
                                                                  false
                                                          ? managerTrue[index]
                                                          : controller
                                                                          .getLandingPageInfoModel!
                                                                          .data!
                                                                          .isManager ==
                                                                      false &&
                                                                  controller
                                                                          .getLandingPageInfoModel!
                                                                          .data!
                                                                          .sunAkademi ==
                                                                      true
                                                              ? managerFalseSun[
                                                                  index]
                                                              : managerFalse[
                                                                  index]),
                                                  //! Menü icon dizilimi bitiş
                                                  SizedBox(
                                                    height: 1.5.h,
                                                  ),
                                                  //! Kategori ismi başlangıç
                                                  Obx(
                                                    () => controller
                                                                .isCategoryName ==
                                                            true
                                                        ? Text(
                                                            "${controller.getLandingPageInfoModel!.data!.isManager == true && controller.getLandingPageInfoModel!.data!.sunAkademi == true ? controller.managerSun[index] : controller.getLandingPageInfoModel!.data!.isManager == true && controller.getLandingPageInfoModel!.data!.sunAkademi == false ? controller.manager[index] : controller.getLandingPageInfoModel!.data!.isManager == false && controller.getLandingPageInfoModel!.data!.sunAkademi == true ? controller.employeeSun[index] : controller.employee[index]}",
                                                            style: AppConstant
                                                                .homeButtonBlack,
                                                          )
                                                        : Container(),
                                                  )
                                                  //! Kategori ismi bitiş
                                                ],
                                              ),
                                            ),
                                            //! Bildirim Sıralaması başlangıç
                                            Positioned(
                                              child: Obx(
                                                () => controller.isNotiCount ==
                                                            true &&
                                                        index <= 2 &&
                                                        controller.notificationCount[
                                                                index] >
                                                            0
                                                    ? Container(
                                                        height: 2.4.h,
                                                        width: 2.4.h,
                                                        decoration: AppConstant
                                                            .notiContainer,
                                                        child: Center(
                                                            child: Text(
                                                          "${controller.notificationCount[index]}",
                                                          style: AppConstant
                                                              .notiStyle,
                                                        )),
                                                      )
                                                    : Container(),
                                              ),
                                              left: 21.w,
                                              top: 3.h,
                                            ),
                                            //! Bildirim Sıralaması bitiş
                                          ]),
                                        );
                                      },
                                    )
                                  : Container(
                                      height: 30.h,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xff7f0000),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          //! Gridview bitiş
                          SizedBox(
                            height: 3.h,
                          ),

                          //!Bordrolarım butonunun tasarımı
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.PAYROLL);
                            },
                            child: Container(
                              height: 10.h,
                              width: double.infinity,
                              decoration: AppConstant.homeButton,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Container(
                                    child: AppConstant().homeCircularPhoto(
                                        "assets/payroll.png"),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text("Bordrolarım",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          //! İZİNLERİM BUTON TASARIMI
                          GestureDetector(
                            onTap: () {
                              print("Tıklandı izinlerim");
                            },
                            child: Container(
                              height: 27.h,
                              width: double.infinity,
                              decoration: AppConstant.homeButton,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      AppConstant().homeCircularPhoto(
                                          "assets/vacation.png"),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text("İzinlerim",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18)),
                                      SizedBox(
                                        width: 33.w,
                                      ),
                                      IconButton(
                                          splashColor: Colors.white,
                                          splashRadius: 1.h,
                                          onPressed: () {
                                            print("Tıklandı artı");
                                            Get.toNamed(Routes.LEAVE_ADD,
                                                arguments: [
                                                  {
                                                    "izin": controller
                                                        .getLandingPageInfoModel!
                                                        .data!
                                                        .vacationInfo!
                                                        .employeeEarnedRightsList![
                                                            0]
                                                        .nEXTLEAVEALLOWANCEDAYS
                                                  }
                                                ]);
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.black,
                                            size: 32,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Container(
                                        height: 11.h,
                                        width: 10.h,
                                        decoration:
                                            AppConstant.homeIzinlerimContainer,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "İzin\nBakiyesi",
                                              style: AppConstant
                                                  .homeIzinlerimAciklama,
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 2.5.h,
                                            ),
                                            Obx(
                                              () => controller.isLoading == true
                                                  ? Text(
                                                      controller
                                                          .getLandingPageInfoModel!
                                                          .data!
                                                          .vacationInfo!
                                                          .employeeEarnedRightsList![
                                                              0]
                                                          .aNNUALLEAVEBALANCE
                                                          .toString(),
                                                      style: AppConstant
                                                          .homeIzinlerimAciklama,
                                                    )
                                                  : Container(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      Container(
                                        height: 11.h,
                                        width: 10.h,
                                        decoration:
                                            AppConstant.homeIzinlerimContainer,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "İzin\nHakediş\nTarihi",
                                              style: AppConstant
                                                  .homeIzinlerimAciklama,
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 1.5.h,
                                            ),
                                            Obx(
                                              () => controller.isLoading == true
                                                  ? Text(
                                                      controller
                                                          .getLandingPageInfoModel!
                                                          .data!
                                                          .vacationInfo!
                                                          .employeeEarnedRightsList![
                                                              0]
                                                          .nEXTLEAVEALLOWANCEDATE
                                                          .toString()
                                                          .substring(0, 10),
                                                      style: AppConstant
                                                          .homeIzinlerimAciklama,
                                                    )
                                                  : Container(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      Container(
                                        height: 11.h,
                                        width: 10.h,
                                        decoration:
                                            AppConstant.homeIzinlerimContainer,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "İzin Hakediş Gün Sayısı",
                                              style: AppConstant
                                                  .homeIzinlerimAciklama,
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              height: 2.5.h,
                                            ),
                                            Obx(
                                              () => controller.isLoading == true
                                                  ? Text(
                                                      controller
                                                          .getLandingPageInfoModel!
                                                          .data!
                                                          .vacationInfo!
                                                          .employeeEarnedRightsList![
                                                              0]
                                                          .nEXTLEAVEALLOWANCEDAYS
                                                          .toString(),
                                                      style: AppConstant
                                                          .homeIzinlerimAciklama,
                                                    )
                                                  : Container(),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.cacheToken = "";
                              controller.cacheRemoveAndGoToLogin();
                            },
                            child: Container(
                              height: 10.h,
                              width: double.infinity,
                              decoration: AppConstant.homeRedButton,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  AppConstant().homeCircularWhite(
                                    "assets/exit.png",
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text("Çıkış Yap",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            )
          ],
        ));
  }

  menuAyir() {}
}
