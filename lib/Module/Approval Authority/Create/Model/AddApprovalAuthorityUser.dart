class AddApprovalAuthorityUser {
  AddApprovalAuthorityUser({
    required this.success,
    required this.approvalauthorityuser,
  });
  late final bool success;
  late final List<Approvalauthorityuser> approvalauthorityuser;

  AddApprovalAuthorityUser.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    approvalauthorityuser = List.from(json['approvalauthorityuser'])
        .map((e) => Approvalauthorityuser.fromJson(e))
        .toList();
  }
}

class Approvalauthorityuser {
  Approvalauthorityuser({
    required this.id,
    required this.companyId,
    required this.name,
    this.firstName,
    this.lastName,
  });
  int? id;
  int? companyId;
  String? name;
  String? firstName;
  String? lastName;

  Approvalauthorityuser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    firstName = json['last_name'];
    ;
    lastName = json['first_name'];
  }
}
