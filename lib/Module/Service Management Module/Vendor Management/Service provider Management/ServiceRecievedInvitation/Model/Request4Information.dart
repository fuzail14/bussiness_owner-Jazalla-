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
    final data = <String, dynamic>{};
    data['success'] = success;
    data['RequestForInformation'] =
        requestForInformation.map((e) => e.toJson()).toList();
    return data;
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['service_id'] = serviceId;
    data['user_id'] = userId;
    data['buyer_id'] = buyerId;
    data['network'] = network;
    data['request_type'] = requestType;

    data['request_for'] = requestFor;
    data['details'] = details;
    data['start_date'] = startdate;

    data['title'] = title;
    data['unit'] = unit;
    data['status'] = status;

    return data;
  }
}
