class ServiceDetail {
  ServiceDetail({
    required this.success,
    required this.servicedetail,
  });
  late final bool success;
  late final List<Servicedetail> servicedetail;

  ServiceDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    servicedetail = List.from(json['servicedetail'])
        .map((e) => Servicedetail.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['servicedetail'] = servicedetail.map((e) => e.toJson()).toList();
    return data;
  }
}

class Servicedetail {
  Servicedetail({
    required this.id,
    required this.companyId,
    required this.name,
    required this.manufacturer,
    required this.manufacturerPartNo,
    required this.description,
    required this.termsAndConditions,
    required this.status,
    required this.code,
    required this.alertQuantity,
    required this.quantity,
    required this.pDetails,
    required this.taxRate,
    required this.hide,
    required this.barcodeSymbology,
    required this.taxMethod,
    required this.family,
    required this.commodity,
    required this.inventoryInfo,
    required this.segment,
    required this.classObj,
    required this.createdAt,
    required this.updatedAt,
    required this.productType,
    required this.specification,
    required this.warranty,
    required this.refundPolicy,
    required this.promotion,
    required this.priceVisibility,
    required this.nationalProduct,
    required this.productNature,
    required this.minQty,
    required this.salePrice,
    required this.purchasePrice,
    required this.unit,
    required this.unitPrice,
    required this.maxPrice,
    required this.minPrice,
    required this.vat,
    required this.paymentMode,
    required this.videoPath,
    required this.videoName,
    required this.documentPath,
    required this.documentName,
    required this.modelNo,
    required this.brandId,
    required this.packageId,
    required this.skuCode,
    required this.serviceCharge,
    required this.noServiceBooked,
    required this.serviceType,
    required this.price,
    required this.priceUnit,
    required this.otherPriceunit,
    required this.priceTax,
    required this.serviceDurationtime,
    required this.durationTimeunit,
    required this.otherDurationunit,
    required this.advancePayment,
    required this.paymentDistribution,
    required this.fav,
    required this.company,
    required this.unspscCommodity,
    required this.photos,
  });
  int? id;
  int? companyId;
  String? name;
  String? manufacturer;
  String? manufacturerPartNo;
  String? description;
  String? termsAndConditions;
  String? status;
  String? code;
  String? alertQuantity;
  String? quantity;
  String? pDetails;
  String? taxRate;
  int? hide;
  String? barcodeSymbology;
  int? taxMethod;
  int? family;
  int? commodity;
  String? inventoryInfo;
  int? segment;
  int? classObj;
  String? createdAt;
  String? updatedAt;

  String? productType;
  String? specification;
  String? warranty;
  String? refundPolicy;
  String? promotion;
  String? priceVisibility;
  String? nationalProduct;
  String? productNature;
  String? minQty;
  String? salePrice;
  String? purchasePrice;
  String? unit;
  String? unitPrice;
  String? maxPrice;
  String? minPrice;
  String? vat;
  String? paymentMode;
  String? videoPath;
  String? videoName;
  String? documentPath;
  String? documentName;
  String? modelNo;
  int? brandId;
  int? packageId;
  String? skuCode;
  String? serviceCharge;
  String? noServiceBooked;
  String? serviceType;
  int? price;
  String? priceUnit;
  String? otherPriceunit;
  int? priceTax;
  int? serviceDurationtime;
  String? durationTimeunit;
  String? otherDurationunit;
  int? advancePayment;
  String? paymentDistribution;
  int? fav;
  Company? company;
  UnspscCommodity? unspscCommodity;
  List<Photos>? photos;

  Servicedetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    manufacturer = json['manufacturer'];
    manufacturerPartNo = json['manufacturer_part_no'];
    description = json['description'];
    termsAndConditions = json['terms_and_conditions'];
    status = json['status'];
    code = json['code'];
    alertQuantity = json['alert_quantity'];
    quantity = json['quantity'];
    pDetails = json['p_details'];
    taxRate = json['tax_rate'];
    hide = json['hide'];
    barcodeSymbology = json['barcode_symbology'];
    taxMethod = json['tax_method'];
    family = json['family'];
    commodity = json['commodity'];
    inventoryInfo = json['inventory_info'];
    segment = json['segment'];
    classObj = json['class'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    productType = json['product_type'];
    specification = json['specification'];
    warranty = json['warranty'];
    refundPolicy = json['refund_policy'];
    promotion = json['promotion'];
    priceVisibility = json['price_visibility'];
    nationalProduct = json['national_product'];
    productNature = json['product_nature'];
    minQty = json['min_qty'];
    salePrice = json['sale_price'];
    purchasePrice = json['purchase_price'];
    unit = json['unit'];
    unitPrice = json['unit_price'];
    maxPrice = json['max_price'];
    minPrice = json['min_price'];
    vat = json['vat'];
    paymentMode = json['payment_mode'];
    videoPath = json['video_path'];
    videoName = json['video_name'];
    documentPath = json['document_path'];
    documentName = json['document_name'];
    modelNo = json['model_no'];
    brandId = json['brand_id'];
    packageId = json['package_id'];
    skuCode = json['sku_code'];
    serviceCharge = json['service_charge'];
    noServiceBooked = json['no_service_booked'];
    serviceType = json['service_type'];
    price = json['price'];
    priceUnit = json['price_unit'];
    otherPriceunit = json['other_priceunit'];
    priceTax = json['price_tax'];
    serviceDurationtime = json['service_durationtime'];
    durationTimeunit = json['duration_timeunit'];
    otherDurationunit = json['other_durationunit'];
    advancePayment = json['advance_payment'];
    paymentDistribution = json['payment_distribution'];
    fav = json['fav'];
    // company = Company.fromJson(json['company']);
    // unspscCommodity = UnspscCommodity.fromJson(json['unspsc_commodity']);
    // photos = List.from(json['photos']).map((e) => Photos.fromJson(e)).toList();

    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
    unspscCommodity = json['unspsc_commodity'] != null
        ? UnspscCommodity.fromJson(json['unspsc_commodity'])
        : null;
    photos = json['photos'] != null
        ? List<Photos>.from(json['photos'].map((x) => Photos.fromJson(x)))
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['name'] = name;
    data['manufacturer'] = manufacturer;
    data['manufacturer_part_no'] = manufacturerPartNo;
    data['description'] = description;
    data['terms_and_conditions'] = termsAndConditions;
    data['status'] = status;
    data['code'] = code;
    data['alert_quantity'] = alertQuantity;
    data['quantity'] = quantity;
    data['p_details'] = pDetails;
    data['tax_rate'] = taxRate;
    data['hide'] = hide;
    data['barcode_symbology'] = barcodeSymbology;
    data['tax_method'] = taxMethod;
    data['family'] = family;
    data['commodity'] = commodity;
    data['inventory_info'] = inventoryInfo;
    data['segment'] = segment;
    data['class'] = classObj;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    data['product_type'] = productType;
    data['specification'] = specification;
    data['warranty'] = warranty;
    data['refund_policy'] = refundPolicy;
    data['promotion'] = promotion;
    data['price_visibility'] = priceVisibility;
    data['national_product'] = nationalProduct;
    data['product_nature'] = productNature;
    data['min_qty'] = minQty;
    data['sale_price'] = salePrice;
    data['purchase_price'] = purchasePrice;
    data['unit'] = unit;
    data['unit_price'] = unitPrice;
    data['max_price'] = maxPrice;
    data['min_price'] = minPrice;
    data['vat'] = vat;
    data['payment_mode'] = paymentMode;
    data['video_path'] = videoPath;
    data['video_name'] = videoName;
    data['document_path'] = documentPath;
    data['document_name'] = documentName;
    data['model_no'] = modelNo;
    data['brand_id'] = brandId;
    data['package_id'] = packageId;
    data['sku_code'] = skuCode;
    data['service_charge'] = serviceCharge;
    data['no_service_booked'] = noServiceBooked;
    data['service_type'] = serviceType;
    data['price'] = price;
    data['price_unit'] = priceUnit;
    data['other_priceunit'] = otherPriceunit;
    data['price_tax'] = priceTax;
    data['service_durationtime'] = serviceDurationtime;
    data['duration_timeunit'] = durationTimeunit;
    data['other_durationunit'] = otherDurationunit;
    data['advance_payment'] = advancePayment;
    data['payment_distribution'] = paymentDistribution;
    data['fav'] = fav;
    data['company'] = company!.toJson();
    data['unspsc_commodity'] = unspscCommodity!.toJson();
    data['photos'] = photos!.map((e) => e.toJson()).toList();

    return data;
  }
}

