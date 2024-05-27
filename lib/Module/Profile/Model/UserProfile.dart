class UserProfile {
  UserProfile({
    required this.success,
    required this.profile,
  });
  late final bool success;
  late final List<Profile> profile;

  UserProfile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    profile =
        List.from(json['profile']).map((e) => Profile.fromJson(e)).toList();
  }
}

class Profile {
  Profile({
    required this.id,
    required this.companyId,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
    required this.email,
    required this.type,
    required this.avatar,
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
  String? avatar;
  int? isActive;
  String? profile;

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    type = json['type'];
    avatar = json['avatar'];
    isActive = json['is_active'];
    profile = json['profile'];
  }
}
