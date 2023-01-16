part of 'app_pages.dart';

abstract class Routes {
  Routes();
  static const LOGIN = Paths.LOGIN;
  static const HOME = Paths.HOME;
  static const PAYROLL = Paths.PAYROLL;
  static const PAYROLLVIEW = Paths.PAYROLLVIEW;

  static const NOTIFICATION = Paths.NOTIFICATION;
  static const NOTIFICATION_DETAIL = Paths.NOTIFICATION_DETAIL;

  static const REQUESTS = Paths.REQUESTS;
  static const REQUESTSDETAIL = Paths.REQUESTSDETAIL;

  static const APPROVAL = Paths.APPROVAL;
  static const APPROVALDETAIL = Paths.APPROVALDETAIL;

  static const EMPLOYEELEAVE = Paths.EMPLOYEELEAVE;

}

abstract class Paths {
  static const LOGIN = "/login";
  static const HOME = "/home";
  static const PAYROLL = "/payroll";
  static const PAYROLLVIEW = "/payrollview";

  static const NOTIFICATION = "/notification";
  static const NOTIFICATION_DETAIL = "/notification_detail";

  static const REQUESTS = "/requests";
  static const REQUESTSDETAIL = "/requestsdetail";

  static const APPROVAL = "/approval";
  static const APPROVALDETAIL = "/approvaldetail";

  static const EMPLOYEELEAVE = "/employeeleave";

  

}
