// ignore_for_file: constant_identifier_names
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

  static const GET_PUSH_MESSAGES = "PushNotification/GetPushMessages";
  static const DELETE_PUSH_MESSAGES = "PushNotification/DeletePushMessage?";
  static const READ_PUSH_MESSAGES = "PushNotification/ReadPushMessage?";
  static const BULK_DELETE_MESSAGES = "PushNotification/BulkDeletePushMessage?";

  static const GET_MY_REQUEST_MASTER_MOBILE =
      "RequestManagement/GetMyRequestMasterMobile?";
  static const GET_REQUEST_BY_ID = "RequestManagement/GetRequestById?";

  static const GET_PENDING_REQUEST_MASTER_MOBILE =
      "RequestManagement/GetPendingRequestMasterMobile?";

//header
   static Map<String, String>?  HEADER = GetStorage().read("token") == null
      ? {}
      : {'vbtauthorization': GetStorage().read("token")};
}
