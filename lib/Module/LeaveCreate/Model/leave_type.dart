class LeaveTypes {
  LeaveTypes({
    required this.success,
    required this.allleavetypes,
  });
  late final bool success;
  late final List<Allleavetypes> allleavetypes;

  LeaveTypes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    allleavetypes = List.from(json['allleavetypes'])
        .map((e) => Allleavetypes.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['allleavetypes'] = allleavetypes.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Allleavetypes {
  Allleavetypes({
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

  Allleavetypes.fromJson(Map<String, dynamic> json) {
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
