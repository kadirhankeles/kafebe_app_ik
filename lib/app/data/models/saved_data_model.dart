class SavedDataModel {
  String? userName;
  String? myToken;
  int? languageIndex;
  int? firmIndex;
  bool? isManager;

  SavedDataModel({this.firmIndex,this.isManager,this.languageIndex,this.myToken,this.userName});

  SavedDataModel.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    myToken = json['token'];
    languageIndex = json['language_index'];
    firmIndex = json['firm_index'];
    isManager = json['isManager'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['token'] = this.myToken;
    data['firm_index'] = this.firmIndex;
    data['language_index'] = this.languageIndex;
    return data;
  }
}