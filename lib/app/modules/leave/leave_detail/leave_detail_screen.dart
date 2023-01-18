import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/leave/leave_detail/leave_detail_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LeaveDetailScreen extends GetView<LeaveDetailController> {
  const LeaveDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff850000),
        centerTitle: true,
        title: const Text("İzin Talebi"),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() => controller.isLoading.value == true
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomViewWidget(
                      title: "Yıllık İzin", body: controller.listName),
                  CustomViewWidget(
                      title: "İzin Başlangıç Tarihi", body: controller.sDate),
                  CustomViewWidget(
                      title: "İzin Bitiş Tarihi", body: controller.eDate),
                  CustomViewWidget(
                      title: "İşe Başlama Tarihi", body: controller.wDate),
                  CustomViewWidget(
                      title: "İzin Gün Sayısı", body: controller.day),
                  CustomViewWidget(
                      title: "İzni Geçireceği Adres/Telefon",
                      body: controller.address == "" ||
                              controller.address.runtimeType == Null
                          ? controller.address
                          : "-"),
                  CustomViewWidget(
                      title: "Açıklama",
                      body: controller.comment == "" ||
                              controller.comment.runtimeType == Null
                          ? controller.comment
                          : "-"),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              )),
      ),
    );
  }
}

class CustomViewWidget extends StatelessWidget {
  const CustomViewWidget({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          padding: EdgeInsets.only(top: 2.h, left: 1.w),
          width: 100.w,
          height: 5.h,
          color: Colors.white70,
          child: Text(body,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black)),
        )
      ],
    );
  }
}
