part of 'app_pages.dart';

abstract class Routes {
  Routes();
  static const SPLASH = Paths.SPLASH;
  static const LOGIN = Paths.LOGIN;
  static const HOME = Paths.HOME;

  static const LANGUAGE = Paths.LANGUAGE;

  static const ACADEMY = Paths.ACADEMY;

  static const PAYROLL = Paths.PAYROLL;
  static const PAYROLLVIEW = Paths.PAYROLLVIEW;

  static const NOTIFICATION = Paths.NOTIFICATION;
  static const NOTIFICATION_DETAIL = Paths.NOTIFICATION_DETAIL;

  static const REQUESTS = Paths.REQUESTS;
  static const REQUESTSDETAIL = Paths.REQUESTSDETAIL;

  static const LEAVE_ADD = Paths.LEAVE_ADD;
  static const LEAVE = Paths.LEAVE;
  static const LEAVE_DETAIL = Paths.LEAVE_DETAIL;
  static const SUB_EMPLOYEE = Paths.SUB_EMPLOYEE;

  static const APPROVAL = Paths.APPROVAL;
  static const APPROVALDETAIL = Paths.APPROVALDETAIL;

  static const EMPLOYEELEAVE = Paths.EMPLOYEELEAVE;




  static const TEAM = Paths.TEAM;
  static const TEAMDETAIL = Paths.TEAMDETAIL;

  static const WORK = Paths.WORK;


}

abstract class Paths {
  static const SPLASH = '/splash';
  static const LOGIN = "/login";
  static const HOME = "/home";

  static const LANGUAGE = '/language';




  static const ACADEMY = '/academy';





  static const PAYROLL = "/payroll";
  static const PAYROLLVIEW = "/payrollview";

  static const NOTIFICATION = "/notification";
  static const NOTIFICATION_DETAIL = "/notification_detail";

  static const REQUESTS = "/requests";
  static const REQUESTSDETAIL = "/requestsdetail";

  static const LEAVE_ADD = "/leaveadd";
  static const LEAVE = "/leave";
  static const LEAVE_DETAIL = "/leavedetail";
  static const SUB_EMPLOYEE = "/sub_employee";

  static const APPROVAL = "/approval";
  static const APPROVALDETAIL = "/approvaldetail";

  static const EMPLOYEELEAVE = "/employeeleave";



  

  static const TEAM = "/team";
  static const TEAMDETAIL = "/teamdetail";
  
  static const WORK = "/work";



}
