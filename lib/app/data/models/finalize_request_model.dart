class FinalizeRequestModel {
  String? iDMASTER;
  dynamic? statu;
  String? explanation;
  dynamic? isInsteadApprove;
  dynamic? insteadApproverOrigin;

  FinalizeRequestModel(
      {this.iDMASTER,
      this.statu,
      this.explanation,
      this.isInsteadApprove,
      this.insteadApproverOrigin});

  FinalizeRequestModel.fromJson(Map<String, dynamic> json) {
    iDMASTER = json['ID_MASTER'];
    statu = json['Statu'];
    explanation = json['Explanation'];
    isInsteadApprove = json['isInsteadApprove'];
    insteadApproverOrigin = json['InsteadApproverOrigin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_MASTER'] = this.iDMASTER;
    data['Statu'] = this.statu;
    data['Explanation'] = this.explanation;
    data['isInsteadApprove'] = this.isInsteadApprove;
    data['InsteadApproverOrigin'] = this.insteadApproverOrigin;
    return data;
  }
}
