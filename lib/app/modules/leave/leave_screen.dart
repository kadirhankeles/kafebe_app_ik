import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/leave/leave_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LeaveScreen extends GetView<LeaveController> {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff850000),
          centerTitle: true,
          title: const Text("İzin Talebi"),
          bottom: TabBar(
              indicatorWeight: 1.w,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(
                  text: 'İzinlerim',
                ),
                Tab(
                  text: 'Çalışan İzinleri',
                ),
                Tab(
                  text: 'İzin Takvimi',
                ),
              ]),
        ),
        backgroundColor: Colors.grey.shade300,
        body: TabBarView(
          children: <Widget>[
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(2.h),
                  width: 100.w,
                  height: 16.h,
                  color: Colors.white10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TitleTextWidget(text: "Yıllık İzin Bakiyesi"),
                          ValueTextWidget(
                            value: "value",
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TitleTextWidget(
                              text: "İlgili Yıl İzin Hakediş Tarihi"),
                          ValueTextWidget(
                            value: "value",
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TitleTextWidget(
                              text: "İlgili Yıl İzin Hakediş Gün Sayısı"),
                          ValueTextWidget(
                            value: "value",
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      // padding: EdgeInsets.all(1.5.h),
                      margin: EdgeInsets.all(0.3.h),
                      width: 100.w,
                      height: 14.h,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ValueTextWidget(value: "value"),
                              ValueTextWidget(value: "value"),
                              TextButton.icon(
                                  onPressed: () {
                                    //izin kullandım textbuttonu
                                  },
                                  icon: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  label: Text(
                                    "Kullandım",
                                    style: TextStyle(color: Colors.green),
                                  ))
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                //textbutton izin süresi
                              },
                              child: Text(
                                "value",
                                style: TextStyle(color: Colors.green),
                              ))
                        ],
                      ),
                    );
                  },
                ))
              ],
            ),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
      ),
    );
  }
}

class ValueTextWidget extends StatelessWidget {
  const ValueTextWidget({
    Key? key,
    required this.value,
  }) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16.5),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16.5.sp),
    );
  }
}
