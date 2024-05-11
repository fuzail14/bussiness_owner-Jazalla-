class EmployeeMeeting {
  EmployeeMeeting({
    required this.success,
    required this.employeemeetings,
  });
  late final bool success;
  late final List<Employeemeetings> employeemeetings;

  EmployeeMeeting.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    employeemeetings = List.from(json['employeemeetings'])
        .map((e) => Employeemeetings.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['employeemeetings'] =
        employeemeetings.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Employeemeetings {
  Employeemeetings({
    required this.id,
    required this.companyId,
    required this.meetingId,
    required this.employeeId,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.meetings,
  });
  late final int id;
  late final int companyId;
  late final int meetingId;
  late final int employeeId;
  late final int createdBy;
  late final String createdAt;
  late final String updatedAt;
  late final Meetings meetings;

  Employeemeetings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    meetingId = json['meeting_id'];
    employeeId = json['employee_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    meetings = Meetings.fromJson(json['meetings']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['meeting_id'] = meetingId;
    _data['employee_id'] = employeeId;
    _data['created_by'] = createdBy;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['meetings'] = meetings.toJson();
    return _data;
  }
}

class Meetings {
  Meetings({
    required this.id,
    required this.companyId,
    this.branchId,
    required this.departmentId,
    required this.employeeId,
    required this.title,
    required this.date,
    required this.time,
    required this.note,
    required this.location,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int companyId;
  late final Null branchId;
  late final String departmentId;
  late final String employeeId;
  late final String title;
  late final String date;
  late final String time;
  late final String note;
  late final String location;
  late final int createdBy;
  late final String createdAt;
  late final String updatedAt;

  Meetings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    branchId = null;
    departmentId = json['department_id'];
    employeeId = json['employee_id'];
    title = json['title'];
    date = json['date'];
    time = json['time'];
    note = json['note'];
    location = json['location'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['branch_id'] = branchId;
    _data['department_id'] = departmentId;
    _data['employee_id'] = employeeId;
    _data['title'] = title;
    _data['date'] = date;
    _data['time'] = time;
    _data['note'] = note;
    _data['location'] = location;
    _data['created_by'] = createdBy;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
