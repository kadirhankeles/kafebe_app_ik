import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kafebe_app_ik/app/utils/app_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AcademyScreen extends StatelessWidget {
  const AcademyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color(0xffF4F5FA),
      appBar: AppBar(
        backgroundColor: AppConstant.loginBackground,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 2.h),
        child: Column(
          children: [
            TextFormField(
              cursorColor: AppConstant.loginCursor,
              keyboardType: TextInputType.visiblePassword,
              cursorHeight: 3.h,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "Arama Yap",
                hintStyle: TextStyle(fontSize: 2.2.h),
                enabledBorder: OutlineInputBorder(
                  borderRadius: AppConstant.globalRadius,
                  borderSide: AppConstant.textFieldBorderColor,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: AppConstant.globalRadius,
                    borderSide: AppConstant.textFieldBorderColor),
                prefixIcon: AppConstant.searchIcon,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text("Tümü",style: Theme.of(context).textTheme.headline6,),
            SizedBox(
              height: 4.h,
            ),
            Container(
              height: 69.h,
              width: 100.w,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 2.h),
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(179, 243, 210, 210),
                    borderRadius: BorderRadius.circular(2.w),
                    border: Border.all(color: Colors.grey, width: 0.5.w)
                  ),
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
