import '../../Apprisal/Model/EmployeeAppraisal.dart';

class CompanyPolicy {
  CompanyPolicy({
    required this.success,
    required this.companypolicies,
  });
  late final bool success;
  late final List<Companypolicies> companypolicies;

  CompanyPolicy.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    companypolicies = List.from(json['companypolicies'])
        .map((e) => Companypolicies.fromJson(e))
        .toList();
  }
}

class Companypolicies {
  Companypolicies({
    required this.id,
    required this.companyId,
    required this.department,
    required this.title,
    required this.description,
    required this.attachment,
    required this.createdBy,
  });
  int? id;
  int? companyId;
  int? department;
  String? title;
  String? description;
  String? attachment;
  int? createdBy;
  Departments? departments;

  Companypolicies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    department = json['department'];
    title = json['title'];
    description = json['description'];
    attachment = json['attachment'];
    createdBy = json['created_by'];
    departments = Departments.fromJson(json['departments']);
  }
}
