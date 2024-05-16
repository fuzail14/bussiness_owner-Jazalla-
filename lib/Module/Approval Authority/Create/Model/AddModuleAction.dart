class AddModuleAction {
  AddModuleAction({
    required this.success,
    required this.moduleactionforadd,
  });
  late final bool success;
  late final List<Moduleactionforadd> moduleactionforadd;

  AddModuleAction.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    moduleactionforadd = List.from(json['moduleactionforadd'])
        .map((e) => Moduleactionforadd.fromJson(e))
        .toList();
  }
}

class Moduleactionforadd {
  Moduleactionforadd({
    required this.id,
    required this.companyId,
    required this.moduleFunctionId,
    required this.name,
  });
  int? id;
  int? companyId;
  int? moduleFunctionId;
  String? name;

  Moduleactionforadd.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    moduleFunctionId = json['module_function_id'];
    name = json['name'];
  }
}
