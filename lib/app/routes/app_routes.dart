part of 'app_pages.dart';
abstract class Routes{
  Routes();
  static const LOGIN = Paths.LOGIN; 
  static const HOME = Paths.HOME;
}

abstract class Paths {
  static const LOGIN = "/login";
  static const HOME = "/home";
}