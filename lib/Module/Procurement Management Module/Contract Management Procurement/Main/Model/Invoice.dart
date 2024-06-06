class Invoice {
  Invoice({
    required this.success,
    required this.invoices,
  });
  late final bool success;
  late final List<Invoices> invoices;

  Invoice.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    invoices =
        List.from(json['invoices']).map((e) => Invoices.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['invoices'] = invoices.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Invoices {
  Invoices({
    required this.id,
    required this.invoiceId,
    required this.venderId,
    required this.purchaseId,
    required this.customerId,
    required this.issueDate,
    required this.dueDate,
    required this.sendDate,
    required this.categoryId,
    required this.refNumber,
    required this.status,
    required this.shippingDisplay,
    required this.discountApply,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.dueAmount,
  });
  late final int id;
  late final int invoiceId;
  late final int venderId;
  late final int purchaseId;
  late final int customerId;
  late final String issueDate;
  late final String dueDate;
  late final String sendDate;
  late final int categoryId;
  late final String refNumber;
  late final int status;
  late final int shippingDisplay;
  late final int discountApply;
  late final int createdBy;
  late final String createdAt;
  late final String updatedAt;
  var dueAmount;

  Invoices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceId = json['invoice_id'];
    venderId = json['vender_id'];
    purchaseId = json['purchase_id'];
    customerId = json['customer_id'];
    issueDate = json['issue_date'];
    dueDate = json['due_date'];
    sendDate = json['send_date'];
    categoryId = json['category_id'];
    refNumber = json['ref_number'];
    status = json['status'];
    shippingDisplay = json['shipping_display'];
    discountApply = json['discount_apply'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    dueAmount = json['due_amount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['invoice_id'] = invoiceId;
    _data['vender_id'] = venderId;
    _data['purchase_id'] = purchaseId;
    _data['customer_id'] = customerId;
    _data['issue_date'] = issueDate;
    _data['due_date'] = dueDate;
    _data['send_date'] = sendDate;
    _data['category_id'] = categoryId;
    _data['ref_number'] = refNumber;
    _data['status'] = status;
    _data['shipping_display'] = shippingDisplay;
    _data['discount_apply'] = discountApply;
    _data['created_by'] = createdBy;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['due_amount'] = dueAmount;
    return _data;
  }
}
