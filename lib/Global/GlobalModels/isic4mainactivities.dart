// class Isic4MainActivity {
//   Isic4MainActivity({
//     required this.success,
//     required this.isicMainActivities,
//   });
//   late final bool success;
//   late final List<IsicMainActivities> isicMainActivities;

//   Isic4MainActivity.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     isicMainActivities = List.from(json['IsicMainActivities'])
//         .map((e) => IsicMainActivities.fromJson(e))
//         .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['success'] = success;
//     _data['IsicMainActivities'] =
//         isicMainActivities.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class IsicMainActivities {
//   IsicMainActivities({
//     required this.id,
//     required this.mainActivityName,
//     required this.sort,
//     required this.icon,
//     required this.status,
//   });
//   int? id;
//   String? mainActivityName;
//   int? sort;
//   String? icon;
//   String? status;

//   IsicMainActivities.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     mainActivityName = json['main_activity_name'];
//     sort = json['sort'];
//     icon = json['icon'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['main_activity_name'] = mainActivityName;
//     _data['sort'] = sort;
//     _data['icon'] = icon;
//     _data['status'] = status;

//     return _data;
//   }
// }
