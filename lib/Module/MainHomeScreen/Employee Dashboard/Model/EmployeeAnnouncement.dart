class EmployeeAnnouncment {
  EmployeeAnnouncment({
    required this.success,
    required this.employeeannouncments,
  });
  late final bool success;
  late final List<Employeeannouncments> employeeannouncments;

  EmployeeAnnouncment.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    employeeannouncments = List.from(json['employeeannouncments'])
        .map((e) => Employeeannouncments.fromJson(e))
        .toList();
  }
}

class Employeeannouncments {
  Employeeannouncments({
    required this.id,
    required this.companyId,
    required this.announcementId,
    required this.employeeId,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.announcments,
  });
  late final int id;
  late final int companyId;
  late final int announcementId;
  late final int employeeId;
  late final int createdBy;
  late final String createdAt;
  late final String updatedAt;
  late final Announcments announcments;

  Employeeannouncments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    announcementId = json['announcement_id'];
    employeeId = json['employee_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    announcments = Announcments.fromJson(json['announcments']);
  }
}

class Announcments {
  Announcments({
    required this.id,
    required this.companyId,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.departmentId,
    required this.employeeId,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int companyId;
  late final String title;
  late final String startDate;
  late final String endDate;

  late final String departmentId;
  late final String employeeId;
  late final String description;
  late final int createdBy;
  late final String createdAt;
  late final String updatedAt;

  Announcments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    title = json['title'];
    startDate = json['start_date'];
    endDate = json['end_date'];

    departmentId = json['department_id'];
    employeeId = json['employee_id'];
    description = json['description'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
