class PayrollPeriodModel {
  int? year;
  int? month;
  String? documentid;

  PayrollPeriodModel({this.year, this.month, this.documentid});

  PayrollPeriodModel.fromJson(Map<String, dynamic> json) {
    year = json['YEAR'];
    month = json['MONTH'];
    documentid = json['DOCUMENTID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['YEAR'] = this.year;
    data['MONTH'] = this.month;
    data['DOCUMENTID'] = this.documentid;
    return data;
  }
}


//step 2