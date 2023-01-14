import 'package:flutter/material.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InfoContainer extends StatelessWidget {
  final String top1;
  final String des1;
  final String top2;
  final String des2;
  final String top3;
  final String des3;
  final String detail1;
  final String detailDes1;
  final String detail2;
  final String detailDes2;
  final String detail3;
  final String detailDes3;
  final String detail4;
  final String detailDes4;
  final String detail5;
  final String detailDes5;
  final String detail6;
  final String detailDes6;
  final String detail7;
  final String detailDes7;
  final String detail8;
  final String detailDes8;
  final String detail9;
  final String detailDes9;
  final String detail10;
  final String detailDes10;
  final String detail11;
  final String detailDes11;
  final String detail12;
  final String detailDes12;
  final String detail13;
  final String detailDes13;
  final String detail14;
  final String detailDes14;
  final String detail15;
  final String detailDes15;
  final String detail16;
  final String detailDes16;
  final String detail17;
  final String detailDes17;
  final String detail18;
  final String detailDes18;
  final String bottom1;
  final String bottomDes1;
  final String bottom2;
  final String bottomDes2;
  final String image1;
  final String image2;

  const InfoContainer({super.key, required this.top1, required this.des1, required this.top2, required this.des2, required this.top3, required this.des3, required this.detail1, required this.detailDes1, required this.detail2, required this.detailDes2, required this.detail3, required this.detailDes3, required this.detail4, required this.detailDes4, required this.detail5, required this.detailDes5, required this.detail6, required this.detailDes6, required this.detail7, required this.detailDes7, required this.detail8, required this.detailDes8, required this.detail9, required this.detailDes9, required this.detail10, required this.detailDes10, required this.detail11, required this.detailDes11, required this.detail12, required this.detailDes12, required this.detail13, required this.detailDes13, required this.detail14, required this.detailDes14, required this.detail15, required this.detailDes15, required this.detail16, required this.detailDes16, required this.detail17, required this.detailDes17, required this.detail18, required this.detailDes18, required this.bottom1, required this.bottomDes1, required this.bottom2, required this.bottomDes2, required this.image1, required this.image2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 1.5.h),
      child: Container(
        height: 97.h,
        width: double.infinity,
        decoration: AppConstant.infoContainer,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(1.h),
              child: Container(
                height: 12.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 6.h,
                          width: 6.h,
                          child: Image.asset(image1),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 0.8.h),
                          height: 6.h,
                          width: 40.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                top1,
                                style: AppConstant.detailGrey,
                              ),
                              SizedBox(
                                height: 0.6.h,
                              ),
                              Text(des1),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Container(
                          height: 4.h,
                          width: 42.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                top2,
                                style: AppConstant.detailGrey,
                              ),
                              Text(
                                des2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 4.h,
                          width: 42.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                top3,
                                style: AppConstant.detailGrey,
                              ),
                              Text(
                                des3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
                height: 5.h,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: Padding(
                  padding: EdgeInsets.all(1.5.h),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Detay", textAlign: TextAlign.start,),
                    ],
                  ),
                ),
              ),
          
          Padding(
            padding:  EdgeInsets.all(1.h),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail1, style: AppConstant.detailGrey,),
                    Text(detailDes1),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail2, style: AppConstant.detailGrey,),
                    Text(detailDes2),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail3, style: AppConstant.detailGrey,),
                    Container(
                      height: 4.h,
                      width: 50.w,child: Text(detailDes3, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end, maxLines: 2,)),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail4, style: AppConstant.detailGrey,),
                    Text(detailDes4),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail5, style: AppConstant.detailGrey,),
                    Text(detailDes5),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail6, style: AppConstant.detailGrey,),
                    Text(detailDes6),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail7, style: AppConstant.detailGrey,),
                    Text(detailDes7),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail8, style: AppConstant.detailGrey,),
                    Text(detailDes8),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail9, style: AppConstant.detailGrey,),
                    Text(detailDes9),
                  ],
                ),
                SizedBox(height: 1.h,),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail10, style: AppConstant.detailGrey,),
                    Text(detailDes10),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail11, style: AppConstant.detailGrey,),
                   Text(detailDes11),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail12, style: AppConstant.detailGrey,),
                    Text(detailDes12),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail13, style: AppConstant.detailGrey,),
                    Text(detailDes13),
                  ],
                ), SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail14, style: AppConstant.detailGrey,),
                    Container(
                      height: 4.h,
                      width: 50.w,child: Text(detailDes14, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end, maxLines: 2,)),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail15, style: AppConstant.detailGrey,),
                     Container(
                      height: 4.h,
                      width: 40.w,child: Text(detailDes15, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end, maxLines: 2,)),
                  ],
                ),
               
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail16, style: AppConstant.detailGrey,),
                    Text(detailDes16),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail17, style: AppConstant.detailGrey,),
                    Text(detailDes17),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(detail18, style: AppConstant.detailGrey,),
                    Text(detailDes18),
                  ],
                ),
              ],
            ),
          ),
          Container(
                height: 5.h,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: Padding(
                  padding: EdgeInsets.all(1.5.h),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tarihçe", textAlign: TextAlign.start,),
                    ],
                  ),
                ),
              ),
          Padding(
            padding: EdgeInsets.only(left:1.h, right: 1.h,top: 1.h),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                          height: 6.h,
                          width: 6.h,
                          child: Image.asset(image2),
                        ),
                SizedBox(width: 5.w,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 2.h ,child: Text(bottom1, style: AppConstant.detailGrey,)),
                    SizedBox(height: 1.h,),
                    Container(
                      height: 6.h,
                      width: 35.w, child: Text(bottomDes1, overflow: TextOverflow.visible, textAlign: TextAlign.start,)),
                  ],
                ),
                SizedBox(width: 4.w,),
                Column(
                  children: [
                    Text(bottom2, style: AppConstant.detailGrey,),
                    SizedBox(height: 1.h,),
                    Text(bottomDes2),
                  ],
                )
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}
