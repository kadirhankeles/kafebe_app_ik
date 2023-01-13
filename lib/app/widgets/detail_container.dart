import 'package:flutter/material.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailContainer extends StatelessWidget {
  final String name1;
  final String description1;
  final String name2;
  final String description2;
  final String name3;
  final String description3;
  final String name4;
  final String description4;
  final String name5;
  final String description5;
  final String icons;
  DetailContainer({super.key, required this.name1, required this.description1, required this.name2, required this.description2, required this.name3, required this.description3, required this.name4, required this.description4, required this.name5, required this.description5, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 33.h,
        width: double.infinity,
        decoration: AppConstant.homeButton,
        child: Padding(
          padding:  EdgeInsets.all(1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 6.h,
                    width: 6.h,
                    child: Image.asset(icons),
                  ), Container(
                    padding: EdgeInsets.only(left: 0.8.h),
                    height: 6.h,
                    width: 40.w,
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name1, style: AppConstant.detailGrey ,),
                        SizedBox(height: 0.6.h,),
                        Text(description1),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 1.4.h,),
              Text(name2, style: AppConstant.detailGrey,),
              SizedBox(height: 0.5.h,),
              Text(description2),
              SizedBox(height: 1.4.h,),
              Text(name3, style: AppConstant.detailGrey,),
              SizedBox(height: 0.5.h,),
              Text(description3),
              SizedBox(height: 1.4.h,),
              Text(name4, style: AppConstant.detailGrey,),
              SizedBox(height: 0.5.h,),
              Text(description4),
              SizedBox(height: 1.4.h,),
              Text(name5, style: AppConstant.detailGrey,),
              SizedBox(height: 0.5.h,),
              Text(description5),
            ],
          ),
        ),
      ),
    );
  }
}