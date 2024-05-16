class AddModule {
  AddModule({
    required this.success,
    required this.moduleforadd,
  });
  late final bool success;
  late final List<Moduleforadd> moduleforadd;

  AddModule.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    moduleforadd = List.from(json['moduleforadd'])
        .map((e) => Moduleforadd.fromJson(e))
        .toList();
  }
}

class Moduleforadd {
  Moduleforadd({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  Moduleforadd.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
