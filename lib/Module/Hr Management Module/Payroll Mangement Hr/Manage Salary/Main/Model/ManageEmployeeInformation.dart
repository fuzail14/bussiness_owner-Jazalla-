class ManageEmployeeInformation {
  ManageEmployeeInformation({
    required this.success,
    required this.employeeinformation,
  });
  late final bool success;
  late final List<Employeeinformation> employeeinformation;

  ManageEmployeeInformation.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    employeeinformation = List.from(json['employeeinformation'])
        .map((e) => Employeeinformation.fromJson(e))
        .toList();
  }
}

class Employeeinformation {
  Employeeinformation({
    required this.id,
    required this.name,
    required this.email,
    required this.departmentId,
    required this.designationId,
    required this.department,
    required this.designation,
  });
  int? id;
  String? name;
  String? email;
  int? departmentId;
  int? designationId;
  Department? department;
  Designation? designation;

  Employeeinformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    departmentId = json['department_id'];
    designationId = json['designation_id'];
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;
  }
}

class Department {
  Department({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Designation {
  Designation({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  Designation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
