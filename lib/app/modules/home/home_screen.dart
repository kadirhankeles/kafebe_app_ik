import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF4F5FA),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Color(0xff850000),
              toolbarHeight: 12.2.h,
              leadingWidth: 35.w,
              elevation: 0,
              //!PROFİL FOTOĞRAFI VE BİLGİLENDİRME BUTONU
              leading: Row(
                children: [
                  SizedBox(width: 3.w),
                  Column(
                    children: [
                      SizedBox(
                        height: .6.h,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                              height: 8.h,
                              width: 8.h,
                              decoration: BoxDecoration(),
                              child: Image(
                                image: NetworkImage(
                                    "https://www.fortuneturkey.com/wp-content/uploads/2021/07/BI%CC%87ROL-BAS%CC%A7ARAN-1.jpg"),
                                fit: BoxFit.cover,
                              ))),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text("Birol B.")
                    ],
                  ),
                  IconButton(
                      splashRadius: 2.h,
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Uyarı",
                          middleText: "Profilinizi güncellemeyi unutmayınız.",
                          backgroundColor: Colors.grey.withOpacity(.9),
                          titleStyle: TextStyle(color: Colors.white),
                          middleTextStyle: TextStyle(color: Colors.white),
                          radius: 10,
                          actions: [
                            SizedBox(
                              width: 45.w,
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: .1.h, color: Colors.white),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                'Close',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                      icon: Icon(
                        Icons.info_outline_rounded,
                        color: Colors.white,
                      )),
                ],
              ),
              // LOGO
              title: Row(
                children: [
                  SizedBox(
                    width: 4.w,
                  ),
                  Container(
                    height: 10.h,
                    width: 9.h,
                    //color: Colors.white,
                    child: Image(
                      image: AssetImage("assets/logo.png"),
                      fit: BoxFit.cover,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_active),
                    color: Colors.yellow),
              ],
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
                    // ! Gridview'ın bulunduğu container yapısı
                    Padding(
                      padding: EdgeInsets.only(left: 3.h, right: 3.h),
                      child: Column(
                        children: [
                          Container(
                            width: 100.w,
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
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
                                    print("Tıklandı $index");
                                  },
                                  child: Container(
                                    decoration: AppConstant.homeButton,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                      children: [
                                        AppConstant().homeCircularPhoto(
                                            "https://i.pinimg.com/originals/82/45/11/8245110ee348458df3733d514ee64446.jpg"),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        Text(
                                          "My Task",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),

                          //!Bordrolarım butonunun tasarımı
                          GestureDetector(
                            onTap: () {
                              print("Tıklandı Bordrolarım");
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
                                        "https://cdn-icons-png.flaticon.com/512/769/769226.png?w=1060&t=st=1673273165~exp=1673273765~hmac=3fdc7697f965728894049283b18668f27de1431a345307406a5f36ad667562c4"),
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
                                          "https://cdn-icons-png.flaticon.com/512/2284/2284211.png"),
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
                                        decoration: AppConstant.homeIzinlerimContainer,
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
                                            Text(
                                              "data",
                                              style: AppConstant
                                                  .homeIzinlerimAciklama,
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
                                        decoration: AppConstant.homeIzinlerimContainer,
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
                                            Text(
                                              "data",
                                              style: AppConstant
                                                  .homeIzinlerimAciklama,
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
                                        decoration: AppConstant.homeIzinlerimContainer,
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
                                            Text(
                                              "data",
                                              style: AppConstant
                                                  .homeIzinlerimAciklama,
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
                          SizedBox(height: 3.h,),
                          GestureDetector(
                            onTap: () {
                              print("ÇıkışYap");
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
                                  AppConstant().homeCircularPhoto(
                                      "https://i.pinimg.com/originals/82/45/11/8245110ee348458df3733d514ee64446.jpg"),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text("Çıkış Yap",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18))
                                ],
                              ),
                            ),
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
}
