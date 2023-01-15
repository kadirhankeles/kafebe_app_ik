class BulkDeleteMessagesModel {
  String? refreshToken;
  String? token;
  bool? data;

  BulkDeleteMessagesModel({this.refreshToken, this.token, this.data});

  BulkDeleteMessagesModel.fromJson(Map<String, dynamic> json) {
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
