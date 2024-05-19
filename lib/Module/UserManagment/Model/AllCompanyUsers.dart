class AllCompanyUsers {
  AllCompanyUsers({
    required this.success,
    required this.companyusers,
  });
  late final bool success;
  late final List<Companyusers> companyusers;

  AllCompanyUsers.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    companyusers = List.from(json['companyusers'])
        .map((e) => Companyusers.fromJson(e))
        .toList();
  }
}

class Companyusers {
  Companyusers({
    required this.id,
    required this.companyId,
    required this.name,
    this.firstName,
    this.lastName,
    required this.mobileNo,
    required this.email,
    required this.type,
    required this.activeStatus,
    required this.isActive,
    required this.profile,
  });
  int? id;
  int? companyId;
  String? name;
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? email;
  String? type;
  int? activeStatus;
  int? isActive;
  String? profile;

  Companyusers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    ;
    mobileNo = json['mobile_no'];
    email = json['email'];
    type = json['type'];
    activeStatus = json['active_status'];
    isActive = json['is_active'];
    profile = json['profile'];
  }
}
