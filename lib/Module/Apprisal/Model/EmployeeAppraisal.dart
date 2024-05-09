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
    required this.employee,
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
  int? employee;
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

  Appraisals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    branch = json['branch'];
    department = json['department'];
    employee = json['employee'];
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
    this.description,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });
  late final int id;
  late final int companyId;
  late final Null branchId;
  late final int moduleId;
  late final String name;
  late final String slug;
  late final int sortOrder;
  late final Null description;
  late final int createdBy;
  late final String createdAt;
  late final String updatedAt;
  late final String status;

  Departments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    branchId = null;
    moduleId = json['module_id'];
    name = json['name'];
    slug = json['slug'];
    sortOrder = json['sort_order'];
    description = null;
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['branch_id'] = branchId;
    _data['module_id'] = moduleId;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['sort_order'] = sortOrder;
    _data['description'] = description;
    _data['created_by'] = createdBy;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['status'] = status;
    return _data;
  }
}
