class MyTeamModel {
  String? refreshToken;
  String? token;
  List<Data>? data;

  MyTeamModel({this.refreshToken, this.token, this.data});

  MyTeamModel.fromJson(Map<String, dynamic> json) {
    refreshToken = json['RefreshToken'];
    token = json['Token'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RefreshToken'] = this.refreshToken;
    data['Token'] = this.token;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? iDHREMPLOYEE;
  String? eMPLOYEENAME;
  String? eMPLOYEESURNAME;
  String? pOSITIONNAME;
  Null? pHOTOADDRESS;
  bool? iSHEAD;
  String? uID;

  Data(
      {this.iDHREMPLOYEE,
      this.eMPLOYEENAME,
      this.eMPLOYEESURNAME,
      this.pOSITIONNAME,
      this.pHOTOADDRESS,
      this.iSHEAD,
      this.uID});

  Data.fromJson(Map<String, dynamic> json) {
    iDHREMPLOYEE = json['ID_HR_EMPLOYEE'];
    eMPLOYEENAME = json['EMPLOYEE_NAME'];
    eMPLOYEESURNAME = json['EMPLOYEE_SURNAME'];
    pOSITIONNAME = json['POSITION_NAME'];
    pHOTOADDRESS = json['PHOTO_ADDRESS'];
    iSHEAD = json['IS_HEAD'];
    uID = json['UID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_HR_EMPLOYEE'] = this.iDHREMPLOYEE;
    data['EMPLOYEE_NAME'] = this.eMPLOYEENAME;
    data['EMPLOYEE_SURNAME'] = this.eMPLOYEESURNAME;
    data['POSITION_NAME'] = this.pOSITIONNAME;
    data['PHOTO_ADDRESS'] = this.pHOTOADDRESS;
    data['IS_HEAD'] = this.iSHEAD;
    data['UID'] = this.uID;
    return data;
  }
}
