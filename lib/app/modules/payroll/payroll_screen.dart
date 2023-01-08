import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/payroll/payroll_controller.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PayrollScreen extends GetView<PayrollController> {
  const PayrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcfd8dc),
      body: Column(
      children: [
      Container(
        height: 15.h,
        width: double.infinity,
        decoration: AppConstant.payrollLastpayroll,
        child: Center(
            child: Text(
          "Son Bordronuz: data",
          style: AppConstant.payrollLastStyle,
        )),
      ),
      
      Padding(
        padding: EdgeInsets.only(right: 1.h, left: 1.h),
        child: Container(
          height: 84.h,
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 20,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 7.h,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 6,
                        child: Center(
                          child: Text("data", style: AppConstant.payrollStyle,),
                        ),
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                      )));
            },
          ),
        ),
      )
      ],
      ),
    );
  }
}
