class GetRequestByIdModel {
  String? refreshToken;
  String? token;
  Data? data;

  GetRequestByIdModel({this.refreshToken, this.token, this.data});

  GetRequestByIdModel.fromJson(Map<String, dynamic> json) {
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
  int? iDMASTER;
  int? iDMASTERASSIGN;
  String? rEQDATE;
  String? rEQNAME;
  String? rEQEMPLOYEE;
  int? rEQIDHREMPLOYEE;
  String? aSSIGNEMPLOYEE;
  int? rEQTYPE;
  String? eMPLOYEENAMESURNAME;
  String? rEQUESTDETAIL;
  List<REQUESTDETAILKEYVALUE>? rEQUESTDETAILKEYVALUE;
  Null? rEQUESTDETAILKEYVALUESALARY;
  String? uID;
  int? sTATU;
  Null? sTATUNAME;
  List<HISTORY>? hISTORY;
  List<Null>? dOCUMENTS;
  String? dESCRIPTION;
  int? iDHREMPLOYEEASSIGN;
  bool? iSWORK;
  bool? iSCOMPENSATION;
  SALARYPERMISSIONMODEL? sALARYPERMISSIONMODEL;
  bool? gETOPINION;
  Null? gETOPINIONLIST;
  bool? eNABLEDOCUMENT;
  int? iDPROCESSTYPE;
  bool? pROPOSINGCANDIDATES;
  bool? sEECANDIDATES;
  bool? rEQUESTSEECANDIDATES;
  bool? mANAGERPOSITION;
  int? bULKSENDINGORGCOUNT;
  int? bULKSENDINGEMPCOUNT;
  int? bULKSENDINGIDGNSENDINGTYPE;
  int? bULKSENDINGIDGNSENDINGFILTEROPTION;
  int? bULKSENDINGIDGNSENDING;
  bool? bULKSENDINGSENDAUTH;

  Data(
      {this.iDMASTER,
      this.iDMASTERASSIGN,
      this.rEQDATE,
      this.rEQNAME,
      this.rEQEMPLOYEE,
      this.rEQIDHREMPLOYEE,
      this.aSSIGNEMPLOYEE,
      this.rEQTYPE,
      this.eMPLOYEENAMESURNAME,
      this.rEQUESTDETAIL,
      this.rEQUESTDETAILKEYVALUE,
      this.rEQUESTDETAILKEYVALUESALARY,
      this.uID,
      this.sTATU,
      this.sTATUNAME,
      this.hISTORY,
      this.dOCUMENTS,
      this.dESCRIPTION,
      this.iDHREMPLOYEEASSIGN,
      this.iSWORK,
      this.iSCOMPENSATION,
      this.sALARYPERMISSIONMODEL,
      this.gETOPINION,
      this.gETOPINIONLIST,
      this.eNABLEDOCUMENT,
      this.iDPROCESSTYPE,
      this.pROPOSINGCANDIDATES,
      this.sEECANDIDATES,
      this.rEQUESTSEECANDIDATES,
      this.mANAGERPOSITION,
      this.bULKSENDINGORGCOUNT,
      this.bULKSENDINGEMPCOUNT,
      this.bULKSENDINGIDGNSENDINGTYPE,
      this.bULKSENDINGIDGNSENDINGFILTEROPTION,
      this.bULKSENDINGIDGNSENDING,
      this.bULKSENDINGSENDAUTH});

  Data.fromJson(Map<String, dynamic> json) {
    iDMASTER = json['ID_MASTER'];
    iDMASTERASSIGN = json['ID_MASTER_ASSIGN'];
    rEQDATE = json['REQ_DATE'];
    rEQNAME = json['REQ_NAME'];
    rEQEMPLOYEE = json['REQ_EMPLOYEE'];
    rEQIDHREMPLOYEE = json['REQ_ID_HR_EMPLOYEE'];
    aSSIGNEMPLOYEE = json['ASSIGN_EMPLOYEE'];
    rEQTYPE = json['REQ_TYPE'];
    eMPLOYEENAMESURNAME = json['EMPLOYEE_NAME_SURNAME'];
    rEQUESTDETAIL = json['REQUEST_DETAIL'];
    if (json['REQUEST_DETAIL_KEY_VALUE'] != null) {
      rEQUESTDETAILKEYVALUE = <REQUESTDETAILKEYVALUE>[];
      json['REQUEST_DETAIL_KEY_VALUE'].forEach((v) {
        rEQUESTDETAILKEYVALUE!.add(new REQUESTDETAILKEYVALUE.fromJson(v));
      });
    }
    rEQUESTDETAILKEYVALUESALARY = json['REQUEST_DETAIL_KEY_VALUE_SALARY'];
    uID = json['UID'];
    sTATU = json['STATU'];
    sTATUNAME = json['STATU_NAME'];
    if (json['HISTORY'] != null) {
      hISTORY = <HISTORY>[];
      json['HISTORY'].forEach((v) {
        hISTORY!.add(new HISTORY.fromJson(v));
      });
    }
    
    dESCRIPTION = json['DESCRIPTION'];
    iDHREMPLOYEEASSIGN = json['ID_HR_EMPLOYEE_ASSIGN'];
    iSWORK = json['ISWORK'];
    iSCOMPENSATION = json['ISCOMPENSATION'];
    sALARYPERMISSIONMODEL = json['SALARYPERMISSIONMODEL'] != null
        ? new SALARYPERMISSIONMODEL.fromJson(json['SALARYPERMISSIONMODEL'])
        : null;
    gETOPINION = json['GETOPINION'];
    gETOPINIONLIST = json['GETOPINION_LIST'];
   
    eNABLEDOCUMENT = json['ENABLE_DOCUMENT'];
    iDPROCESSTYPE = json['ID_PROCESS_TYPE'];
    pROPOSINGCANDIDATES = json['PROPOSING_CANDIDATES'];
    sEECANDIDATES = json['SEE_CANDIDATES'];
    rEQUESTSEECANDIDATES = json['REQUEST_SEE_CANDIDATES'];
    mANAGERPOSITION = json['MANAGER_POSITION'];
    bULKSENDINGORGCOUNT = json['BULK_SENDING_ORG_COUNT'];
    bULKSENDINGEMPCOUNT = json['BULK_SENDING_EMP_COUNT'];
    bULKSENDINGIDGNSENDINGTYPE = json['BULK_SENDING_ID_GN_SENDING_TYPE'];
    bULKSENDINGIDGNSENDINGFILTEROPTION =
        json['BULK_SENDING_ID_GN_SENDING_FILTER_OPTION'];
    bULKSENDINGIDGNSENDING = json['BULK_SENDING_ID_GN_SENDING'];
    bULKSENDINGSENDAUTH = json['BULK_SENDING_SEND_AUTH'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_MASTER'] = this.iDMASTER;
    data['ID_MASTER_ASSIGN'] = this.iDMASTERASSIGN;
    data['REQ_DATE'] = this.rEQDATE;
    data['REQ_NAME'] = this.rEQNAME;
    data['REQ_EMPLOYEE'] = this.rEQEMPLOYEE;
    data['REQ_ID_HR_EMPLOYEE'] = this.rEQIDHREMPLOYEE;
    data['ASSIGN_EMPLOYEE'] = this.aSSIGNEMPLOYEE;
    data['REQ_TYPE'] = this.rEQTYPE;
    data['EMPLOYEE_NAME_SURNAME'] = this.eMPLOYEENAMESURNAME;
    data['REQUEST_DETAIL'] = this.rEQUESTDETAIL;
    if (this.rEQUESTDETAILKEYVALUE != null) {
      data['REQUEST_DETAIL_KEY_VALUE'] =
          this.rEQUESTDETAILKEYVALUE!.map((v) => v.toJson()).toList();
    }
    data['REQUEST_DETAIL_KEY_VALUE_SALARY'] = this.rEQUESTDETAILKEYVALUESALARY;
    data['UID'] = this.uID;
    data['STATU'] = this.sTATU;
    data['STATU_NAME'] = this.sTATUNAME;
    if (this.hISTORY != null) {
      data['HISTORY'] = this.hISTORY!.map((v) => v.toJson()).toList();
    }
    
    data['DESCRIPTION'] = this.dESCRIPTION;
    data['ID_HR_EMPLOYEE_ASSIGN'] = this.iDHREMPLOYEEASSIGN;
    data['ISWORK'] = this.iSWORK;
    data['ISCOMPENSATION'] = this.iSCOMPENSATION;
    if (this.sALARYPERMISSIONMODEL != null) {
      data['SALARYPERMISSIONMODEL'] = this.sALARYPERMISSIONMODEL!.toJson();
    }
    data['GETOPINION'] = this.gETOPINION;
    data['GETOPINION_LIST'] = this.gETOPINIONLIST;
    
    data['ENABLE_DOCUMENT'] = this.eNABLEDOCUMENT;
    data['ID_PROCESS_TYPE'] = this.iDPROCESSTYPE;
    data['PROPOSING_CANDIDATES'] = this.pROPOSINGCANDIDATES;
    data['SEE_CANDIDATES'] = this.sEECANDIDATES;
    data['REQUEST_SEE_CANDIDATES'] = this.rEQUESTSEECANDIDATES;
    data['MANAGER_POSITION'] = this.mANAGERPOSITION;
    data['BULK_SENDING_ORG_COUNT'] = this.bULKSENDINGORGCOUNT;
    data['BULK_SENDING_EMP_COUNT'] = this.bULKSENDINGEMPCOUNT;
    data['BULK_SENDING_ID_GN_SENDING_TYPE'] = this.bULKSENDINGIDGNSENDINGTYPE;
    data['BULK_SENDING_ID_GN_SENDING_FILTER_OPTION'] =
        this.bULKSENDINGIDGNSENDINGFILTEROPTION;
    data['BULK_SENDING_ID_GN_SENDING'] = this.bULKSENDINGIDGNSENDING;
    data['BULK_SENDING_SEND_AUTH'] = this.bULKSENDINGSENDAUTH;
    return data;
  }
}

class REQUESTDETAILKEYVALUE {
  String? key;
  String? name;
  String? value;
  String? designName;
  bool? isSuccess;

  REQUESTDETAILKEYVALUE(
      {this.key, this.name, this.value, this.designName, this.isSuccess});

  REQUESTDETAILKEYVALUE.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    name = json['Name'];
    value = json['Value'];
    designName = json['DesignName'];
    isSuccess = json['IsSuccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Key'] = this.key;
    data['Name'] = this.name;
    data['Value'] = this.value;
    data['DesignName'] = this.designName;
    data['IsSuccess'] = this.isSuccess;
    return data;
  }
}

class HISTORY {
  int? iDMASTERHISTORY;
  String? eMPLOYEENAMESURNAME;
  String? dESCRIPTION;
  String? cONFIRMDESCRIPTION;
  String? cONFIRMDATE;
  String? uIDMASTER;
  int? iDHREMPLOYEECONFIRM;
  String? pOSITIONNAME;

