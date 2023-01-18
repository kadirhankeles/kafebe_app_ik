class SendForApprovalModel {
  String? refreshToken;
  String? token;
  Data? data;

  SendForApprovalModel({this.refreshToken, this.token, this.data});

  SendForApprovalModel.fromJson(Map<String, dynamic> json) {
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
  bool? sUCCESS;
  String? mESSAGE;

  Data({this.sUCCESS, this.mESSAGE});

  Data.fromJson(Map<String, dynamic> json) {
    sUCCESS = json['SUCCESS'];
    mESSAGE = json['MESSAGE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SUCCESS'] = this.sUCCESS;
    data['MESSAGE'] = this.mESSAGE;
    return data;
  }
}
