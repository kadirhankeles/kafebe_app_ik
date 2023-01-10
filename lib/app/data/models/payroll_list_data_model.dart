class PayrollListDataModel {
  String? refreshToken;
  String? token;
  List<Data>? data;

  PayrollListDataModel({this.refreshToken, this.token, this.data});

  PayrollListDataModel.fromJson(Map<String, dynamic> json) {
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
  int? dOCUMENTYEAR;
  int? dOCUMENTMONTH;
  String? dOCUMENTPERIOD;
  String? uID;

  Data({this.dOCUMENTYEAR, this.dOCUMENTMONTH, this.dOCUMENTPERIOD, this.uID});

  Data.fromJson(Map<String, dynamic> json) {
    dOCUMENTYEAR = json['DOCUMENT_YEAR'];
    dOCUMENTMONTH = json['DOCUMENT_MONTH'];
    dOCUMENTPERIOD = json['DOCUMENT_PERIOD'];
    uID = json['UID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DOCUMENT_YEAR'] = this.dOCUMENTYEAR;
    data['DOCUMENT_MONTH'] = this.dOCUMENTMONTH;
    data['DOCUMENT_PERIOD'] = this.dOCUMENTPERIOD;
    data['UID'] = this.uID;
    return data;
  }
}
