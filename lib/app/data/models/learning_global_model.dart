class LearningGlobalModel {
  String? refreshToken;
  String? token;
  Data? data;

  LearningGlobalModel({this.refreshToken, this.token, this.data});

  LearningGlobalModel.fromJson(Map<String, dynamic> json) {
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
  TalentPositionAndEmp? talentPositionAndEmp;
  List<TalentActivityList>? talentActivityList;

  Data({this.talentPositionAndEmp, this.talentActivityList});

  Data.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.talentPositionAndEmp != null) {
      data['TalentPositionAndEmp'] = this.talentPositionAndEmp!.toJson();
    }
    if (this.talentActivityList != null) {
      data['TalentActivityList'] =
          this.talentActivityList!.map((v) => v.toJson()).toList();
    }
    return data;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_HR_EMPLOYEE'] = this.iDHREMPLOYEE;
    data['NameSurname'] = this.nameSurname;
    data['PositionName'] = this.positionName;
    return data;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_ACTIVITY'] = this.iDACTIVITY;
    data['UID'] = this.uID;
    data['ID_HR_EMPLOYEE'] = this.iDHREMPLOYEE;
    data['ACTIVITY_NAME'] = this.aCTIVITYNAME;
    data['ACTIVITY_SUCCESS_STATUS'] = this.aCTIVITYSUCCESSSTATUS;
    data['ACTIVITY_SUCCESS_STATUS_TXT'] = this.aCTIVITYSUCCESSSTATUSTXT;
    data['ACTIVITY_START_DATE'] = this.aCTIVITYSTARTDATE;
    data['ACTIVITY_END_DATE'] = this.aCTIVITYENDDATE;
    data['COURSE_TYPE'] = this.cOURSETYPE;
    data['COURSE_TYPE_NAME'] = this.cOURSETYPENAME;
    data['COURSE_TYPE_DESCRIPTION'] = this.cOURSETYPEDESCRIPTION;
    data['ACTIVITY_STATUS'] = this.aCTIVITYSTATUS;
    data['ID_SINGLE_STATUS'] = this.iDSINGLESTATUS;
    data['COMPLETION_DATE'] = this.cOMPLETIONDATE;
    data['COMPLETION_PERCENTAGE'] = this.cOMPLETIONPERCENTAGE;
    data['ACTIVITY_CODE'] = this.aCTIVITYCODE;
    data['SINGLE_STATUS_NAME'] = this.sINGLESTATUSNAME;
    data['ACTIVITY_COMPLETE_STATUS'] = this.aCTIVITYCOMPLETESTATUS;
    data['ACTIVITY_COMPLETE_STATUS_TXT'] = this.aCTIVITYCOMPLETESTATUSTXT;
    data['ACTIVITY_SCORE'] = this.aCTIVITYSCORE;
    data['ASSIGNMENT_DATE'] = this.aSSIGNMENTDATE;
    return data;
  }
}