class Company {
  Company({
    required this.id,
    required this.companyCode,
    required this.companyName,
    required this.arCompanyName,
    required this.businessType,
    required this.description,
    required this.website,
    required this.countryCode,
    required this.mobileNo,
    required this.phone,
    required this.fax,
    required this.email,
    required this.zipCode,
    required this.street,
    required this.logo,
    required this.logoPath,
    required this.contactPersonName,
    required this.designation,
    required this.primaryActivity,
    required this.industry,
    required this.vatNo,
    required this.vatPercentage,
    required this.isVerified,
    required this.isPublic,
    required this.isBranch,
    required this.isDepartment,
    required this.registrationNo,
    required this.registrationDate,
    required this.facebookLink,
    required this.linkedinLink,
    required this.twitterLink,
    required this.companySectorId,
    required this.legalStatusId,
    required this.status,
    required this.createdBy,
    required this.invitedId,
    required this.currencyId,
    required this.timezoneId,
    required this.languageId,
    required this.createdAt,
    required this.updatedAt,
    required this.verificationLink,
    required this.otp,
    required this.mainSegmentP,
    required this.familyP,
    required this.classP,
    required this.commodityP,
    required this.mainSegmentS,
    required this.familyS,
    required this.classS,
    required this.commodityS,
    required this.isProfileEnabled,
    required this.isic4Main,
    required this.isic4Category,
    required this.activity,
    required this.subscriptionId,
    required this.network,
    required this.registrationRequirement,
    required this.govtRequirement,
    required this.companyRequirement,
    required this.attachedFile,
  });
  int? id;
  String? companyCode;
  String? companyName;
  String? arCompanyName;
  String? businessType;
  String? description;
  String? website;
  String? countryCode;
  String? mobileNo;
  String? phone;
  String? fax;
  String? email;
  int? zipCode;
  String? street;
  String? logo;
  String? logoPath;
  String? contactPersonName;
  String? designation;
  String? primaryActivity;
  int? industry;
  int? vatNo;
  String? vatPercentage;
  int? isVerified;
  int? isPublic;
  int? isBranch;
  int? isDepartment;
  String? registrationNo;
  String? registrationDate;
  String? facebookLink;
  String? linkedinLink;
  String? twitterLink;
  int? companySectorId;
  int? legalStatusId;
  String? status;
  int? createdBy;
  int? invitedId;
  int? currencyId;
  int? timezoneId;
  int? languageId;
  String? createdAt;
  String? updatedAt;

  String? verificationLink;
  String? otp;
  int? mainSegmentP;
  int? familyP;
  int? classP;
  String? commodityP;
  int? mainSegmentS;
  int? familyS;
  int? classS;
  String? commodityS;
  String? isProfileEnabled;
  int? isic4Main;
  int? isic4Category;
  String? activity;
  int? subscriptionId;
  String? network;
  String? registrationRequirement;
  String? govtRequirement;
  String? companyRequirement;
  String? attachedFile;

