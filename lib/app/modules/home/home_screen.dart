import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcfd8dc),
      appBar: AppBar(
        backgroundColor: Color(0xffe53935),
        toolbarHeight: 10.h,
        leadingWidth: 33.w,
        leading: Row(
          children: [
            SizedBox(
              width: 4.w,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                    height: 8.h,
                    width: 8.h,
                    decoration: BoxDecoration(),
                    child: Image(
                      image: NetworkImage(
                          "https://www.wanhaber.com/images/haberler/2020/04/vanli-is-adami-erdogan-in-cagrisina-5-milyon-tl-ile-destek-verdi_b5483.jpg"),
                      fit: BoxFit.cover,
                    ))),
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
                          side: BorderSide(width: .1.h, color: Colors.white),
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
                icon: Icon(Icons.info_outline_rounded)),
          ],
        ),
        title: Row(
          children: [
            SizedBox(
              width: 6.w,
            ),
            Container(
              height: 10.h,
              width: 9.h,
              //color: Colors.white,
              child: Image(
                image: AssetImage("assets/logo.png"),
                fit: BoxFit.cover,
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
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            // Gridview'ın bulunduğu container yapısı
            Container(
              width: 100.w,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.h,
                    mainAxisSpacing: 2.h,
                    childAspectRatio: 0.15.h),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print("Tıklandı $index");
                    },
                    child: Container(
                      decoration: AppConstant.homeButton,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppConstant().homeCircularPhoto(
                              "https://iconarchive.com/download/i103201/blackvariant/button-ui-nik-collection/HDR-Efex-Pro.ico"),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            "TEXT",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            //Bordrolarım butonunun tasarımı
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
                    AppConstant().homeCircularPhoto(
                        "https://iconarchive.com/download/i103201/blackvariant/button-ui-nik-collection/HDR-Efex-Pro.ico"),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text("Bordrolarım",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            // İZİNLERİM BUTON TASARIMI
            GestureDetector(
              onTap: () {
                print("Tıklandı izinlerim");
              },
              child: Container(
                height: 23.h,
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
                            "https://iconarchive.com/download/i103201/blackvariant/button-ui-nik-collection/HDR-Efex-Pro.ico"),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text("İzinlerim",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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
                              color: Colors.white,
                              size: 32,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 10.h,
                          width: 10.h,
                          decoration: AppConstant.homeIzinlerimduzen,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "İzin\nBakiyesi",
                                style: AppConstant.homeIzinlerimAciklama,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "data",
                                style: AppConstant.homeIzinlerimAciklama,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 10.h,
                          width: 10.h,
                          decoration: AppConstant.homeIzinlerimduzen,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "İzin\nHakediş\nTarihi",
                                style: AppConstant.homeIzinlerimAciklama,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                "data",
                                style: AppConstant.homeIzinlerimAciklama,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 10.h,
                          width: 10.h,
                          decoration: AppConstant.homeIzinlerimduzen,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "İzin Hakediş Gün Sayısı",
                                style: AppConstant.homeIzinlerimAciklama,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "data",
                                style: AppConstant.homeIzinlerimAciklama,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
