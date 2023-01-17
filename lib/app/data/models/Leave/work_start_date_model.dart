class WorkStartDateModel {
  String? refreshToken;
  String? token;
  Data? data;

  WorkStartDateModel({this.refreshToken, this.token, this.data});

  WorkStartDateModel.fromJson(Map<String, dynamic> json) {
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
  bool? lEAVEEXISTS;
  String? wDATE;
  dynamic dAY;
  dynamic hOUR;
  dynamic mINUTE;
  dynamic mESSAGE;
  dynamic vALID;

  Data(
      {this.lEAVEEXISTS,
      this.wDATE,
      this.dAY,
      this.hOUR,
      this.mINUTE,
      this.mESSAGE,
      this.vALID});

  Data.fromJson(Map<String, dynamic> json) {
    lEAVEEXISTS = json['LEAVE_EXISTS'];
    wDATE = json['WDATE'];
    dAY = json['DAY'];
    hOUR = json['HOUR'];
    mINUTE = json['MINUTE'];
    mESSAGE = json['MESSAGE'];
    vALID = json['VALID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LEAVE_EXISTS'] = this.lEAVEEXISTS;
    data['WDATE'] = this.wDATE;
    data['DAY'] = this.dAY;
    data['HOUR'] = this.hOUR;
    data['MINUTE'] = this.mINUTE;
    data['MESSAGE'] = this.mESSAGE;
    data['VALID'] = this.vALID;
    return data;
  }
}
