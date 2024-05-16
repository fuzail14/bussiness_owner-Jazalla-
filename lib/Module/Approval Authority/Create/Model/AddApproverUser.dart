class AddApproverUser {
  AddApproverUser({
    required this.success,
    required this.approveruser,
  });
  late final bool success;
  late final List<Approveruser> approveruser;

  AddApproverUser.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    approveruser = List.from(json['approveruser'])
        .map((e) => Approveruser.fromJson(e))
        .toList();
  }
}

class Approveruser {
  Approveruser({
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

  Approveruser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }
}