  HISTORY(
      {this.iDMASTERHISTORY,
      this.eMPLOYEENAMESURNAME,
      this.dESCRIPTION,
      this.cONFIRMDESCRIPTION,
      this.cONFIRMDATE,
      this.uIDMASTER,
      this.iDHREMPLOYEECONFIRM,
      this.pOSITIONNAME});

  HISTORY.fromJson(Map<String, dynamic> json) {
    iDMASTERHISTORY = json['ID_MASTER_HISTORY'];
    eMPLOYEENAMESURNAME = json['EMPLOYEE_NAME_SURNAME'];
    dESCRIPTION = json['DESCRIPTION'];
    cONFIRMDESCRIPTION = json['CONFIRM_DESCRIPTION'];
    cONFIRMDATE = json['CONFIRM_DATE'];
    uIDMASTER = json['UID_MASTER'];
    iDHREMPLOYEECONFIRM = json['ID_HR_EMPLOYEE_CONFIRM'];
    pOSITIONNAME = json['POSITION_NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_MASTER_HISTORY'] = this.iDMASTERHISTORY;
    data['EMPLOYEE_NAME_SURNAME'] = this.eMPLOYEENAMESURNAME;
    data['DESCRIPTION'] = this.dESCRIPTION;
    data['CONFIRM_DESCRIPTION'] = this.cONFIRMDESCRIPTION;
    data['CONFIRM_DATE'] = this.cONFIRMDATE;
    data['UID_MASTER'] = this.uIDMASTER;
    data['ID_HR_EMPLOYEE_CONFIRM'] = this.iDHREMPLOYEECONFIRM;
    data['POSITION_NAME'] = this.pOSITIONNAME;
    return data;
  }
}

class SALARYPERMISSIONMODEL {
  bool? salaryRevise;
  bool? salaryFormView;
  bool? isReturnRequest;

  SALARYPERMISSIONMODEL(
      {this.salaryRevise, this.salaryFormView, this.isReturnRequest});

  SALARYPERMISSIONMODEL.fromJson(Map<String, dynamic> json) {
    salaryRevise = json['SalaryRevise'];
    salaryFormView = json['SalaryFormView'];
    isReturnRequest = json['IsReturnRequest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SalaryRevise'] = this.salaryRevise;
    data['SalaryFormView'] = this.salaryFormView;
    data['IsReturnRequest'] = this.isReturnRequest;
    return data;
  }
}
