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
  final List<String> keyValue;
  final String bottom1;
  final String bottomDes1;
  final String bottom2;
  final String bottomDes2;
  final String image1;
  final String image2;

  const InfoContainer({super.key, required this.top1, required this.des1, required this.top2, required this.des2, required this.top3, required this.des3, required this.detail1, required this.detailDes1, required this.bottom1, required this.bottomDes1, required this.bottom2, required this.bottomDes2, required this.image1, required this.image2, required this.keyValue, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 1.5.h, bottom: 1.5.h),
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
                              Text(des1=="null"?"-": des1),
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
                                des2=="null"?"-":des2,
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
                                des3=="null"?"-":des3,
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
                    Text(keyValue[0], style: AppConstant.detailGrey,),
                    Text(keyValue[1]),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[2], style: AppConstant.detailGrey,),
                    Container(
                      height: 4.h,
                      width: 50.w,child: Text(keyValue[3], overflow: TextOverflow.ellipsis, textAlign: TextAlign.end, maxLines: 2,)),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[4], style: AppConstant.detailGrey,),
                    Text(keyValue[5]),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[6], style: AppConstant.detailGrey,),
                    Text(keyValue[7]),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[8], style: AppConstant.detailGrey,),
                    Text(keyValue[9]),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[10], style: AppConstant.detailGrey,),
                    Text(keyValue[11]),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[12], style: AppConstant.detailGrey,),
                    Text(keyValue[13]),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[14], style: AppConstant.detailGrey,),
                    Text(keyValue[15]),
                  ],
                ),
                SizedBox(height: 1.h,),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[16], style: AppConstant.detailGrey,),
                    Text(keyValue[17]),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[18], style: AppConstant.detailGrey,),
                   Text(keyValue[19]),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[20], style: AppConstant.detailGrey,),
                    Text(keyValue[21]),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[22], style: AppConstant.detailGrey,),
                    Text(keyValue[23]),
                  ],
                ), SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[24], style: AppConstant.detailGrey,),
                    Container(
                      height: 4.h,
                      width: 50.w,child: Text(keyValue[25], overflow: TextOverflow.ellipsis, textAlign: TextAlign.end, maxLines: 2,)),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[26], style: AppConstant.detailGrey,),
                     Container(
                      height: 4.h,
                      width: 40.w,child: Text(keyValue[27], overflow: TextOverflow.ellipsis, textAlign: TextAlign.end, maxLines: 2,)),
                  ],
                ),
               
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[28], style: AppConstant.detailGrey,),
                    Text(keyValue[29]),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[30], style: AppConstant.detailGrey,),
                    Text(keyValue[31]),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keyValue[32], style: AppConstant.detailGrey,),
                    Text(keyValue[33]),
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
