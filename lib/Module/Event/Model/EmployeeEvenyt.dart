class EmployeeEvent {
  EmployeeEvent({
    required this.success,
    required this.employeeevent,
  });
  late final bool success;
  late final List<Employeeevent> employeeevent;

  EmployeeEvent.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    employeeevent = List.from(json['employeeevent'])
        .map((e) => Employeeevent.fromJson(e))
        .toList();
  }
}

class Employeeevent {
  Employeeevent({
    required this.id,
    required this.companyId,
    required this.eventId,
    required this.employeeId,
    required this.createdBy,
    required this.event,
  });
  int? id;
  int? companyId;
  int? eventId;
  int? employeeId;
  int? createdBy;

  Event? event;

  Employeeevent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    eventId = json['event_id'];
    employeeId = json['employee_id'];
    createdBy = json['created_by'];

    event = Event.fromJson(json['event']);
  }
}

class Event {
  Event({
    required this.id,
    required this.companyId,
    required this.branchId,
    required this.departmentId,
    required this.employeeId,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.color,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });
  int? id;
  int? companyId;
  int? branchId;
  String? departmentId;
  String? employeeId;
  String? title;
  String? startDate;
  String? endDate;
  String? color;
  String? description;
  int? createdBy;
  String? createdAt;
  String? updatedAt;

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    branchId = json['branch_id'];
    departmentId = json['department_id'];
    employeeId = json['employee_id'];
    title = json['title'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    color = json['color'];
    description = json['description'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
