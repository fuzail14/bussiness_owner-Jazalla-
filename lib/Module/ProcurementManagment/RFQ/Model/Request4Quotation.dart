class Request4Quotation {
  Request4Quotation({
    required this.success,
    required this.requestForQuotation,
  });
  late final bool success;
  late final List<RequestForQuotation> requestForQuotation;

  Request4Quotation.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    requestForQuotation = List.from(json['RequestForQuotation'])
        .map((e) => RequestForQuotation.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['RequestForQuotation'] =
        requestForQuotation.map((e) => e.toJson()).toList();
    return _data;
  }
}

class RequestForQuotation {
  RequestForQuotation({
    required this.id,
    required this.supplierNetwork,
    required this.productId,
    required this.userId,
    required this.buyerId,
    required this.supplierId,
    required this.details,
    required this.quantity,
    this.productNature,
    required this.title,
    required this.unit,
    required this.deliveryDate,
    this.startDate,
    this.endDate,
    required this.paymentMode,
    required this.shippingMode,
    required this.shippingAddress,
    required this.address,
    required this.templateId,
    required this.status,
  });
  int? id;
  String? supplierNetwork;
  int? productId;
  int? userId;
  int? buyerId;
  int? supplierId;
  String? details;
  int? quantity;
  Null productNature;
  String? title;
  String? unit;
  String? deliveryDate;

  String? startDate;
  String? endDate;
  String? paymentMode;
  String? shippingMode;
  String? shippingAddress;
  String? address;
  int? templateId;

  String? status;

  RequestForQuotation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplierNetwork = json['supplier_network'];
    productId = json['product_id'];
    userId = json['user_id'];
    buyerId = json['buyer_id'];
    supplierId = json['supplier_id'];
    details = json['details'];
    quantity = json['quantity'];
    productNature = null;
    title = json['title'];
    unit = json['unit'];
    deliveryDate = json['delivery_date'];

    startDate = json['start_date'];
    endDate = json['end_date'];
    paymentMode = json['payment_mode'];
    shippingMode = json['shipping_mode'];
    shippingAddress = json['shipping_address'];
    address = json['address'];
    templateId = json['template_id'];

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['supplier_network'] = supplierNetwork;
    _data['product_id'] = productId;
    _data['user_id'] = userId;
    _data['buyer_id'] = buyerId;
    _data['supplier_id'] = supplierId;
    _data['details'] = details;
    _data['quantity'] = quantity;
    _data['product_nature'] = productNature;
    _data['title'] = title;
    _data['unit'] = unit;
    _data['delivery_date'] = deliveryDate;

    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['payment_mode'] = paymentMode;
    _data['shipping_mode'] = shippingMode;
    _data['shipping_address'] = shippingAddress;
    _data['address'] = address;
    _data['template_id'] = templateId;

    _data['status'] = status;

    return _data;
  }
}
