import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kafebe_app_ik/app/modules/employeeLeave/employeeLeave_controller.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmployeeLeaveScreen extends GetView<EmployeeLeaveController> {
  const EmployeeLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5FA),
      appBar: AppBar(
        title: Text("Çalışan İzinleri"),
        backgroundColor: Color(0xff7f0000),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading==true?SingleChildScrollView(
        child: Padding(
            padding:  EdgeInsets.all(3.h),
            child: Container(
              width: double.infinity,
              decoration: AppConstant.homeButton,
              child: Padding(
                padding:  EdgeInsets.all(3.h),
                child: Column(
                  children: [
                    Text('${controller.employeeLeaveModel!.data!.employeeEarnedRightsList![0].eMPLOYEENAME} ${controller.employeeLeaveModel!.data!.employeeEarnedRightsList![0].eMPLOYEESURNAME}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
                    SizedBox(height: 3.h,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Yıllık İzin Bakiyesi', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(controller.employeeLeaveModel!.data!.employeeEarnedRightsList![0].aNNUALLEAVEBALANCE.toString(), style: TextStyle(color: controller.employeeLeaveModel!.data!.employeeEarnedRightsList![0].aNNUALLEAVEBALANCE!<0?Colors.red:Colors.black, fontWeight: controller.employeeLeaveModel!.data!.employeeEarnedRightsList![0].aNNUALLEAVEBALANCE!<0?FontWeight.bold:FontWeight.normal),),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('İlgili Yıl İzin Hakediş Tarihi', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(DateFormat('dd.MM.yyyy').format(DateTime.parse(controller.employeeLeaveModel!.data!.employeeEarnedRightsList![0].nEXTLEAVEALLOWANCEDATE!))),
                      ],
                    ),
                    SizedBox(height: 1.h,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('İlgili Yıl İzin Gün Sayısı', style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(controller.employeeLeaveModel!.data!.employeeEarnedRightsList![0].nEXTLEAVEALLOWANCEDAYS.toString()),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Container(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.employeeLeaveModel!.data!.employeeLeaveList!.length,
                        itemBuilder: (context, index) {
                        return Container(
                          height: 8.h,
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 1.h),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.employeeLeaveModel!.data!.employeeLeaveList![index].pICKLISTVACATIONTYPENAME.toString()),
                                  SizedBox(height: .5.h,),
                                  Text('${DateFormat('dd.MM.yyyy').format(DateTime.parse(controller.employeeLeaveModel!.data!.employeeLeaveList![index].sDATE!))} - ${DateFormat('dd.MM.yyyy').format(DateTime.parse(controller.employeeLeaveModel!.data!.employeeLeaveList![index].eDATE!))}', style: TextStyle(fontSize: 12),),
                                ],
                              ),
                              Container(
                                height: 4.5.h,
                                width: 15.w,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.green),
                                child: Center(child: Text('${controller.employeeLeaveModel!.data!.employeeLeaveList![index].dAY.toString()} Gün', style: TextStyle(fontSize: 12, color: Colors.white),)),
                              )
                            ],
                          ),
                        );
                      },),
                    )
                  ],
                ),
              ),
            ),
          ),
      ):Container(),

      )
    );
  }
}