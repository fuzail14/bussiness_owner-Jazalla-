import '../../../../../Constants/Global/Model/Buyer.dart';

class RequestForQuotationDetail {
  RequestForQuotationDetail({
    required this.success,
    required this.rfqDetail,
  });
  late final bool success;
  late final List<RfqDetail> rfqDetail;

  RequestForQuotationDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    rfqDetail =
        List.from(json['rfqDetail']).map((e) => RfqDetail.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['rfqDetail'] = rfqDetail.map((e) => e.toJson()).toList();
    return _data;
  }
}

class RfqDetail {
  RfqDetail({
    required this.id,
    required this.supplierNetwork,
    required this.productId,
    required this.userId,
    required this.buyerId,
    required this.supplierId,
    required this.details,
    required this.quantity,
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
    required this.attachment,
    required this.status,
    required this.buyer,
  });
  int? id;
  String? supplierNetwork;
  int? productId;
  int? userId;
  int? buyerId;
  int? supplierId;
  String? details;
  int? quantity;
  String? startDate;
  String? endDate;
  String? title;

  String? unit;
  String? deliveryDate;
  String? paymentMode;
  String? shippingMode;
  String? shippingAddress;
  String? address;
  int? templateId;
  String? attachment;
  String? status;
  Buyer? buyer;

  RfqDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supplierNetwork = json['supplier_network'];
    productId = json['product_id'];
    userId = json['user_id'];
    buyerId = json['buyer_id'];
    supplierId = json['supplier_id'];
    details = json['details'];
    quantity = json['quantity'];
    title = json['title'];
    unit = json['unit'];
    deliveryDate = json['delivery_date'];
    paymentMode = json['payment_mode'];
    shippingMode = json['shipping_mode'];
    shippingAddress = json['shipping_address'];
    address = json['address'];
    templateId = json['template_id'];
    attachment = json['attachment'];
    status = json['status'];
    buyer = Buyer.fromJson(json['buyer']);
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
    _data['title'] = title;
    _data['unit'] = unit;
    _data['delivery_date'] = deliveryDate;
    _data['payment_mode'] = paymentMode;
    _data['shipping_mode'] = shippingMode;
    _data['shipping_address'] = shippingAddress;
    _data['address'] = address;
    _data['template_id'] = templateId;
    _data['attachment'] = attachment;
    _data['status'] = status;
    _data['buyer'] = buyer!.toJson();
    return _data;
  }
}
