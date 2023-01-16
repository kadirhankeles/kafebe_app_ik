import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/employeeLeave/employeeLeave_binding.dart';
import 'package:kafebe_app_ik/app/modules/employeeLeave/employeeLeave_screen.dart';
import 'package:kafebe_app_ik/app/modules/notification/notification_binding.dart';
import 'package:kafebe_app_ik/app/modules/notification/notification_detail/notification_detail_binding.dart';
import 'package:kafebe_app_ik/app/modules/notification/notification_detail/notification_detail_screen.dart';
import 'package:kafebe_app_ik/app/modules/notification/notification_screen.dart';
import 'package:kafebe_app_ik/app/modules/payroll/payroll_binding.dart';
import 'package:kafebe_app_ik/app/modules/payrollView/payroll_view_binding.dart';
import 'package:kafebe_app_ik/app/modules/payrollView/payroll_view_screen.dart';
import 'package:kafebe_app_ik/app/modules/requests/requests_screen.dart';
import 'package:kafebe_app_ik/app/modules/requests_detail/request_detail_screen.dart';

import '../modules/approval/approval_binding.dart';
import '../modules/approval/approval_screen.dart';
import '../modules/approval_detail/approval_detail_binding.dart';
import '../modules/approval_detail/approval_detail_screen.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_screen.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_screen.dart';
import '../modules/payroll/payroll_screen.dart';
import '../modules/requests/requests_binding.dart';
import '../modules/requests_detail/request_detail_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages();
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
        name: Paths.LOGIN, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: Paths.HOME, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: Paths.PAYROLL,
        page: () => PayrollScreen(),
        binding: PayrollBinding()),
    GetPage(
        name: Paths.PAYROLLVIEW,
        page: () => PayrollViewScreen(),
        binding: PayrollViewBinding()),
    GetPage(
        name: Paths.NOTIFICATION,
        page: () => NotificationScreen(),
        binding: NotificationBinding()),
    GetPage(
        name: Paths.NOTIFICATION_DETAIL,
        page: () => NotificationDetailScreen(),
        binding: NotificationDetailBinding()),
    GetPage(
        name: Paths.REQUESTS,
        page: () => RequestsScreen(),
        binding: RequestsBinding()),
    GetPage(
        name: Paths.REQUESTSDETAIL,
        page: () => RequestDetailScreen(),
        binding: RequestDetailBinding()),
    GetPage(
        name: Paths.APPROVAL,
        page: () => ApprovalScreen(),
        binding: ApprovalBinding()),
    GetPage(
        name: Paths.APPROVALDETAIL,
        page: () => ApprovalDetailScreen(),
        binding: ApprovalDetailBinding()),
    GetPage(
        name: Paths.EMPLOYEELEAVE,
        page: () => EmployeeLeaveScreen(),
        binding: EmployeeLeaveBinding()),
  ];
}
