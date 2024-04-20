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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company_code'] = companyCode;
    data['company_name'] = companyName;

    data['mobile_no'] = mobileNo;

    data['email'] = email;

    data['primary_activity'] = primaryActivity;

    return data;
  }
}
