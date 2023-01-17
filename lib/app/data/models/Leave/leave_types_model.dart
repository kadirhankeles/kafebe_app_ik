class LeaveTypeModel {
  String? refreshToken;
  String? token;
  List<Data>? data;

  LeaveTypeModel({this.refreshToken, this.token, this.data});

  LeaveTypeModel.fromJson(Map<String, dynamic> json) {
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
  int? iDFIRMS;
  String? fIRMSHORTNAME;
  int? pICKLISTVACATIONTYPEID;
  String? pICKLISTVACATIONTYPENAME;
  bool? iSDAILY;
  bool? iSDOCUMENTATTACHED;
  bool? iSDOCUMENTATTACHMANDATORY;

  Data(
      {this.iDFIRMS,
      this.fIRMSHORTNAME,
      this.pICKLISTVACATIONTYPEID,
      this.pICKLISTVACATIONTYPENAME,
      this.iSDAILY,
      this.iSDOCUMENTATTACHED,
      this.iSDOCUMENTATTACHMANDATORY});

  Data.fromJson(Map<String, dynamic> json) {
    iDFIRMS = json['ID_FIRMS'];
    fIRMSHORTNAME = json['FIRM_SHORT_NAME'];
    pICKLISTVACATIONTYPEID = json['PICKLIST_VACATION_TYPE_ID'];
    pICKLISTVACATIONTYPENAME = json['PICKLIST_VACATION_TYPE_NAME'];
    iSDAILY = json['IS_DAILY'];
    iSDOCUMENTATTACHED = json['IS_DOCUMENT_ATTACHED'];
    iSDOCUMENTATTACHMANDATORY = json['IS_DOCUMENT_ATTACH_MANDATORY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_FIRMS'] = this.iDFIRMS;
    data['FIRM_SHORT_NAME'] = this.fIRMSHORTNAME;
    data['PICKLIST_VACATION_TYPE_ID'] = this.pICKLISTVACATIONTYPEID;
    data['PICKLIST_VACATION_TYPE_NAME'] = this.pICKLISTVACATIONTYPENAME;
    data['IS_DAILY'] = this.iSDAILY;
    data['IS_DOCUMENT_ATTACHED'] = this.iSDOCUMENTATTACHED;
    data['IS_DOCUMENT_ATTACH_MANDATORY'] = this.iSDOCUMENTATTACHMANDATORY;
    return data;
  }
}
