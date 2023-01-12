// ignore_for_file: constant_identifier_names
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/utils/api_token.dart';

class ServiceConstants {
//baseurl
  static const BASE_URL = "https://suniktest.suntekstil.com.tr/mobileapi/api/";

//endpoints
  static const PAYROLL_ALL_DATA_SERVICE = "EmployeeDocuments/GetPayrollPeriods";
  static const PAYROLL_MONTH_SERVICE =
      "EmployeeDocuments/EmployeePayrollDownload";
  static const ACCOUNT_TOKEN = "Account/Token";
  static const GET_PROFILE_PICTURE = "EmployeeReport/GetProfilPicture";
  static const GET_LANDING_PAGE_INFO = "EmployeeReport/GetLandingPageInfo?";

//header
  static const HEADER = {'vbtauthorization': apiToken};

//status code göre response code controlü
  responseControll(statusCode) {
    try {
      if (statusCode == 200) {
        print("DONE!");
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
  }
}
