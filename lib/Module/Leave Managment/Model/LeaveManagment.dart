class LeaveManagement {
  LeaveManagement({
    required this.success,
    required this.employeeleave,
  });
  late final bool success;
  late final List<Employeeleave> employeeleave;

  LeaveManagement.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    employeeleave = List.from(json['employeeleave'])
        .map((e) => Employeeleave.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['employeeleave'] = employeeleave.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Employeeleave {
  Employeeleave({
    required this.id,
    required this.companyId,
    required this.employeeId,
    required this.leaveTypeId,
    required this.appliedOn,
    required this.startDate,
    required this.endDate,
    required this.totalLeaveDays,
    required this.leaveReason,
    required this.remark,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.leaveType,
  });
  late final int id;
  late final int companyId;
  late final int employeeId;
  late final int leaveTypeId;
  late final String appliedOn;
  late final String startDate;
  late final String endDate;
  late final String totalLeaveDays;
  late final String leaveReason;
  late final String remark;
  late final String status;
  late final int createdBy;
  late final String createdAt;
  late final String updatedAt;
  late final LeaveType leaveType;

  Employeeleave.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    employeeId = json['employee_id'];
    leaveTypeId = json['leave_type_id'];
    appliedOn = json['applied_on'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    totalLeaveDays = json['total_leave_days'];
    leaveReason = json['leave_reason'];
    remark = json['remark'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    leaveType = LeaveType.fromJson(json['leave_type']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['employee_id'] = employeeId;
    _data['leave_type_id'] = leaveTypeId;
    _data['applied_on'] = appliedOn;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['total_leave_days'] = totalLeaveDays;
    _data['leave_reason'] = leaveReason;
    _data['remark'] = remark;
    _data['status'] = status;
    _data['created_by'] = createdBy;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['leave_type'] = leaveType.toJson();
    return _data;
  }
}

class LeaveType {
  LeaveType({
    required this.id,
    required this.companyId,
    required this.title,
    required this.days,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int companyId;
  late final String title;
  late final int days;
  late final int createdBy;
  late final String createdAt;
  late final String updatedAt;

  LeaveType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    title = json['title'];
    days = json['days'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['title'] = title;
    _data['days'] = days;
    _data['created_by'] = createdBy;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
