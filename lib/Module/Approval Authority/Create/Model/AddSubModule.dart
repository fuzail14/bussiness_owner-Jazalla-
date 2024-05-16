class AddSubModule {
  AddSubModule({
    required this.success,
    required this.submoduleforadd,
  });
  late final bool success;
  late final List<Submoduleforadd> submoduleforadd;

  AddSubModule.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    submoduleforadd = List.from(json['submoduleforadd'])
        .map((e) => Submoduleforadd.fromJson(e))
        .toList();
  }
}

class Submoduleforadd {
  Submoduleforadd({
    required this.id,
    required this.moduleId,
    required this.name,
  });
  int? id;
  int? moduleId;
  String? name;

  Submoduleforadd.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    moduleId = json['module_id'];
    name = json['name'];
  }
}
