part of 'app_pages.dart';

abstract class Routes {
  Routes();
  static const SPLASH = Paths.SPLASH;
  static const LOGIN = Paths.LOGIN;
  static const HOME = Paths.HOME;

  static const LANGUAGE = Paths.LANGUAGE;

  static const PAYROLL = Paths.PAYROLL;
  static const PAYROLLVIEW = Paths.PAYROLLVIEW;

  static const NOTIFICATION = Paths.NOTIFICATION;
  static const NOTIFICATION_DETAIL = Paths.NOTIFICATION_DETAIL;

  static const REQUESTS = Paths.REQUESTS;
  static const REQUESTSDETAIL = Paths.REQUESTSDETAIL;

  static const APPROVAL = Paths.APPROVAL;

  static const TEAM = Paths.TEAM;
  static const TEAMDETAIL = Paths.TEAMDETAIL;

}

abstract class Paths {
  static const SPLASH = '/splash';
  static const LOGIN = "/login";
  static const HOME = "/home";

  static const LANGUAGE = '/language';



  static const PAYROLL = "/payroll";
  static const PAYROLLVIEW = "/payrollview";

  static const NOTIFICATION = "/notification";
  static const NOTIFICATION_DETAIL = "/notification_detail";

  static const REQUESTS = "/requests";
  static const REQUESTSDETAIL = "/requestsdetail";

  static const APPROVAL = "/approval";
  

  static const TEAM = "/team";
  static const TEAMDETAIL = "/teamdetail";
  

}

