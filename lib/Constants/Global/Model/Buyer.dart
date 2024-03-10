class Buyer {
  Buyer({
    required this.id,
    required this.companyCode,
    required this.companyName,
    required this.mobileNo,
    required this.email,
    required this.primaryActivity,
  });
  int? id;
  String? companyCode;
  String? companyName;
  String? mobileNo;

  String? email;
  String? primaryActivity;

  Buyer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyCode = json['company_code'];
    companyName = json['company_name'];

    mobileNo = json['mobile_no'];

    email = json['email'];
    primaryActivity = json['primary_activity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_code'] = companyCode;
    _data['company_name'] = companyName;

    _data['mobile_no'] = mobileNo;

    _data['email'] = email;

    _data['primary_activity'] = primaryActivity;

    return _data;
  }
}
