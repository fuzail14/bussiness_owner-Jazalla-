class AttendanceEmployee {
  AttendanceEmployee({
    required this.success,
    required this.employeeattendance,
  });
  late final bool success;
  late final List<Employeeattendance> employeeattendance;

  AttendanceEmployee.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    employeeattendance = List.from(json['employeeattendance'])
        .map((e) => Employeeattendance.fromJson(e))
        .toList();
  }
}

class Employeeattendance {
  Employeeattendance({
    this.id,
    this.employeeId,
    this.date,
    this.status,
    this.clockIn,
    this.clockOut,
    this.late,
    this.earlyLeaving,
    this.overtime,
    this.totalRest,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  int? employeeId;
  String? date;
  String? status;
  String? clockIn;
  String? clockOut;
  String? late;
  String? earlyLeaving;
  String? overtime;
  String? totalRest;
  int? createdBy;
  String? createdAt;
  String? updatedAt;

  Employeeattendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    date = json['date'];
    status = json['status'];
    clockIn = json['clock_in'];
    clockOut = json['clock_out'];
    late = json['late'];
    earlyLeaving = json['early_leaving'];
    overtime = json['overtime'];
    totalRest = json['total_rest'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
