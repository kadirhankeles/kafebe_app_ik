import '../getLanding_PageInfo_model.dart';

class AcademyConfirmModel {
  String? refreshToken;
  String? token;
  Data? data1;

  AcademyConfirmModel({this.refreshToken, this.token, this.data1});

  AcademyConfirmModel.fromJson(Map<String, dynamic> json) {
    refreshToken = json['RefreshToken'];
    token = json['Token'];
    data1 = json['data1'] != null ? new Data.fromJson(json['data1']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = new Map<String, dynamic>();
    data1['RefreshToken'] = this.refreshToken;
    data1['Token'] = this.token;
    if (this.data1 != null) {
      data1['data1'] = this.data1!.toJson();
    }
    return data1;
  }
}

class data1 {
  TalentPositionAndEmp? talentPositionAndEmp;
  List<TalentActivityList>? talentActivityList;

  data1({this.talentPositionAndEmp, this.talentActivityList});

  data1.fromJson(Map<String, dynamic> json) {
    talentPositionAndEmp = json['TalentPositionAndEmp'] != null
        ? new TalentPositionAndEmp.fromJson(json['TalentPositionAndEmp'])
        : null;
    if (json['TalentActivityList'] != null) {
      talentActivityList = <TalentActivityList>[];
      json['TalentActivityList'].forEach((v) {
        talentActivityList!.add(new TalentActivityList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = new Map<String, dynamic>();
    if (this.talentPositionAndEmp != null) {
      data1['TalentPositionAndEmp'] = this.talentPositionAndEmp!.toJson();
    }
    if (this.talentActivityList != null) {
      data1['TalentActivityList'] =
          this.talentActivityList!.map((v) => v.toJson()).toList();
    }
    return data1;
  }
}

class TalentPositionAndEmp {
  int? iDHREMPLOYEE;
  String? nameSurname;
  String? positionName;

  TalentPositionAndEmp(
      {this.iDHREMPLOYEE, this.nameSurname, this.positionName});

  TalentPositionAndEmp.fromJson(Map<String, dynamic> json) {
    iDHREMPLOYEE = json['ID_HR_EMPLOYEE'];
    nameSurname = json['NameSurname'];
    positionName = json['PositionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = new Map<String, dynamic>();
    data1['ID_HR_EMPLOYEE'] = this.iDHREMPLOYEE;
    data1['NameSurname'] = this.nameSurname;
    data1['PositionName'] = this.positionName;
    return data1;
  }
}

class TalentActivityList {
  int? iDACTIVITY;
  String? uID;
  int? iDHREMPLOYEE;
  String? aCTIVITYNAME;
  int? aCTIVITYSUCCESSSTATUS;
  String? aCTIVITYSUCCESSSTATUSTXT;
  String? aCTIVITYSTARTDATE;
  String? aCTIVITYENDDATE;
  int? cOURSETYPE;
  String? cOURSETYPENAME;
  String? cOURSETYPEDESCRIPTION;
  int? aCTIVITYSTATUS;
  int? iDSINGLESTATUS;
  String? cOMPLETIONDATE;
  int? cOMPLETIONPERCENTAGE;
  String? aCTIVITYCODE;
  String? sINGLESTATUSNAME;
  int? aCTIVITYCOMPLETESTATUS;
  String? aCTIVITYCOMPLETESTATUSTXT;
  int? aCTIVITYSCORE;
  String? aSSIGNMENTDATE;

  TalentActivityList(
      {this.iDACTIVITY,
      this.uID,
      this.iDHREMPLOYEE,
      this.aCTIVITYNAME,
      this.aCTIVITYSUCCESSSTATUS,
      this.aCTIVITYSUCCESSSTATUSTXT,
      this.aCTIVITYSTARTDATE,
      this.aCTIVITYENDDATE,
      this.cOURSETYPE,
      this.cOURSETYPENAME,
      this.cOURSETYPEDESCRIPTION,
      this.aCTIVITYSTATUS,
      this.iDSINGLESTATUS,
      this.cOMPLETIONDATE,
      this.cOMPLETIONPERCENTAGE,
      this.aCTIVITYCODE,
      this.sINGLESTATUSNAME,
      this.aCTIVITYCOMPLETESTATUS,
      this.aCTIVITYCOMPLETESTATUSTXT,
      this.aCTIVITYSCORE,
      this.aSSIGNMENTDATE});

  TalentActivityList.fromJson(Map<String, dynamic> json) {
    iDACTIVITY = json['ID_ACTIVITY'];
    uID = json['UID'];
    iDHREMPLOYEE = json['ID_HR_EMPLOYEE'];
    aCTIVITYNAME = json['ACTIVITY_NAME'];
    aCTIVITYSUCCESSSTATUS = json['ACTIVITY_SUCCESS_STATUS'];
    aCTIVITYSUCCESSSTATUSTXT = json['ACTIVITY_SUCCESS_STATUS_TXT'];
    aCTIVITYSTARTDATE = json['ACTIVITY_START_DATE'];
    aCTIVITYENDDATE = json['ACTIVITY_END_DATE'];
    cOURSETYPE = json['COURSE_TYPE'];
    cOURSETYPENAME = json['COURSE_TYPE_NAME'];
    cOURSETYPEDESCRIPTION = json['COURSE_TYPE_DESCRIPTION'];
    aCTIVITYSTATUS = json['ACTIVITY_STATUS'];
    iDSINGLESTATUS = json['ID_SINGLE_STATUS'];
    cOMPLETIONDATE = json['COMPLETION_DATE'];
    cOMPLETIONPERCENTAGE = json['COMPLETION_PERCENTAGE'];
    aCTIVITYCODE = json['ACTIVITY_CODE'];
    sINGLESTATUSNAME = json['SINGLE_STATUS_NAME'];
    aCTIVITYCOMPLETESTATUS = json['ACTIVITY_COMPLETE_STATUS'];
    aCTIVITYCOMPLETESTATUSTXT = json['ACTIVITY_COMPLETE_STATUS_TXT'];
    aCTIVITYSCORE = json['ACTIVITY_SCORE'];
    aSSIGNMENTDATE = json['ASSIGNMENT_DATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = new Map<String, dynamic>();
    data1['ID_ACTIVITY'] = this.iDACTIVITY;
    data1['UID'] = this.uID;
    data1['ID_HR_EMPLOYEE'] = this.iDHREMPLOYEE;
    data1['ACTIVITY_NAME'] = this.aCTIVITYNAME;
    data1['ACTIVITY_SUCCESS_STATUS'] = this.aCTIVITYSUCCESSSTATUS;
    data1['ACTIVITY_SUCCESS_STATUS_TXT'] = this.aCTIVITYSUCCESSSTATUSTXT;
    data1['ACTIVITY_START_DATE'] = this.aCTIVITYSTARTDATE;
    data1['ACTIVITY_END_DATE'] = this.aCTIVITYENDDATE;
    data1['COURSE_TYPE'] = this.cOURSETYPE;
    data1['COURSE_TYPE_NAME'] = this.cOURSETYPENAME;
    data1['COURSE_TYPE_DESCRIPTION'] = this.cOURSETYPEDESCRIPTION;
    data1['ACTIVITY_STATUS'] = this.aCTIVITYSTATUS;
    data1['ID_SINGLE_STATUS'] = this.iDSINGLESTATUS;
    data1['COMPLETION_DATE'] = this.cOMPLETIONDATE;
    data1['COMPLETION_PERCENTAGE'] = this.cOMPLETIONPERCENTAGE;
    data1['ACTIVITY_CODE'] = this.aCTIVITYCODE;
    data1['SINGLE_STATUS_NAME'] = this.sINGLESTATUSNAME;
    data1['ACTIVITY_COMPLETE_STATUS'] = this.aCTIVITYCOMPLETESTATUS;
    data1['ACTIVITY_COMPLETE_STATUS_TXT'] = this.aCTIVITYCOMPLETESTATUSTXT;
    data1['ACTIVITY_SCORE'] = this.aCTIVITYSCORE;
    data1['ASSIGNMENT_DATE'] = this.aSSIGNMENTDATE;
    return data1;
  }
}
