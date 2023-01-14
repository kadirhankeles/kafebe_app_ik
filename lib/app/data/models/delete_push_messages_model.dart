class DeletePushMessagesModel {
  String? refreshToken;
  String? token;
  bool? data;

  DeletePushMessagesModel({this.refreshToken, this.token, this.data});

  DeletePushMessagesModel.fromJson(Map<String, dynamic> json) {
    refreshToken = json['RefreshToken'];
    token = json['Token'];
    data = json['Data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RefreshToken'] = this.refreshToken;
    data['Token'] = this.token;
    data['Data'] = this.data;
    return data;
  }
}
