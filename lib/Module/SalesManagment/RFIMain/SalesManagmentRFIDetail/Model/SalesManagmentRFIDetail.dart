import '../../../../../Constants/Global/Model/Buyer.dart';

class SalesManagmentRFIDetail {
  SalesManagmentRFIDetail({
    required this.success,
    required this.salesManagmentRfiDetail,
  });
  late final bool success;
  late final List<SalesManagmentRfiDetail> salesManagmentRfiDetail;

  SalesManagmentRFIDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    salesManagmentRfiDetail = List.from(json['salesManagmentRfiDetail'])
        .map((e) => SalesManagmentRfiDetail.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['salesManagmentRfiDetail'] =
        salesManagmentRfiDetail.map((e) => e.toJson()).toList();
    return _data;
  }
}

class SalesManagmentRfiDetail {
  SalesManagmentRfiDetail({
    required this.id,
    required this.productId,
    required this.serviceId,
    required this.userId,
    required this.buyerId,
    required this.network,
    required this.requestType,
    required this.networkId,
    required this.requestFor,
    required this.details,
    required this.title,
    required this.unit,
    required this.deliveryDate,
    required this.startDate,
    required this.endDate,
    required this.paymentMode,
    required this.shippingMode,
    required this.attachment,
    required this.status,
    required this.buyer,
  });
  int? id;
  int? productId;
  int? serviceId;
  int? userId;
  int? buyerId;
  String? network;
  String? requestType;
  String? networkId;
  String? requestFor;
  String? details;

  String? title;
  String? unit;
  String? deliveryDate;

  String? startDate;
  String? endDate;
  String? paymentMode;
  String? shippingMode;

  String? attachment;
  String? status;

  Buyer? buyer;

  SalesManagmentRfiDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    serviceId = json['service_id'];
    userId = json['user_id'];
    buyerId = json['buyer_id'];
    network = json['network'];
    requestType = json['request_type'];
    networkId = json['network_id'];
    requestFor = json['request_for'];
    details = json['details'];

    title = json['title'];
    unit = json['unit'];
    deliveryDate = json['delivery_date'];

    startDate = json['start_date'];
    endDate = json['end_date'];
    paymentMode = json['payment_mode'];
    shippingMode = json['shipping_mode'];

    attachment = json['attachment'];
    status = json['status'];

    buyer = Buyer.fromJson(json['buyer']);
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
    _data['network_id'] = networkId;
    _data['request_for'] = requestFor;
    _data['details'] = details;

    _data['title'] = title;
    _data['unit'] = unit;
    _data['delivery_date'] = deliveryDate;

    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['payment_mode'] = paymentMode;
    _data['shipping_mode'] = shippingMode;

    _data['attachment'] = attachment;
    _data['status'] = status;

    _data['buyer'] = buyer!.toJson();
    return _data;
  }
}
