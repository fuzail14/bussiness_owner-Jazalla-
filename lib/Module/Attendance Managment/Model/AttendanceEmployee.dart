import '../../../Constants/Person/person.dart';

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
  Employeeattendance(
      {this.id,
      this.employeeId,
      this.date,
      this.status,
      this.clockIn,
      this.clockOut,
      this.late,
      this.earlyLeaving,
      this.overtime,
      this.totalRest,
      this.employee});
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

  Employee? employee;

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

    //employee = Employee.fromJson(json['employee']);
    employee =
        json['employee'] != null ? Employee.fromJson(json['employee']) : null;
  }
}
