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
    this.serviceType,
    this.scopeOfWork,
    this.startDate,
    this.endDate,
    required this.paymentMode,
    required this.shippingMode,
    required this.shippingAddress,
    required this.address,
    required this.templateId,
    this.attachment,
    required this.status,
    this.localContentTarget,
    this.remark,
    this.attachmentOption,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String supplierNetwork;
  late final int productId;
  late final int userId;
  late final int buyerId;
  late final int supplierId;
  late final String details;
  late final int quantity;
  late final Null productNature;
  late final String title;
  late final String unit;
  late final String deliveryDate;
  late final Null serviceType;
  late final Null scopeOfWork;
  late final Null startDate;
  late final Null endDate;
  late final String paymentMode;
  late final String shippingMode;
  late final String shippingAddress;
  late final String address;
  late final int templateId;
  late final Null attachment;
  late final String status;
  late final Null localContentTarget;
  late final Null remark;
  late final Null attachmentOption;
  late final String createdAt;
  late final String updatedAt;

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
    serviceType = null;
    scopeOfWork = null;
    startDate = null;
    endDate = null;
    paymentMode = json['payment_mode'];
    shippingMode = json['shipping_mode'];
    shippingAddress = json['shipping_address'];
    address = json['address'];
    templateId = json['template_id'];
    attachment = null;
    status = json['status'];
    localContentTarget = null;
    remark = null;
    attachmentOption = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    _data['service_type'] = serviceType;
    _data['scope_of_work'] = scopeOfWork;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['payment_mode'] = paymentMode;
    _data['shipping_mode'] = shippingMode;
    _data['shipping_address'] = shippingAddress;
    _data['address'] = address;
    _data['template_id'] = templateId;
    _data['attachment'] = attachment;
    _data['status'] = status;
    _data['local_content_target'] = localContentTarget;
    _data['remark'] = remark;
    _data['attachment_option'] = attachmentOption;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
