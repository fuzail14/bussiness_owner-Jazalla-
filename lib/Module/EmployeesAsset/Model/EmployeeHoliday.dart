class EmployeeHoliday {
  EmployeeHoliday({
    required this.success,
    required this.holidays,
  });
  late final bool success;
  late final List<Holidays> holidays;

  EmployeeHoliday.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    holidays =
        List.from(json['holidays']).map((e) => Holidays.fromJson(e)).toList();
  }
}

class Holidays {
  Holidays({
    required this.id,
    required this.companyId,
    required this.date,
    required this.endDate,
    required this.occasion,
    required this.createdBy,
  });
  int? id;
  int? companyId;
  String? date;
  String? endDate;
  String? occasion;
  int? createdBy;

  Holidays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    date = json['date'];
    endDate = json['end_date'];
    occasion = json['occasion'];
    createdBy = json['created_by'];
  }
}
