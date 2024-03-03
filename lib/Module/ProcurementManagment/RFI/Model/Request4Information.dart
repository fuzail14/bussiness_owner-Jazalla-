class Request4Information {
  Request4Information({
    required this.success,
    required this.requestForInformation,
  });
  late final bool success;
  late final List<RequestForInformation> requestForInformation;

  Request4Information.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    requestForInformation = List.from(json['RequestForInformation'])
        .map((e) => RequestForInformation.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['RequestForInformation'] =
        requestForInformation.map((e) => e.toJson()).toList();
    return _data;
  }
}

class RequestForInformation {
  RequestForInformation({
    required this.id,
    required this.productId,
    required this.serviceId,
    required this.userId,
    required this.buyerId,
    required this.network,
    required this.requestType,
    required this.requestFor,
    required this.details,
    required this.title,
    required this.unit,
    required this.status,
  });
  int? id;
  int? productId;
  int? serviceId;
  int? userId;
  int? buyerId;
  String? network;
  String? requestType;

  String? requestFor;
  String? details;
  String? startdate;

  String? title;
  String? unit;
  String? status;

  RequestForInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    serviceId = json['service_id'];
    userId = json['user_id'];
    buyerId = json['buyer_id'];
    network = json['network'];
    requestType = json['request_type'];

    requestFor = json['request_for'];
    details = json['details'];
    startdate = json['start_date'];

    title = json['title'];

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['service_id'] = serviceId;
    _data['user_id'] = userId;
    _data['buyer_id'] = buyerId;
    _data['network'] = network;
    _data['request_type'] = requestType;

    _data['request_for'] = requestFor;
    _data['details'] = details;
    _data['start_date'] = startdate;

    _data['title'] = title;
    _data['unit'] = unit;
    _data['status'] = status;

    return _data;
  }
}
