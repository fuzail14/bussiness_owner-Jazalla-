import 'package:bussines_owner/Constants/Person/person.dart';

class EmployeeAppraisal {
  EmployeeAppraisal({
    required this.success,
    required this.appraisals,
  });
  late final bool success;
  late final List<Appraisals> appraisals;

  EmployeeAppraisal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    appraisals = List.from(json['appraisals'])
        .map((e) => Appraisals.fromJson(e))
        .toList();
  }
}

class Appraisals {
  Appraisals({
    required this.id,
    required this.companyId,
    required this.branch,
    required this.department,
    // required this.employee,
    required this.rating,
    required this.appraisalDate,
    required this.customerExperience,
    required this.marketing,
    required this.administration,
    required this.professionalism,
    required this.integrity,
    required this.attendance,
    required this.remark,
    required this.createdBy,
  });
  int? id;
  int? companyId;
  int? branch;
  int? department;
  int? employeeId;
  String? rating;
  String? appraisalDate;
  int? customerExperience;
  int? marketing;
  int? administration;
  int? professionalism;
  int? integrity;
  int? attendance;
  String? remark;
  int? createdBy;
  Departments? departments;
  Employees? employee;

  Appraisals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    branch = json['branch'];
    department = json['department'];
    employeeId = json['employee'];
    rating = json['rating'];
    appraisalDate = json['appraisal_date'];
    customerExperience = json['customer_experience'];
    marketing = json['marketing'];
    administration = json['administration'];
    professionalism = json['professionalism'];
    integrity = json['integrity'];
    attendance = json['attendance'];
    remark = json['remark'];
    createdBy = json['created_by'];
    departments = Departments.fromJson(json['departments']);
    employee = json['employees'] != null
        ? Employees.fromJson(json['employees'])
        : null;
  }
}

class Departments {
  Departments({
    required this.id,
    required this.companyId,
    this.branchId,
    required this.moduleId,
    required this.name,
    required this.slug,
    required this.sortOrder,
    required this.status,
  });
  int? id;
  int? companyId;
  int? branchId;
  int? moduleId;
  String? name;
  String? slug;
  int? sortOrder;

  String? status;

  Departments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    branchId = null;
    moduleId = json['module_id'];
    name = json['name'];
    slug = json['slug'];
    sortOrder = json['sort_order'];

    status = json['status'];
  }
}

class Employees {
  Employees({
    this.id,
    this.name,
  });
  int? id;
  String? name;

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
