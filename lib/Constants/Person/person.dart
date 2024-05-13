class Person {
  Person({this.success, this.data, this.Bearer, this.employee});
  bool? success;
  Data? data;
  Employee? employee;
  String? Bearer;

  Person.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = Data.fromJson(json['data']);
    Bearer = json['Bearer'];
    // employee = Employee.fromJson(json['employee']);
    employee =
        json['employee'] != null ? Employee.fromJson(json['employee']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    //data['data'] = data.toJson();
    data['Bearer'] = Bearer;
    // data['employee'] = employee!.toJson();
    data['employee'] = employee != null ? employee!.toJson() : null;
    return data;
  }
}

class Data {
  Data(
      {this.id,
      this.companyId,
      this.locationId,
      this.currentLocation,
      this.loginType,
      this.name,
      this.firstName,
      this.lastName,
      this.mobileNo,
      this.userRoleId,
      this.email,
      this.emailVerifiedAt,
      this.plan,
      this.planExpireDate,
      this.requestedPlan,
      this.type,
      this.avatar,
      this.lang,
      this.mode,
      this.createdBy,
      this.defaultPipeline,
      this.deleteStatus,
      this.isActive,
      this.lastLoginAt,
      this.createdAt,
      this.updatedAt,
      this.messengerColor,
      this.darkMode,
      this.activeStatus,
      this.isEmailVerified,
      this.profile,
      this.fcmtoken,
      this.company});
  int? id;
  int? companyId;
  int? locationId;
  int? currentLocation;
  String? loginType;
  String? name;
  String? firstName;
  String? lastName;
  String? mobileNo;
  int? userRoleId;
  String? email;
  String? emailVerifiedAt;
  int? plan;
  Null planExpireDate;
  int? requestedPlan;
  String? type;
  String? avatar;
  String? lang;
  String? mode;
  int? createdBy;
  int? defaultPipeline;
  int? deleteStatus;
  int? isActive;
  String? lastLoginAt;
  String? createdAt;
  String? updatedAt;
  String? messengerColor;
  int? darkMode;
  int? activeStatus;
  int? isEmailVerified;
  String? profile;
  String? fcmtoken;
  Company? company;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    locationId = json['location_id'];
    currentLocation = json['current_location'];
    loginType = null;
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNo = json['mobile_no'];
    userRoleId = null;
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    plan = json['plan'];
    planExpireDate = null;
    requestedPlan = json['requested_plan'];
    type = json['type'];
    avatar = json['avatar'];
    lang = json['lang'];
    mode = json['mode'];
    createdBy = json['created_by'];
    defaultPipeline = json['default_pipeline'];
    deleteStatus = json['delete_status'];
    isActive = json['is_active'];
    lastLoginAt = json['last_login_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    messengerColor = json['messenger_color'];
    darkMode = json['dark_mode'];
    activeStatus = json['active_status'];
    isEmailVerified = json['is_email_verified'];
    profile = json['profile'];
    fcmtoken = json['fcmtoken'];
    company = Company.fromJson(json['company']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['location_id'] = locationId;
    data['current_location'] = currentLocation;
    data['login_type'] = loginType;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile_no'] = mobileNo;
    data['user_role_id'] = userRoleId;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['plan'] = plan;
    data['plan_expire_date'] = planExpireDate;
    data['requested_plan'] = requestedPlan;
    data['type'] = type;
    data['avatar'] = avatar;
    data['lang'] = lang;
    data['mode'] = mode;
    data['created_by'] = createdBy;
    data['default_pipeline'] = defaultPipeline;
    data['delete_status'] = deleteStatus;
    data['is_active'] = isActive;
    data['last_login_at'] = lastLoginAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['messenger_color'] = messengerColor;
    data['dark_mode'] = darkMode;
    data['active_status'] = activeStatus;
    data['is_email_verified'] = isEmailVerified;
    data['profile'] = profile;
    data['fcmtoken'] = fcmtoken;

    return data;
  }
}

class Company {
  Company({
    this.id,
    this.companyCode,
    this.companyName,
    this.primaryActivity,
    this.arCompanyName,
    this.businessType,
  });
  int? id;
  String? companyCode;
  String? primaryActivity;

  String? companyName;
  String? arCompanyName;
  String? businessType;

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyCode = json['company_code'];
    companyName = json['company_name'];
    primaryActivity = json['primary_activity'];
    arCompanyName = null;
    businessType = null;
  }
}

class Employee {
  Employee({
    this.id,
    this.userId,
    this.name,
    this.departmentId,
    this.designationId,
    this.isActive,
    this.createdBy,
  });
  int? id;
  int? userId;
  String? name;
  int? departmentId;
  int? designationId;
  int? isActive;
  int? createdBy;

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];

    departmentId = json['department_id'];
    designationId = json['designation_id'];

    isActive = json['is_active'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['name'] = name;

    _data['department_id'] = departmentId;
    _data['designation_id'] = designationId;

    _data['is_active'] = isActive;
    _data['created_by'] = createdBy;

    return _data;
  }
}
