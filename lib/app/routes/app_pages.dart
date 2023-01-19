import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:kafebe_app_ik/app/data/models/Leave/sub_employee_leave_model.dart';
import 'package:kafebe_app_ik/app/modules/leave/leave_binding.dart';
import 'package:kafebe_app_ik/app/modules/leave/leave_detail/leave_detail_binding.dart';
import 'package:kafebe_app_ik/app/modules/leave/leave_detail/leave_detail_screen.dart';
import 'package:kafebe_app_ik/app/modules/leave/leave_screen.dart';
import 'package:kafebe_app_ik/app/modules/leave/subEmployee/sub_employee_screen.dart';

import 'package:kafebe_app_ik/app/modules/academy/academy_binding.dart';
import 'package:kafebe_app_ik/app/modules/academy/academy_screen.dart';

import 'package:kafebe_app_ik/app/modules/leaveAdd/leave_add_binding.dart';

import 'package:kafebe_app_ik/app/modules/employeeLeave/employeeLeave_binding.dart';
import 'package:kafebe_app_ik/app/modules/employeeLeave/employeeLeave_screen.dart';
import 'package:kafebe_app_ik/app/modules/language/language_binding.dart';
import 'package:kafebe_app_ik/app/modules/language/language_screen.dart';

import 'package:kafebe_app_ik/app/modules/notification/notification_binding.dart';
import 'package:kafebe_app_ik/app/modules/notification/notification_detail/notification_detail_binding.dart';
import 'package:kafebe_app_ik/app/modules/notification/notification_detail/notification_detail_screen.dart';
import 'package:kafebe_app_ik/app/modules/notification/notification_screen.dart';
import 'package:kafebe_app_ik/app/modules/payroll/payroll_binding.dart';
import 'package:kafebe_app_ik/app/modules/payrollView/payroll_view_binding.dart';
import 'package:kafebe_app_ik/app/modules/payrollView/payroll_view_screen.dart';
import 'package:kafebe_app_ik/app/modules/requests/requests_screen.dart';
import 'package:kafebe_app_ik/app/modules/requests_detail/request_detail_screen.dart';
import 'package:kafebe_app_ik/app/modules/splash/splash_binding.dart';
import 'package:kafebe_app_ik/app/modules/splash/splash_screen.dart';

import '../modules/approval/approval_binding.dart';
import '../modules/approval/approval_screen.dart';
import '../modules/approval_detail/approval_detail_binding.dart';
import '../modules/approval_detail/approval_detail_screen.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_screen.dart';
import '../modules/leaveAdd/leave_add_screen.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_screen.dart';
import '../modules/payroll/payroll_screen.dart';
import '../modules/requests/requests_binding.dart';
import '../modules/requests_detail/request_detail_binding.dart';
import '../modules/team/team_binding.dart';
import '../modules/team/team_detail/team_detail_binding.dart';
import '../modules/team/team_detail/team_detail_screen.dart';
import '../modules/team/team_screen.dart';
import '../modules/work/work_binding.dart';
import '../modules/work/work_screen.dart';

//export sayfası yapılacak!

part 'app_routes.dart';

class AppPages {
  // AppPages();
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Paths.LANGUAGE,
      page: () => LanguageScreen(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: Paths.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.ACADEMY,
      page: () => AcademyScreen(),
      binding: AcademyBinding(),
    ),
    GetPage(
      name: Paths.PAYROLL,
      page: () => PayrollScreen(),
      binding: PayrollBinding(),
    ),
    GetPage(
      name: Paths.PAYROLLVIEW,
      page: () => PayrollViewScreen(),
      binding: PayrollViewBinding(),
    ),
    GetPage(
      name: Paths.NOTIFICATION,
      page: () => NotificationScreen(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Paths.NOTIFICATION_DETAIL,
      page: () => NotificationDetailScreen(),
      binding: NotificationDetailBinding(),
    ),
    GetPage(
        name: Paths.REQUESTSDETAIL,
        page: () => RequestDetailScreen(),
        binding: RequestDetailBinding()),
    GetPage(
        name: Paths.LEAVE_ADD,
        page: () => LeaveAddScreen(),
        binding: LeaveAddBinding()),
    GetPage(
      name: Paths.REQUESTS,
      page: () => RequestsScreen(),
      binding: RequestsBinding(),
    ),
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
    GetPage(
      name: Paths.REQUESTSDETAIL,
      page: () => RequestDetailScreen(),
      binding: RequestDetailBinding(),
    ),
    GetPage(
      name: Paths.LEAVE,
      page: () => LeaveScreen(),
      binding: LeaveBinding(),
    ),
    GetPage(
        name: Paths.LEAVE_DETAIL,
        page: () => LeaveDetailScreen(),
        binding: LeaveDetailBinding()),
    GetPage(name: Paths.SUB_EMPLOYEE, page: () => SubEmployeeScreen()),
    GetPage(
      name: Paths.TEAM,
      page: () => TeamScreen(),
      binding: TeamBinding(),
    ),
    GetPage(
      name: Paths.TEAMDETAIL,
      page: () => TeamDetailScreen(),
      binding: TeamDetailBinding(),
    ),
    GetPage(
      name: Paths.WORK,
      page: () => WorkScreen(),
      binding: WorkBinding(),
    ),
  ];
}
