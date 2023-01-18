class ErrorModel {
  int? type;
  String? typeDesc;
  String? errorCode;
  String? message;
  Detail? detail;

  ErrorModel(
      {this.type, this.typeDesc, this.errorCode, this.message, this.detail});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    type = json['Type'];
    typeDesc = json['Type_Desc'];
    errorCode = json['ErrorCode'];
    message = json['Message'];
    detail =
        json['Detail'] != null ? new Detail.fromJson(json['Detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Type'] = this.type;
    data['Type_Desc'] = this.typeDesc;
    data['ErrorCode'] = this.errorCode;
    data['Message'] = this.message;
    if (this.detail != null) {
      data['Detail'] = this.detail!.toJson();
    }
    return data;
  }
}

class Detail {
  List<String>? stackTrace;
  String? type;
  Null? innerExceptions;

  Detail({this.stackTrace, this.type, this.innerExceptions});

  Detail.fromJson(Map<String, dynamic> json) {
    stackTrace = json['StackTrace'].cast<String>();
    type = json['Type'];
    innerExceptions = json['InnerExceptions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StackTrace'] = this.stackTrace;
    data['Type'] = this.type;
    data['InnerExceptions'] = this.innerExceptions;
    return data;
  }
}
