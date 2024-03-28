class Notification {
  Notification({
    required this.success,
    required this.notificationData,
  });
  late final bool success;
  late final List<NotificationData> notificationData;

  Notification.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    notificationData = List.from(json['NotificationData'])
        .map((e) => NotificationData.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['NotificationData'] =
        notificationData.map((e) => e.toJson()).toList();
    return _data;
  }
}

class NotificationData {
  NotificationData({
    required this.id,
    required this.userId,
    required this.type,
    required this.typeId,
    required this.data,
    required this.links,
    required this.heading,
    required this.notificationType,
    required this.notificationFrom,
    required this.senderId,
    required this.senderUserId,
    required this.receiverId,
    required this.notificationTo,
    required this.receiverType,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
  });
  int? id;
  int? userId;
  String? type;
  int? typeId;
  String? data;
  String? links;
  String? heading;
  String? notificationType;
  String? notificationFrom;
  int? senderId;
  int? senderUserId;
  int? receiverId;
  String? notificationTo;
  String? receiverType;
  int? isRead;
  String? createdAt;
  String? updatedAt;

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    typeId = json['type_id'];
    data = json['data'];
    links = json['links'];
    heading = json['heading'];
    notificationType = json['notification_type'];
    notificationFrom = json['notification_from'];
    senderId = json['sender_id'];
    senderUserId = json['sender_user_id'];
    receiverId = json['receiver_id'];
    notificationTo = json['notification_to'];
    receiverType = json['receiver_type'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['type'] = type;
    _data['type_id'] = typeId;
    _data['data'] = data;
    _data['links'] = links;
    _data['heading'] = heading;
    _data['notification_type'] = notificationType;
    _data['notification_from'] = notificationFrom;
    _data['sender_id'] = senderId;
    _data['sender_user_id'] = senderUserId;
    _data['receiver_id'] = receiverId;
    _data['notification_to'] = notificationTo;
    _data['receiver_type'] = receiverType;
    _data['is_read'] = isRead;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
