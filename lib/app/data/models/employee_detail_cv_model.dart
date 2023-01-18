class EmployeeDetailCV {
  String? refreshToken;
  String? token;
  Data? data;

  EmployeeDetailCV({this.refreshToken, this.token, this.data});

  EmployeeDetailCV.fromJson(Map<String, dynamic> json) {
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
  Employee? employee;
  EmployeeAddress? employeeAddress;
  List<Null>? employeeEducation;
  List<Null>? employeePrework;
  List<Null>? employeeLanguage;
  List<AssistantManagerInfo>? assistantManagerInfo;
  List<Null>? generalSelfTest;
  List<Null>? personalityInventory;
  List<Null>? developmentCenter;
  List<Null>? otherMeasurement;

  Data(
      {this.employee,
      this.employeeAddress,
      this.employeeEducation,
      this.employeePrework,
      this.employeeLanguage,
      this.assistantManagerInfo,
      this.generalSelfTest,
      this.personalityInventory,
      this.developmentCenter,
      this.otherMeasurement});

  Data.fromJson(Map<String, dynamic> json) {
    employee = json['Employee'] != null
        ? new Employee.fromJson(json['Employee'])
        : null;
    employeeAddress = json['EmployeeAddress'] != null
        ? new EmployeeAddress.fromJson(json['EmployeeAddress'])
        : null;
    
    if (json['AssistantManagerInfo'] != null) {
      assistantManagerInfo = <AssistantManagerInfo>[];
      json['AssistantManagerInfo'].forEach((v) {
        assistantManagerInfo!.add(new AssistantManagerInfo.fromJson(v));
      });
    }
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employee != null) {
      data['Employee'] = this.employee!.toJson();
    }
    if (this.employeeAddress != null) {
      data['EmployeeAddress'] = this.employeeAddress!.toJson();
    }
    
    if (this.assistantManagerInfo != null) {
      data['AssistantManagerInfo'] =
          this.assistantManagerInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employee {
  String? eMPLOYEENAME;
  String? eMPLOYEESURNAME;
  Null? pHOTOADDRESS;
  String? fIRMSGROUPNAME;
  String? fIRMSSHORTNAME;
  String? oRGANIZATIONNAME;
  String? pOSITIONNAME;
  String? cOMPANYSDATE;
  String? sENIORITYALL;
  String? eXPERIENCETOTAL;
  dynamic? aGE;
  String? wORKINGCITY;
  String? pICKLISTSALARYLEVELNAME;
  dynamic? sALARY;
  String? pICKLISTPAYMENTCURRENYNAME;
  String? bIRTHDATE;
  Null? iDNBIRTHPLACE;

  Employee(
      {this.eMPLOYEENAME,
      this.eMPLOYEESURNAME,
      this.pHOTOADDRESS,
      this.fIRMSGROUPNAME,
      this.fIRMSSHORTNAME,
      this.oRGANIZATIONNAME,
      this.pOSITIONNAME,
      this.cOMPANYSDATE,
      this.sENIORITYALL,
      this.eXPERIENCETOTAL,
      this.aGE,
      this.wORKINGCITY,
      this.pICKLISTSALARYLEVELNAME,
      this.sALARY,
      this.pICKLISTPAYMENTCURRENYNAME,
      this.bIRTHDATE,
      this.iDNBIRTHPLACE});

  Employee.fromJson(Map<String, dynamic> json) {
    eMPLOYEENAME = json['EMPLOYEE_NAME'];
    eMPLOYEESURNAME = json['EMPLOYEE_SURNAME'];
    pHOTOADDRESS = json['PHOTO_ADDRESS'];
    fIRMSGROUPNAME = json['FIRMS_GROUP_NAME'];
    fIRMSSHORTNAME = json['FIRMS_SHORT_NAME'];
    oRGANIZATIONNAME = json['ORGANIZATION_NAME'];
    pOSITIONNAME = json['POSITION_NAME'];
    cOMPANYSDATE = json['COMPANY_SDATE'];
    sENIORITYALL = json['SENIORITY_ALL'];
    eXPERIENCETOTAL = json['EXPERIENCE_TOTAL'];
    aGE = json['AGE'];
    wORKINGCITY = json['WORKING_CITY'];
    pICKLISTSALARYLEVELNAME = json['PICKLIST_SALARY_LEVEL_NAME'];
    sALARY = json['SALARY'];
    pICKLISTPAYMENTCURRENYNAME = json['PICKLIST_PAYMENT_CURRENY_NAME'];
    bIRTHDATE = json['BIRTHDATE'];
    iDNBIRTHPLACE = json['IDN_BIRTHPLACE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EMPLOYEE_NAME'] = this.eMPLOYEENAME;
    data['EMPLOYEE_SURNAME'] = this.eMPLOYEESURNAME;
    data['PHOTO_ADDRESS'] = this.pHOTOADDRESS;
    data['FIRMS_GROUP_NAME'] = this.fIRMSGROUPNAME;
    data['FIRMS_SHORT_NAME'] = this.fIRMSSHORTNAME;
    data['ORGANIZATION_NAME'] = this.oRGANIZATIONNAME;
    data['POSITION_NAME'] = this.pOSITIONNAME;
    data['COMPANY_SDATE'] = this.cOMPANYSDATE;
    data['SENIORITY_ALL'] = this.sENIORITYALL;
    data['EXPERIENCE_TOTAL'] = this.eXPERIENCETOTAL;
    data['AGE'] = this.aGE;
    data['WORKING_CITY'] = this.wORKINGCITY;
    data['PICKLIST_SALARY_LEVEL_NAME'] = this.pICKLISTSALARYLEVELNAME;
    data['SALARY'] = this.sALARY;
    data['PICKLIST_PAYMENT_CURRENY_NAME'] = this.pICKLISTPAYMENTCURRENYNAME;
    data['BIRTHDATE'] = this.bIRTHDATE;
    data['IDN_BIRTHPLACE'] = this.iDNBIRTHPLACE;
    return data;
  }
}

class EmployeeAddress {
  dynamic? eMAILCOMPANY;
  dynamic? pHONECOMPANY;
  String? mOBILEPHONEPRIVATE;
  dynamic? pHONECOMPANYSHORTNO;
  dynamic? mOBILEPHONECOMPANY;

  EmployeeAddress(
      {this.eMAILCOMPANY,
      this.pHONECOMPANY,
      this.mOBILEPHONEPRIVATE,
      this.pHONECOMPANYSHORTNO,
      this.mOBILEPHONECOMPANY});

  EmployeeAddress.fromJson(Map<String, dynamic> json) {
    eMAILCOMPANY = json['EMAIL_COMPANY'];
    pHONECOMPANY = json['PHONE_COMPANY'];
    mOBILEPHONEPRIVATE = json['MOBILE_PHONE_PRIVATE'];
    pHONECOMPANYSHORTNO = json['PHONE_COMPANY_SHORT_NO'];
    mOBILEPHONECOMPANY = json['MOBILE_PHONE_COMPANY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EMAIL_COMPANY'] = this.eMAILCOMPANY;
    data['PHONE_COMPANY'] = this.pHONECOMPANY;
    data['MOBILE_PHONE_PRIVATE'] = this.mOBILEPHONEPRIVATE;
    data['PHONE_COMPANY_SHORT_NO'] = this.pHONECOMPANYSHORTNO;
    data['MOBILE_PHONE_COMPANY'] = this.mOBILEPHONECOMPANY;
    return data;
  }
}

class AssistantManagerInfo {
  Null? mANAGEMENTORGANIZATION;
  Null? mANAGEMENTPOSITION;
  Null? mANAGERNAME;
  String? mANAGEREMPLOYEENUMBER;
  int? mANAGERIDHREMPLOYEE;
  String? mANAGERUID;
  Null? aSSISTANTNAME;
  Null? aSSISTANTEMPLOYEENUMBER;
  int? aSSISTANTIDHREMPLOYEE;
  String? aSSISTANTUID;
  int? mANAGEMENTASISTANTTYPE;
  bool? iSDETAILSHOWMANAGER;
  bool? iSDETAILSHOWASSISTANT;

  AssistantManagerInfo(
      {this.mANAGEMENTORGANIZATION,
      this.mANAGEMENTPOSITION,
      this.mANAGERNAME,
      this.mANAGEREMPLOYEENUMBER,
      this.mANAGERIDHREMPLOYEE,
      this.mANAGERUID,
      this.aSSISTANTNAME,
      this.aSSISTANTEMPLOYEENUMBER,
      this.aSSISTANTIDHREMPLOYEE,
      this.aSSISTANTUID,
      this.mANAGEMENTASISTANTTYPE,
      this.iSDETAILSHOWMANAGER,
      this.iSDETAILSHOWASSISTANT});

  AssistantManagerInfo.fromJson(Map<String, dynamic> json) {
    mANAGEMENTORGANIZATION = json['MANAGEMENT_ORGANIZATION'];
    mANAGEMENTPOSITION = json['MANAGEMENT_POSITION'];
    mANAGERNAME = json['MANAGER_NAME'];
    mANAGEREMPLOYEENUMBER = json['MANAGER_EMPLOYEE_NUMBER'];
    mANAGERIDHREMPLOYEE = json['MANAGER_ID_HR_EMPLOYEE'];
    mANAGERUID = json['MANAGER_UID'];
    aSSISTANTNAME = json['ASSISTANT_NAME'];
    aSSISTANTEMPLOYEENUMBER = json['ASSISTANT_EMPLOYEE_NUMBER'];
    aSSISTANTIDHREMPLOYEE = json['ASSISTANT_ID_HR_EMPLOYEE'];
    aSSISTANTUID = json['ASSISTANT_UID'];
    mANAGEMENTASISTANTTYPE = json['MANAGEMENT_ASISTANT_TYPE'];
    iSDETAILSHOWMANAGER = json['IS_DETAIL_SHOW_MANAGER'];
    iSDETAILSHOWASSISTANT = json['IS_DETAIL_SHOW_ASSISTANT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MANAGEMENT_ORGANIZATION'] = this.mANAGEMENTORGANIZATION;
    data['MANAGEMENT_POSITION'] = this.mANAGEMENTPOSITION;
    data['MANAGER_NAME'] = this.mANAGERNAME;
    data['MANAGER_EMPLOYEE_NUMBER'] = this.mANAGEREMPLOYEENUMBER;
    data['MANAGER_ID_HR_EMPLOYEE'] = this.mANAGERIDHREMPLOYEE;
    data['MANAGER_UID'] = this.mANAGERUID;
    data['ASSISTANT_NAME'] = this.aSSISTANTNAME;
    data['ASSISTANT_EMPLOYEE_NUMBER'] = this.aSSISTANTEMPLOYEENUMBER;
    data['ASSISTANT_ID_HR_EMPLOYEE'] = this.aSSISTANTIDHREMPLOYEE;
    data['ASSISTANT_UID'] = this.aSSISTANTUID;
    data['MANAGEMENT_ASISTANT_TYPE'] = this.mANAGEMENTASISTANTTYPE;
    data['IS_DETAIL_SHOW_MANAGER'] = this.iSDETAILSHOWMANAGER;
    data['IS_DETAIL_SHOW_ASSISTANT'] = this.iSDETAILSHOWASSISTANT;
    return data;
  }
}