  Company.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    companyCode = json['company_code'];
    companyName = json['company_name'];
    arCompanyName = json['ar_company_name'];
    businessType = json['business_type'];
    description = json['description'];
    website = json['website'];
    countryCode = json['country_code'];
    mobileNo = json['mobile_no'];
    phone = json['phone'];
    fax = json['fax'];
    email = json['email'];
    zipCode = json['zip_code'];
    street = json['street'];
    logo = json['logo'];
    logoPath = json['logo_path'];
    contactPersonName = json['contact_person_name'];
    designation = json['designation'];
    primaryActivity = json['primary_activity'];
    industry = json['industry'];
    vatNo = json['vat_no'];
    vatPercentage = json['vat_percentage'];
    isVerified = json['is_verified'];
    isPublic = json['is_public'];
    isBranch = json['is_branch'];
    isDepartment = json['is_department'];
    registrationNo = json['registration_no'];
    registrationDate = json['registration_date'];
    facebookLink = json['facebook_link'];
    linkedinLink = json['linkedin_link'];
    twitterLink = json['twitter_link'];
    companySectorId = json['company_sector_id'];
    legalStatusId = json['legal_status_id'];
    status = json['status'];
    createdBy = json['created_by'];
    invitedId = json['invited_id'];
    currencyId = json['currency_id'];
    timezoneId = json['timezone_id'];
    languageId = json['language_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    verificationLink = json['verification_link'];
    otp = json['otp'];
    mainSegmentP = json['main_segment_p'];
    familyP = json['family_p'];
    classP = json['class_p'];
    commodityP = json['commodity_p'];
    mainSegmentS = json['main_segment_s'];
    familyS = json['family_s'];
    classS = json['class_s'];
    commodityS = json['commodity_s'];
    isProfileEnabled = json['isProfileEnabled'];
    isic4Main = json['isic4_main'];
    isic4Category = json['isic4_category'];
    activity = json['activity'];
    subscriptionId = json['subscription_id'];
    network = json['network'];
    registrationRequirement = json['registration_requirement'];
    govtRequirement = json['govt_requirement'];
    companyRequirement = json['company_requirement'];
    attachedFile = json['attached_file'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company_code'] = companyCode;
    data['company_name'] = companyName;
    data['ar_company_name'] = arCompanyName;
    data['business_type'] = businessType;
    data['description'] = description;
    data['website'] = website;
    data['country_code'] = countryCode;
    data['mobile_no'] = mobileNo;
    data['phone'] = phone;
    data['fax'] = fax;
    data['email'] = email;
    data['zip_code'] = zipCode;
    data['street'] = street;
    data['logo'] = logo;
    data['logo_path'] = logoPath;
    data['contact_person_name'] = contactPersonName;
    data['designation'] = designation;
    data['primary_activity'] = primaryActivity;
    data['industry'] = industry;
    data['vat_no'] = vatNo;
    data['vat_percentage'] = vatPercentage;
    data['is_verified'] = isVerified;
    data['is_public'] = isPublic;
    data['is_branch'] = isBranch;
    data['is_department'] = isDepartment;
    data['registration_no'] = registrationNo;
    data['registration_date'] = registrationDate;
    data['facebook_link'] = facebookLink;
    data['linkedin_link'] = linkedinLink;
    data['twitter_link'] = twitterLink;
    data['company_sector_id'] = companySectorId;
    data['legal_status_id'] = legalStatusId;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['invited_id'] = invitedId;
    data['currency_id'] = currencyId;
    data['timezone_id'] = timezoneId;
    data['language_id'] = languageId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    data['verification_link'] = verificationLink;
    data['otp'] = otp;
    data['main_segment_p'] = mainSegmentP;
    data['family_p'] = familyP;
    data['class_p'] = classP;
    data['commodity_p'] = commodityP;
    data['main_segment_s'] = mainSegmentS;
    data['family_s'] = familyS;
    data['class_s'] = classS;
    data['commodity_s'] = commodityS;
    data['isProfileEnabled'] = isProfileEnabled;
    data['isic4_main'] = isic4Main;
    data['isic4_category'] = isic4Category;
    data['activity'] = activity;
    data['subscription_id'] = subscriptionId;
    data['network'] = network;
    data['registration_requirement'] = registrationRequirement;
    data['govt_requirement'] = govtRequirement;
    data['company_requirement'] = companyRequirement;
    data['attached_file'] = attachedFile;
    return data;
  }
}

class UnspscCommodity {
  UnspscCommodity({
    required this.id,
    required this.commodityName,
    required this.commodityCode,
    required this.unspscSegmentId,
    required this.unspscFamilyId,
    required this.unspscClassId,
    required this.unspscType,
    required this.createdAt,
  });
  int? id;
  String? commodityName;
  String? commodityCode;
  String? unspscSegmentId;
  String? unspscFamilyId;
  String? unspscClassId;
  String? unspscType;
  String? createdAt;

  UnspscCommodity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commodityName = json['commodity_name'];
    commodityCode = json['commodity_code'];
    unspscSegmentId = json['unspsc_segment_id'];
    unspscFamilyId = json['unspsc_family_id'];
    unspscClassId = json['unspsc_class_id'];
    unspscType = json['unspsc_type'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['commodity_name'] = commodityName;
    data['commodity_code'] = commodityCode;
    data['unspsc_segment_id'] = unspscSegmentId;
    data['unspsc_family_id'] = unspscFamilyId;
    data['unspsc_class_id'] = unspscClassId;
    data['unspsc_type'] = unspscType;
    data['created_at'] = createdAt;

    return data;
  }
}

class Photos {
  Photos({
    required this.id,
    required this.serviceId,
    required this.imagePath,
    required this.imageName,
    required this.imageType,
    required this.updatedAt,
    required this.status,
  });
  int? id;
  int? serviceId;
  String? imagePath;
  String? imageName;
  String? imageType;

  String? updatedAt;

  String? status;

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['service_id'];
    imagePath = json['image_path'];
    imageName = json['image_name'];
    imageType = json['image_type'];

    updatedAt = json['updated_at'];

    status = json['status'];
  }

  Map<String?, dynamic> toJson() {
    final data = <String?, dynamic>{};
    data['id'] = id;
    data['service_id'] = serviceId;
    data['image_path'] = imagePath;
    data['image_name'] = imageName;
    data['image_type'] = imageType;

    data['updated_at'] = updatedAt;

    data['status'] = status;

    return data;
  }
}
