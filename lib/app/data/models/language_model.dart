class LanguageModel {
  List<Data>? data;

  LanguageModel({this.data});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? iDGNLANGUAGE;
  String? lANGUAGECODE;
  String? lANGUAGENAME;
  String? lANGUAGELOGO;

  Data(
      {this.iDGNLANGUAGE,
      this.lANGUAGECODE,
      this.lANGUAGENAME,
      this.lANGUAGELOGO});

  Data.fromJson(Map<String, dynamic> json) {
    iDGNLANGUAGE = json['ID_GN_LANGUAGE'];
    lANGUAGECODE = json['LANGUAGE_CODE'];
    lANGUAGENAME = json['LANGUAGE_NAME'];
    lANGUAGELOGO = json['LANGUAGE_LOGO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_GN_LANGUAGE'] = this.iDGNLANGUAGE;
    data['LANGUAGE_CODE'] = this.lANGUAGECODE;
    data['LANGUAGE_NAME'] = this.lANGUAGENAME;
    data['LANGUAGE_LOGO'] = this.lANGUAGELOGO;
    return data;
  }
}
