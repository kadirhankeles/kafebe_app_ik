import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AcademyScreen extends StatelessWidget {
  const AcademyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF4F5FA),
      appBar: AppBar(
        backgroundColor: AppConstant.loginBackground,
        title: Text("Sun Akademi"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.turn_left)),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.filter_vintage_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 2.h),
        child: Column(
          children: [
            TextFormField(
              cursorColor: AppConstant.loginCursor,
              keyboardType: TextInputType.visiblePassword,
              cursorHeight: 3.h,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "Arama Yap",
                hintStyle: TextStyle(fontSize: 2.2.h),
                enabledBorder: OutlineInputBorder(
                  borderRadius: AppConstant.globalRadius,
                  borderSide: AppConstant.textFieldBorderColor,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: AppConstant.globalRadius,
                    borderSide: AppConstant.textFieldBorderColor),
                prefixIcon: AppConstant.searchIcon,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Tümü",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              height: 69.h,
              width: 100.w,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 2.h),
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(179, 243, 210, 210),
                        borderRadius: BorderRadius.circular(2.w),
                        border: Border.all(color: Colors.grey, width: 0.5.w)),
                    child: Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: 5.h,
                                  width: 10.w,
                                  child: Image.asset("assets/myJobs.png")),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "16.02.2023 17:09 - 31.01.2023 23:59",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    "Kurum İçi Veri Sızıntısı Eğitimi",
                                    style: TextStyle(fontSize: 2.h),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 2.6.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: .8.w, left: .8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Score",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "Completed Date",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 2.h),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 47.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(fontSize: 2.h),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Text(
                                  "Status",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  "Tamamlanmamış",
                                  style: TextStyle(fontSize: 2.h),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Text(
                                  "Success Status",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  "Devam Ediyor",
                                  style: TextStyle(fontSize: 2.h),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
