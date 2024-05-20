class IndividualInvoiceDetail {
  IndividualInvoiceDetail({
    required this.success,
    required this.invoicedetail,
  });
  late final bool success;
  late final Invoicedetail invoicedetail;

  IndividualInvoiceDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    invoicedetail = Invoicedetail.fromJson(json['invoicedetail']);
  }
}

class Invoicedetail {
  Invoicedetail({
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
    required this.company,
    required this.vendor,
    required this.payments,
    required this.purchase,
  });
  int? id;
  int? invoiceId;
  int? venderId;
  int? purchaseId;
  int? customerId;
  String? issueDate;
  String? dueDate;
  String? sendDate;
  int? categoryId;
  String? refNumber;
  int? status;
  int? shippingDisplay;
  int? discountApply;
  int? createdBy;

  Company? company;
  Vendor? vendor;
  List<Payments>? payments;
  Purchase? purchase;

  Invoicedetail.fromJson(Map<String, dynamic> json) {
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

    company = Company.fromJson(json['company']);
    vendor = Vendor.fromJson(json['vendor']);
    payments =
        List.from(json['payments']).map((e) => Payments.fromJson(e)).toList();
    purchase = Purchase.fromJson(json['purchase']);
  }
}

class Company {
  Company({
    required this.id,
    required this.companyName,
    required this.mobileNo,
    required this.address,
  });
  int? id;
  String? companyName;
  String? mobileNo;
  Address? address;

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    mobileNo = json['mobile_no'];
    address = Address.fromJson(json['address']);
  }
}

class Address {
  Address({
    required this.id,
    required this.addressId,
    required this.address,
  });
  int? id;
  int? addressId;
  String? address;

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressId = json['address_id'];
    address = json['address'];
  }
}

class Vendor {
  Vendor({
    required this.id,
    required this.companyName,
    required this.mobileNo,
    required this.address,
  });
  int? id;
  String? companyName;
  String? mobileNo;
  Address? address;

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    mobileNo = json['mobile_no'];

    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
  }
}

class Payments {
  Payments({
    required this.id,
    required this.invoiceId,
    required this.date,
    required this.amount,
    required this.accountId,
    required this.paymentMethod,
    this.orderId,
    this.currency,
    this.txnId,
    required this.paymentType,
    this.receipt,
    this.addReceipt,
    this.reference,
    this.description,
  });
  int? id;
  int? invoiceId;
  String? date;
  String? amount;
  int? accountId;
  int? paymentMethod;
  int? orderId;
  String? currency;
  int? txnId;
  String? paymentType;
  String? receipt;
  String? addReceipt;
  String? reference;
  String? description;

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceId = json['invoice_id'];
    date = json['date'];
    amount = json['amount'];
    accountId = json['account_id'];
    paymentMethod = json['payment_method'];
    orderId = null;
    currency = null;
    txnId = null;
    paymentType = json['payment_type'];
    receipt = null;
    addReceipt = null;
    reference = null;
    description = null;
  }
}

class Purchase {
  Purchase({
    required this.id,
    required this.purchaseId,
    required this.companyId,
    required this.supplierNetwork,
    required this.venderId,
    required this.warehouseId,
    required this.purchaseDate,
    required this.orderDate,
    required this.deliveryDate,
    required this.purchaseNumber,
    this.shippingMode,
    required this.note,
    required this.status,
    this.address,
    this.attachment,
    required this.shippingDisplay,
    required this.sendDate,
    required this.discountApply,
    required this.totalAmount,
    required this.categoryId,
    required this.invoiceReceived,
    required this.acceptedAt,
    this.rejectReason,
    this.rejectedAt,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });
  late final int id;
  late final String purchaseId;
  late final int companyId;
  late final String supplierNetwork;
  late final int venderId;
  late final int warehouseId;
  late final String purchaseDate;
  late final String orderDate;
  late final String deliveryDate;
  late final String purchaseNumber;
  late final Null shippingMode;
  late final String note;
  late final int status;
  late final Null address;
  late final Null attachment;
  late final int shippingDisplay;
  late final String sendDate;
  late final int discountApply;
  late final String totalAmount;
  late final int categoryId;
  late final String invoiceReceived;
  late final String acceptedAt;
  late final Null rejectReason;
  late final Null rejectedAt;
  late final int createdBy;
  late final String createdAt;
  late final String updatedAt;
  late final List<Items> items;

  Purchase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purchaseId = json['purchase_id'];
    companyId = json['company_id'];
    supplierNetwork = json['supplier_network'];
    venderId = json['vender_id'];
    warehouseId = json['warehouse_id'];
    purchaseDate = json['purchase_date'];
    orderDate = json['order_date'];
    deliveryDate = json['delivery_date'];
    purchaseNumber = json['purchase_number'];
    shippingMode = null;
    note = json['note'];
    status = json['status'];
    address = null;
    attachment = null;
    shippingDisplay = json['shipping_display'];
    sendDate = json['send_date'];
    discountApply = json['discount_apply'];
    totalAmount = json['total_amount'];
    categoryId = json['category_id'];
    invoiceReceived = json['invoice_received'];
    acceptedAt = json['accepted_at'];
    rejectReason = null;
    rejectedAt = null;
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
  }
}

class Items {
  Items({
    required this.id,
    required this.purchaseId,
    required this.productId,
    required this.quantity,
    required this.tax,
    required this.discount,
    required this.price,
    required this.description,
    this.createdAt,
    this.updatedAt,
    required this.product2,
  });
  late final int id;
  late final int purchaseId;
  late final int productId;
  late final int quantity;
  late final String tax;
  late final int discount;
  late final String price;
  late final String description;
  late final Null createdAt;
  late final Null updatedAt;
  late final Product2 product2;

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purchaseId = json['purchase_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    tax = json['tax'];
    discount = json['discount'];
    price = json['price'];
    description = json['description'];
    createdAt = null;
    updatedAt = null;
    product2 = Product2.fromJson(json['product2']);
  }
}

class Product2 {
  Product2({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Product2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}
