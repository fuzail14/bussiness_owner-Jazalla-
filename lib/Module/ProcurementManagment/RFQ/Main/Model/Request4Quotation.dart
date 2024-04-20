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
    final data = <String, dynamic>{};
    data['success'] = success;
    data['RequestForQuotation'] =
        requestForQuotation.map((e) => e.toJson()).toList();
    return data;
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['supplier_network'] = supplierNetwork;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['buyer_id'] = buyerId;
    data['supplier_id'] = supplierId;
    data['details'] = details;
    data['quantity'] = quantity;
    data['product_nature'] = productNature;
    data['title'] = title;
    data['unit'] = unit;
    data['delivery_date'] = deliveryDate;

    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['payment_mode'] = paymentMode;
    data['shipping_mode'] = shippingMode;
    data['shipping_address'] = shippingAddress;
    data['address'] = address;
    data['template_id'] = templateId;

    data['status'] = status;

    return data;
  }
}
