class ProductWithTemplate {
  ProductWithTemplate({
    required this.success,
    required this.productDetailForQuotation,
    required this.quotationTemplate,
  });
  late final bool success;
  late final ProductDetailForQuotation productDetailForQuotation;
  late final List<QuotationTemplate> quotationTemplate;

  ProductWithTemplate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    productDetailForQuotation =
        ProductDetailForQuotation.fromJson(json['productDetailForQuotation']);
    quotationTemplate = List.from(json['quotationTemplate'])
        .map((e) => QuotationTemplate.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['productDetailForQuotation'] = productDetailForQuotation.toJson();
    data['quotationTemplate'] =
        quotationTemplate.map((e) => e.toJson()).toList();
    return data;
  }
}

class ProductDetailForQuotation {
  ProductDetailForQuotation({
    required this.id,
    required this.companyId,
    required this.name,
    required this.minQty,
    required this.unit,
    required this.paymentMode,
  });
  int? id;
  int? companyId;
  String? name;
  String? minQty;
  String? unit;
  String? paymentMode;

  ProductDetailForQuotation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    minQty = json['min_qty'];
    unit = json['unit'];
    paymentMode = json['payment_mode'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['name'] = name;
    data['min_qty'] = minQty;
    data['unit'] = unit;
    data['payment_mode'] = paymentMode;
    return data;
  }
}

class QuotationTemplate {
  QuotationTemplate({
    required this.id,
    required this.companyId,
    required this.title,
    required this.requestType,
    required this.content,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });
  int? id;
  int? companyId;
  String? title;
  String? requestType;
  String? content;
  String? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  QuotationTemplate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    title = json['title'];
    requestType = json['request_type'];
    content = json['content'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['title'] = title;
    data['request_type'] = requestType;
    data['content'] = content;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
