part of 'app_pages.dart';

abstract class Routes {
  Routes();
  static const LOGIN = Paths.LOGIN;
  static const HOME = Paths.HOME;
  static const PAYROLL = Paths.PAYROLL;
  static const PAYROLLVIEW = Paths.PAYROLLVIEW;
}

abstract class Paths {
  static const LOGIN = "/login";
  static const HOME = "/home";
  static const PAYROLL = "/payroll";
  static const PAYROLLVIEW = "/payrollview";
}
