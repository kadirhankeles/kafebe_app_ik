import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/notification/notification_detail/notification_detail_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationDetailScreen extends GetView<NotificationDetailController> {
  const NotificationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff850000),
        title: Text(
          "Bildirimler",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: SizedBox(
        child: Container(
          padding: EdgeInsets.all(1.h),
          margin: EdgeInsets.all(2.w),
          width: 99.w,
          height: 14.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(3.w)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.title.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18.sp),
              ),
              Divider(
                height: 2.w,
                color: Colors.black,
              ),
              Text(
                controller.body.toString(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 18.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
