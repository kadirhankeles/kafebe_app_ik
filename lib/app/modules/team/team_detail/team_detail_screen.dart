import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kafebe_app_ik/app/modules/team/team_detail/team_detail_controller.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../home/home_controller.dart';

class TeamDetailScreen extends GetView<TeamDetailController> {
  const TeamDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5FA),
      appBar: AppBar(
        title: Text("Ekibim"),
        backgroundColor: Color(0xff7f0000),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading == true?Padding(
          padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 1.h, bottom: 1.h),
          child: Container(
            decoration: AppConstant.homeButton,
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 9.h,
                            width: 9.h,
                            child:  HomeController().baseToImage(
                                                controller.employeeDetailCV!.data!.employee!.pHOTOADDRESS.toString())
                          )),SizedBox(
                            width: 5.w,
                          ),
                      Container(height: 6.h ,width: 55.w, child: Text("${controller.employeeDetailCV!.data!.employee!.eMPLOYEENAME} ${controller.employeeDetailCV!.data!.employee!.eMPLOYEESURNAME}", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold), textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 2,)),
                    ],
                  ),
                  SizedBox(height: 3.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Şirket Bilgisi: ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(controller.employeeDetailCV!.data!.employee!.fIRMSSHORTNAME==null?"-":"${controller.employeeDetailCV!.data!.employee!.fIRMSSHORTNAME}"),
                    ],
                  ),
                  SizedBox(height: .5.h),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Organizasyon Bilgisi: ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Container(height: 8.h,  width: 47.w, child: Center(child: Text(controller.employeeDetailCV!.data!.employee!.oRGANIZATIONNAME==null?"-":"${controller.employeeDetailCV!.data!.employee!.oRGANIZATIONNAME}", style: TextStyle(fontSize: 11), textAlign: TextAlign.end, overflow: TextOverflow.ellipsis, maxLines: 4,))),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pozisyon:", style: TextStyle(fontWeight: FontWeight.bold),),
                      Container(height: 4.1.h,  width: 47.w,child: Center(child: Text(controller.employeeDetailCV!.data!.employee!.pOSITIONNAME==null?"-":"${controller.employeeDetailCV!.data!.employee!.pOSITIONNAME}",style: TextStyle(fontSize: 11), textAlign: TextAlign.end, overflow: TextOverflow.ellipsis, maxLines: 2,))),
                    ],
                  ),
                  SizedBox(height: .5.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Şirkete Giriş Tarihi:", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(controller.employeeDetailCV!.data!.employee!.cOMPANYSDATE==null?"-":'${DateFormat('dd.MM.yyyy').format(DateTime.parse(controller.employeeDetailCV!.data!.employee!.cOMPANYSDATE.toString()))}', textAlign: TextAlign.end),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Center(child: Text("VBT/Grup/Şirket/Son Pozisyon Kıdemi:", style: TextStyle(fontWeight: FontWeight.bold),)),
                  SizedBox(height: .5.h,),
                  Center(child: Text(controller.employeeDetailCV!.data!.employee!.sENIORITYALL==null?"-":"${controller.employeeDetailCV!.data!.employee!.sENIORITYALL}", textAlign: TextAlign.end)),
                  SizedBox(height: 2.h,),
                  Center(child: Text("Toplam/VBT Dışı İş Deneyimi:", style: TextStyle(fontWeight: FontWeight.bold),)),
                  SizedBox(height: .5.h,),
                  Center(child: Text(controller.employeeDetailCV!.data!.employee!.eXPERIENCETOTAL==null?"-":"${controller.employeeDetailCV!.data!.employee!.eXPERIENCETOTAL}", textAlign: TextAlign.end)),
                  SizedBox(height: 2.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Çalıştığı İl: ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(controller.employeeDetailCV!.data!.employee!.wORKINGCITY==null?"-":"${controller.employeeDetailCV!.data!.employee!.wORKINGCITY}"),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Doğum Yeri: ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(controller.employeeDetailCV!.data!.employee!.iDNBIRTHPLACE==null?"-":"${controller.employeeDetailCV!.data!.employee!.iDNBIRTHPLACE}"),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Divider(color: Colors.black, height: 1.h,),
                  SizedBox(height: 1.h),
                  Row(children: [
                    Container(height: 4.h, width: 4.h, child: Image.asset("assets/iletisim.png"),),
                    SizedBox(width: 2.w,),
                    Text("iletişim Bilgileri:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  ],),
                  SizedBox(height: 2.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Şirket Cep Telefonu: ", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(controller.employeeDetailCV!.data!.employeeAddress!.mOBILEPHONECOMPANY==null?"-":"${controller.employeeDetailCV!.data!.employeeAddress!.mOBILEPHONECOMPANY}"),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sabit Telefon Dahili:", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(controller.employeeDetailCV!.data!.employeeAddress!.pHONECOMPANYSHORTNO==null?"-":"${controller.employeeDetailCV!.data!.employeeAddress!.pHONECOMPANYSHORTNO}"),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("E-Posta:", style: TextStyle(fontWeight: FontWeight.bold),),
                      Container(width: 50.w, child: Center(child: Text(controller.employeeDetailCV!.data!.employeeAddress!.eMAILCOMPANY==null?"-":"${controller.employeeDetailCV!.data!.employeeAddress!.eMAILCOMPANY}", textAlign:controller.employeeDetailCV!.data!.employeeAddress!.eMAILCOMPANY==null?TextAlign.end:TextAlign.center, maxLines: 2, overflow: TextOverflow.visible, style: TextStyle(fontSize: 13),))),
                    ],
                  ),
                  SizedBox(height: 1.h),
                ],
              ),
            ),
          ),
        ):Container(height: 75.h, child: Center(child: CircularProgressIndicator(color: Color(0xff7f0000),),),),
      ),
    );
  }
}
