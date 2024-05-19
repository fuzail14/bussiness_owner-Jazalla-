import '../../../Constants/Person/person.dart';

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
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.leaveType,
  });
  int? id;
  int? companyId;
  int? employeeId;
  int? leaveTypeId;
  String? appliedOn;
  String? startDate;
  String? endDate;
  String? totalLeaveDays;
  String? leaveReason;

  String? status;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  LeaveType? leaveType;
  Employee? employee;

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

    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    leaveType = LeaveType.fromJson(json['leave_type']);
    employee =
        json['employee'] != null ? Employee.fromJson(json['employee']) : null;
  }
}

class LeaveType {
  LeaveType({
    required this.id,
    required this.companyId,
    required this.title,
    required this.days,
  });
  int? id;
  int? companyId;
  String? title;
  int? days;

  LeaveType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    title = json['title'];
    days = json['days'];
  }
}
