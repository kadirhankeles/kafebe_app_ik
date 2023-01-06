import 'package:flutter/material.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe53935),
        toolbarHeight: 10.h,
        leadingWidth: 15.h,
        leading: Row(
          children: [
            SizedBox(
              width: 1.h,
            ),
            Container(
              height: 8.h,
              width: 8.h,
              decoration: AppConstant.homeProfilePhoto,
            ),
            IconButton(
                splashRadius: 2.h,
                onPressed: () {},
                icon: Icon(Icons.info_outline_rounded)),
          ],
        ),
        title: Row(
          children: [
            
                SizedBox(
                  width: 4.h,
                ),
            Container(
              height: 10.h,
              width: 9.h,
              color: Colors.white,
              child: Center(child: Text("Logo", style: TextStyle(color: Colors.black),),),
            ),
            
            
          ],
          
        ),
        actions: [
          IconButton(onPressed: () {
              
            }, icon: Icon(Icons.notifications_active), color: Colors.yellow),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Text("Home Screen"),
          )
        ],
      ),
    );
  }
}
