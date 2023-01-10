class GetLandingPageInfoModel {
  String? refreshToken;
  String? token;
  Data? data;

  GetLandingPageInfoModel({this.refreshToken, this.token, this.data});

  GetLandingPageInfoModel.fromJson(Map<String, dynamic> json) {
    refreshToken = json['RefreshToken'];
    token = json['Token'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RefreshToken'] = this.refreshToken;
    data['Token'] = this.token;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? lastUpdateDate;
  int? unReadedNotificationCount;
  bool? isManager;
  int? myRequestCount;
  int? getMyApprovalCount;
  int? getMyWorks;
  MyLastPayroll? myLastPayroll;
  List<MenuInfo>? menuInfo;
  VacationInfo? vacationInfo;
  bool? isLeaveUsed;
  int? idHrEmployee;
  String? guidHrEmployee;
  String? nameSurname;
  String? positionName;
  int? idFirmsEmployee;
  bool? inScope;
  bool? outScope;
  bool? outScopeFirstLevel;
  bool? inPeroid;
  bool? inPeroidManager;
  bool? evaluationCompleted;
  bool? isAuthorizedToView;
  bool? isAuthorizedToBenefits;
  bool? cimporGroup;
  bool? chemsonGroup;
  List<Null>? kvKKModel;
  Null? surveyList;
  bool? candidateTrackingSystemMobileSee;
  bool? sunAkademi;

  Data(
      {this.lastUpdateDate,
      this.unReadedNotificationCount,
      this.isManager,
      this.myRequestCount,
      this.getMyApprovalCount,
      this.getMyWorks,
      this.myLastPayroll,
      this.menuInfo,
      this.vacationInfo,
      this.isLeaveUsed,
      this.idHrEmployee,
      this.guidHrEmployee,
      this.nameSurname,
      this.positionName,
      this.idFirmsEmployee,
      this.inScope,
      this.outScope,
      this.outScopeFirstLevel,
      this.inPeroid,
      this.inPeroidManager,
      this.evaluationCompleted,
      this.isAuthorizedToView,
      this.isAuthorizedToBenefits,
      this.cimporGroup,
      this.chemsonGroup,
      this.kvKKModel,
      this.surveyList,
      this.candidateTrackingSystemMobileSee,
      this.sunAkademi});

  Data.fromJson(Map<String, dynamic> json) {
    lastUpdateDate = json['LastUpdateDate'];
    unReadedNotificationCount = json['UnReadedNotificationCount'];
    isManager = json['IsManager'];
    myRequestCount = json['MyRequestCount'];
    getMyApprovalCount = json['GetMyApprovalCount'];
    getMyWorks = json['GetMyWorks'];
    myLastPayroll = json['MyLastPayroll'] != null
        ? new MyLastPayroll.fromJson(json['MyLastPayroll'])
        : null;
    if (json['MenuInfo'] != null) {
      menuInfo = <MenuInfo>[];
      json['MenuInfo'].forEach((v) {
        menuInfo!.add(new MenuInfo.fromJson(v));
      });
    }
    vacationInfo = json['VacationInfo'] != null
        ? new VacationInfo.fromJson(json['VacationInfo'])
        : null;
    isLeaveUsed = json['IsLeaveUsed'];
    idHrEmployee = json['IdHrEmployee'];
    guidHrEmployee = json['GuidHrEmployee'];
    nameSurname = json['NameSurname'];
    positionName = json['PositionName'];
    idFirmsEmployee = json['idFirmsEmployee'];
    inScope = json['InScope'];
    outScope = json['OutScope'];
    outScopeFirstLevel = json['OutScopeFirstLevel'];
    inPeroid = json['InPeroid'];
    inPeroidManager = json['InPeroidManager'];
    evaluationCompleted = json['EvaluationCompleted'];
    isAuthorizedToView = json['IsAuthorizedToView'];
    isAuthorizedToBenefits = json['IsAuthorizedToBenefits'];
    cimporGroup = json['CimporGroup'];
    chemsonGroup = json['ChemsonGroup'];
    
    surveyList = json['SurveyList'];
    candidateTrackingSystemMobileSee = json['CandidateTrackingSystemMobileSee'];
    sunAkademi = json['SunAkademi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LastUpdateDate'] = this.lastUpdateDate;
    data['UnReadedNotificationCount'] = this.unReadedNotificationCount;
    data['IsManager'] = this.isManager;
    data['MyRequestCount'] = this.myRequestCount;
    data['GetMyApprovalCount'] = this.getMyApprovalCount;
    data['GetMyWorks'] = this.getMyWorks;
    if (this.myLastPayroll != null) {
      data['MyLastPayroll'] = this.myLastPayroll!.toJson();
    }
    if (this.menuInfo != null) {
      data['MenuInfo'] = this.menuInfo!.map((v) => v.toJson()).toList();
    }
    if (this.vacationInfo != null) {
      data['VacationInfo'] = this.vacationInfo!.toJson();
    }
    data['IsLeaveUsed'] = this.isLeaveUsed;
    data['IdHrEmployee'] = this.idHrEmployee;
    data['GuidHrEmployee'] = this.guidHrEmployee;
    data['NameSurname'] = this.nameSurname;
    data['PositionName'] = this.positionName;
    data['idFirmsEmployee'] = this.idFirmsEmployee;
    data['InScope'] = this.inScope;
    data['OutScope'] = this.outScope;
    data['OutScopeFirstLevel'] = this.outScopeFirstLevel;
    data['InPeroid'] = this.inPeroid;
    data['InPeroidManager'] = this.inPeroidManager;
    data['EvaluationCompleted'] = this.evaluationCompleted;
    data['IsAuthorizedToView'] = this.isAuthorizedToView;
    data['IsAuthorizedToBenefits'] = this.isAuthorizedToBenefits;
    data['CimporGroup'] = this.cimporGroup;
    data['ChemsonGroup'] = this.chemsonGroup;
    
    data['SurveyList'] = this.surveyList;
    data['CandidateTrackingSystemMobileSee'] =
        this.candidateTrackingSystemMobileSee;
    data['SunAkademi'] = this.sunAkademi;
    return data;
  }
}

class MyLastPayroll {
  int? documentYear;
  int? documnetMonth;
  String? documentName;
  String? documentUid;

  MyLastPayroll(
      {this.documentYear,
      this.documnetMonth,
      this.documentName,
      this.documentUid});

  MyLastPayroll.fromJson(Map<String, dynamic> json) {
    documentYear = json['DocumentYear'];
    documnetMonth = json['DocumnetMonth'];
    documentName = json['DocumentName'];
    documentUid = json['DocumentUid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocumentYear'] = this.documentYear;
    data['DocumnetMonth'] = this.documnetMonth;
    data['DocumentName'] = this.documentName;
    data['DocumentUid'] = this.documentUid;
    return data;
  }
}

class MenuInfo {
  String? mENUNAME;
  int? oRDERNUMBERMANAGER;
  int? oRDERNUMBEREMPLOYEE;
  String? mENUTYPE;

  MenuInfo(
      {this.mENUNAME,
      this.oRDERNUMBERMANAGER,
      this.oRDERNUMBEREMPLOYEE,
      this.mENUTYPE});

  MenuInfo.fromJson(Map<String, dynamic> json) {
    mENUNAME = json['MENU_NAME'];
    oRDERNUMBERMANAGER = json['ORDER_NUMBER_MANAGER'];
    oRDERNUMBEREMPLOYEE = json['ORDER_NUMBER_EMPLOYEE'];
    mENUTYPE = json['MENU_TYPE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MENU_NAME'] = this.mENUNAME;
    data['ORDER_NUMBER_MANAGER'] = this.oRDERNUMBERMANAGER;
    data['ORDER_NUMBER_EMPLOYEE'] = this.oRDERNUMBEREMPLOYEE;
    data['MENU_TYPE'] = this.mENUTYPE;
    return data;
  }
}

class VacationInfo {
  List<EmployeeEarnedRightsList>? employeeEarnedRightsList;
  int? totalCount;

  VacationInfo({this.employeeEarnedRightsList, this.totalCount});

  VacationInfo.fromJson(Map<String, dynamic> json) {
    if (json['EmployeeEarnedRightsList'] != null) {
      employeeEarnedRightsList = <EmployeeEarnedRightsList>[];
      json['EmployeeEarnedRightsList'].forEach((v) {
        employeeEarnedRightsList!.add(new EmployeeEarnedRightsList.fromJson(v));
      });
    }
    totalCount = json['TotalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employeeEarnedRightsList != null) {
      data['EmployeeEarnedRightsList'] =
          this.employeeEarnedRightsList!.map((v) => v.toJson()).toList();
    }
    data['TotalCount'] = this.totalCount;
    return data;
  }
}

class EmployeeEarnedRightsList {
  int? iDHREMPLOYEE;
  String? eMPLOYEENAME;
  String? eMPLOYEESURNAME;
  double? aNNUALLEAVEBALANCE;
  String? nEXTLEAVEALLOWANCEDATE;
  dynamic? nEXTLEAVEALLOWANCEDAYS;
  bool? iSHEAD;
  Null? pOSITIONNAME;
  Null? pHOTOADDRESS;

  EmployeeEarnedRightsList(
      {this.iDHREMPLOYEE,
      this.eMPLOYEENAME,
      this.eMPLOYEESURNAME,
      this.aNNUALLEAVEBALANCE,
      this.nEXTLEAVEALLOWANCEDATE,
      this.nEXTLEAVEALLOWANCEDAYS,
      this.iSHEAD,
      this.pOSITIONNAME,
      this.pHOTOADDRESS});

  EmployeeEarnedRightsList.fromJson(Map<String, dynamic> json) {
    iDHREMPLOYEE = json['ID_HR_EMPLOYEE'];
    eMPLOYEENAME = json['EMPLOYEE_NAME'];
    eMPLOYEESURNAME = json['EMPLOYEE_SURNAME'];
    aNNUALLEAVEBALANCE = json['ANNUAL_LEAVE_BALANCE'];
    nEXTLEAVEALLOWANCEDATE = json['NEXT_LEAVE_ALLOWANCE_DATE'];
    nEXTLEAVEALLOWANCEDAYS = json['NEXT_LEAVE_ALLOWANCE_DAYS'];
    iSHEAD = json['IS_HEAD'];
    pOSITIONNAME = json['POSITION_NAME'];
    pHOTOADDRESS = json['PHOTO_ADDRESS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_HR_EMPLOYEE'] = this.iDHREMPLOYEE;
    data['EMPLOYEE_NAME'] = this.eMPLOYEENAME;
    data['EMPLOYEE_SURNAME'] = this.eMPLOYEESURNAME;
    data['ANNUAL_LEAVE_BALANCE'] = this.aNNUALLEAVEBALANCE;
    data['NEXT_LEAVE_ALLOWANCE_DATE'] = this.nEXTLEAVEALLOWANCEDATE;
    data['NEXT_LEAVE_ALLOWANCE_DAYS'] = this.nEXTLEAVEALLOWANCEDAYS;
    data['IS_HEAD'] = this.iSHEAD;
    data['POSITION_NAME'] = this.pOSITIONNAME;
    data['PHOTO_ADDRESS'] = this.pHOTOADDRESS;
    return data;
  }
}
