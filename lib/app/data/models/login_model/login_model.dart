class LoginModel {
  String? token;
  String? refreshToken;
  bool? isManager;
  int? userID;

  LoginModel({this.token, this.refreshToken, this.isManager, this.userID});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    refreshToken = json['RefreshToken'];
    isManager = json['IsManager'];
    userID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Token'] = this.token;
    data['RefreshToken'] = this.refreshToken;
    data['IsManager'] = this.isManager;
    data['UserID'] = this.userID;
    return data;
  }
}
