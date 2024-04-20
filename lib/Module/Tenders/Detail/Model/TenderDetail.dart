class TenderDetail {
  TenderDetail({
    required this.success,
    required this.tenderdetail,
  });
  bool? success;
  List<Tenderdetail>? tenderdetail;

  TenderDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    tenderdetail = List.from(json['tenderdetail'])
        .map((e) => Tenderdetail.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['tenderdetail'] = tenderdetail!.map((e) => e.toJson()).toList();
    return data;
  }
}

class Tenderdetail {
  Tenderdetail({
    required this.id,
    required this.companyId,
    required this.menuType,
    required this.isPackage,
    required this.title,
    required this.type,
    required this.endDate,
    required this.endTime,
    required this.promotion,
    required this.emailshow,
    required this.phoneshow,
    required this.budget,
    required this.isPromot,
    required this.businessOverview,
    required this.facilitiesOverview,
    required this.prodnservOverview,
    required this.reasonforsale,
    required this.industryPreference,
    required this.locationPreference,
    required this.assets,
    required this.monthlySale,
    required this.monthlySaleCurrency,
    required this.reportedSales,
    required this.reportedSaleCurrency,
    required this.targetSellingPrice,
    required this.targetSellingPriceCurrency,
    required this.physicalAssetsValue,
    required this.physicalAssetsValueCurrency,
    required this.isic4Main,
    required this.isic4Category,
    required this.isic4Activity,
    required this.govtRequirement,
    required this.companyRequirement,
    required this.image,
    required this.attachment,
    required this.shortDesc,
    required this.categoryLevel1,
    required this.categoryLevel2,
    required this.categoryLevel3,
    required this.tenderType,
    required this.segment,
    required this.family,
    required this.classObj,
    required this.commodity,
    required this.paymentMode,
    required this.unit,
    required this.quantity,
    required this.shippingMode,
    required this.requestType,
    required this.localContentTarget,
    required this.agreementPeriod,
    required this.agreementStartDate,
    required this.deliveryStartDate,
    required this.deliveryEndDate,
    required this.locationType,
    required this.country,
    required this.state,
    required this.district,
    required this.streetName,
    required this.zipCode,
    required this.buildingNo,
    required this.unitNo,
    required this.city,
    required this.professionalSummary,
    required this.investmentClito,
    required this.investmentSize,
    required this.transactionReference,
    required this.financialInvestment,
    required this.runRateSales,
    required this.ebitdaMargin,
    required this.established,
    required this.employeeCapacity,
    required this.legalEntry,
    required this.industries,
    required this.qualifiedSectors,
    required this.description,
    required this.scopeOfWork,
    required this.requiredDocuments,
    required this.advancePayment,
    required this.paymentDistribution,
    required this.contractStartDate,
    required this.contractEndDate,
    required this.listedBy,
    required this.longDesc,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.localTime,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedBy,
    required this.approval,
    required this.approvedAt,
    required this.commodities,
    required this.qualifiedSectorDetails,
    required this.companies,
  });
  int? id;
  int? companyId;
  String? menuType;
  String? isPackage;
  String? title;
  String? type;
  String? endDate;
  String? endTime;
  String? promotion;
  String? emailshow;
  String? phoneshow;
  String? budget;
  String? isPromot;
  String? businessOverview;
  String? facilitiesOverview;
  String? prodnservOverview;
  String? reasonforsale;
  List<String>? industryPreference;
  String? locationPreference;
  String? assets;
  int? monthlySale;
  String? monthlySaleCurrency;
  int? reportedSales;
  String? reportedSaleCurrency;
  int? targetSellingPrice;
  String? targetSellingPriceCurrency;
  int? physicalAssetsValue;
  String? physicalAssetsValueCurrency;
  int? isic4Main;
  int? isic4Category;
  List<String>? isic4Activity;
  String? govtRequirement;
  String? companyRequirement;
  String? image;
  String? attachment;
  String? shortDesc;
  int? categoryLevel1;
  int? categoryLevel2;
  int? categoryLevel3;
  String? tenderType;
  Segment? segment;
  Family? family;
  Class? classObj;
  String? commodity;
  String? paymentMode;
  String? unit;
  int? quantity;
  String? shippingMode;
  String? requestType;
  int? localContentTarget;
  int? agreementPeriod;
  String? agreementStartDate;
  String? deliveryStartDate;
  String? deliveryEndDate;
  String? locationType;
  int? country;
  int? state;
  String? district;
  String? streetName;
  int? zipCode;
  int? buildingNo;
  int? unitNo;
  int? city;
  String? professionalSummary;
  String? investmentClito;
  String? investmentSize;
  String? transactionReference;
  String? financialInvestment;
  String? runRateSales;
  String? ebitdaMargin;
  String? established;
  String? employeeCapacity;
  String? legalEntry;

  String? industries;
  String? qualifiedSectors;
  String? description;
  String? scopeOfWork;
  String? requiredDocuments;
  int? advancePayment;
  String? paymentDistribution;
  String? contractStartDate;
  String? contractEndDate;
  String? listedBy;
  String? longDesc;
  String? latitude;
  String? longitude;
  String? timezone;
  String? localTime;
  String? status;
  String? createdAt;
  String? updatedAt;

  int? createdBy;
  int? updatedBy;
  int? deletedBy;
  String? approval;
  String? approvedAt;
  List<Commodities>? commodities;
  List<QualifiedSectorDetails>? qualifiedSectorDetails;
  Companies? companies;

  Tenderdetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    menuType = json['menuType'];
    isPackage = json['isPackage'];
    title = json['title'];
    type = json['type'];
    endDate = json['end_date'];
    endTime = json['end_time'];
    promotion = json['promotion'];
    emailshow = json['emailshow'];
    phoneshow = json['phoneshow'];
    budget = json['budget'];
    isPromot = json['isPromot'];
    businessOverview = json['business_overview'];
    facilitiesOverview = json['facilities_overview'];
    prodnservOverview = json['prodnserv_overview'];
    reasonforsale = json['reasonforsale'];
    industryPreference = json['industry_preference'] != null
        ? List.castFrom<dynamic, String>(json['industry_preference'])
        : [];
    locationPreference = json['location_preference'];
    assets = json['assets'];
    monthlySale = json['monthly_sale'];
    monthlySaleCurrency = json['monthly_sale_currency'];
    reportedSales = json['reported_sales'];
    reportedSaleCurrency = json['reported_sale_currency'];
    targetSellingPrice = json['target_selling_price'];
    targetSellingPriceCurrency = json['target_selling_price_currency'];
    physicalAssetsValue = json['physical_assets_value'];
    physicalAssetsValueCurrency = json['physical_assets_value_currency'];
    isic4Main = json['isic4_main'];
    isic4Category = json['isic4_category'];
    isic4Activity = json['isic4Activity'] != null
        ? List.castFrom<dynamic, String>(json['isic4_activity'])
        : [];
    govtRequirement = json['govt_requirement'];
    companyRequirement = json['company_requirement'];
    image = json['image'];
    attachment = json['attachment'];
    shortDesc = json['shortDesc'];
    categoryLevel1 = json['categoryLevel1'];
    categoryLevel2 = json['categoryLevel2'];
    categoryLevel3 = json['categoryLevel3'];
    tenderType = json['tender_type'];
    //segment = Segment.fromJson(json['segment']);
    segment =
        json['segment'] != null ? Segment.fromJson(json['segment']) : null;

    // family = Family.fromJson(json['family']);
    // classObj = Class.fromJson(json['class']);
    family = json['family'] != null ? Family.fromJson(json['family']) : null;
    classObj = json['class'] != null ? Class.fromJson(json['class']) : null;

    commodity = json['commodity'];
    paymentMode = json['payment_mode'];
    unit = json['unit'];
    quantity = json['quantity'];
    shippingMode = json['shipping_mode'];
    requestType = json['request_type'];
    localContentTarget = json['local_content_target'];
    agreementPeriod = json['agreement_period'];
    agreementStartDate = json['agreement_start_date'];
    deliveryStartDate = json['delivery_start_date'];
    deliveryEndDate = json['delivery_end_date'];
    locationType = json['location_type'];
    country = json['country'];
    state = json['state'];
    district = json['district'];
    streetName = json['street_name'];
    zipCode = json['zip_code'];
    buildingNo = json['building_no'];
    unitNo = json['unit_no'];
    city = json['city'];
    professionalSummary = json['professionalSummary'];
    investmentClito = json['investmentClito'];
    investmentSize = json['investmentSize'];
    transactionReference = json['transactionReference'];
    financialInvestment = json['financialInvestment'];
    runRateSales = json['runRateSales'];
    ebitdaMargin = json['ebitdaMargin'];
    established = json['established'];
    employeeCapacity = json['employeeCapacity'];
    legalEntry = json['legalEntry'];

    industries = json['industries'];
    qualifiedSectors = json['qualified_sectors'];
    description = json['description'];
    scopeOfWork = json['scope_of_work'];
    requiredDocuments = json['required_documents'];
    advancePayment = json['advance_payment'];
    paymentDistribution = json['payment_distribution'];
    contractStartDate = json['contract_start_date'];
    contractEndDate = json['contract_end_date'];
    listedBy = json['listedBy'];
    longDesc = json['longDesc'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    localTime = json['local_time'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    approval = json['approval'];
    approvedAt = json['approved_at'];
    // commodities = List.from(json['commodities'])
    //     .map((e) => Commodities.fromJson(e))
    //     .toList();
    // qualifiedSectorDetails = List.from(json['qualified_sector_details'])
    //     .map((e) => QualifiedSectorDetails.fromJson(e))
    //     .toList();

    commodities = json['commodities'] != null
        ? List.from(json['commodities'])
            .map((e) => Commodities.fromJson(e))
            .toList()
        : null;

    qualifiedSectorDetails = json['qualified_sector_details'] != null
        ? List.from(json['qualified_sector_details'])
            .map((e) => QualifiedSectorDetails.fromJson(e))
            .toList()
        : null;
    companies = Companies.fromJson(json['companies']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['menuType'] = menuType;
    data['isPackage'] = isPackage;
    data['title'] = title;
    data['type'] = type;
    data['end_date'] = endDate;
    data['end_time'] = endTime;
    data['promotion'] = promotion;
    data['emailshow'] = emailshow;
    data['phoneshow'] = phoneshow;
    data['budget'] = budget;
    data['isPromot'] = isPromot;
    data['business_overview'] = businessOverview;
    data['facilities_overview'] = facilitiesOverview;
    data['prodnserv_overview'] = prodnservOverview;
    data['reasonforsale'] = reasonforsale;
    data['industry_preference'] = industryPreference;
    data['location_preference'] = locationPreference;
    data['assets'] = assets;
    data['monthly_sale'] = monthlySale;
    data['monthly_sale_currency'] = monthlySaleCurrency;
    data['reported_sales'] = reportedSales;
    data['reported_sale_currency'] = reportedSaleCurrency;
    data['target_selling_price'] = targetSellingPrice;
    data['target_selling_price_currency'] = targetSellingPriceCurrency;
    data['physical_assets_value'] = physicalAssetsValue;
    data['physical_assets_value_currency'] = physicalAssetsValueCurrency;
    data['isic4_main'] = isic4Main;
    data['isic4_category'] = isic4Category;
    data['isic4_activity'] = isic4Activity;
    data['govt_requirement'] = govtRequirement;
    data['company_requirement'] = companyRequirement;
    data['image'] = image;
    data['attachment'] = attachment;
    data['shortDesc'] = shortDesc;
    data['categoryLevel1'] = categoryLevel1;
    data['categoryLevel2'] = categoryLevel2;
    data['categoryLevel3'] = categoryLevel3;
    data['tender_type'] = tenderType;
    data['segment'] = segment!.toJson();
    data['family'] = family!.toJson();
    data['class'] = classObj!.toJson();
    data['commodity'] = commodity;
    data['payment_mode'] = paymentMode;
    data['unit'] = unit;
    data['quantity'] = quantity;
    data['shipping_mode'] = shippingMode;
    data['request_type'] = requestType;
    data['local_content_target'] = localContentTarget;
    data['agreement_period'] = agreementPeriod;
    data['agreement_start_date'] = agreementStartDate;
    data['delivery_start_date'] = deliveryStartDate;
    data['delivery_end_date'] = deliveryEndDate;
    data['location_type'] = locationType;
    data['country'] = country;
    data['state'] = state;
    data['district'] = district;
    data['street_name'] = streetName;
    data['zip_code'] = zipCode;
    data['building_no'] = buildingNo;
    data['unit_no'] = unitNo;
    data['city'] = city;
    data['professionalSummary'] = professionalSummary;
    data['investmentClito'] = investmentClito;
    data['investmentSize'] = investmentSize;
    data['transactionReference'] = transactionReference;
    data['financialInvestment'] = financialInvestment;
    data['runRateSales'] = runRateSales;
    data['ebitdaMargin'] = ebitdaMargin;
    data['established'] = established;
    data['employeeCapacity'] = employeeCapacity;
    data['legalEntry'] = legalEntry;
    data['reportedSales'] = reportedSales;
    data['industries'] = industries;
    data['qualified_sectors'] = qualifiedSectors;
    data['description'] = description;
    data['scope_of_work'] = scopeOfWork;
    data['required_documents'] = requiredDocuments;
    data['advance_payment'] = advancePayment;
    data['payment_distribution'] = paymentDistribution;
    data['contract_start_date'] = contractStartDate;
    data['contract_end_date'] = contractEndDate;
    data['listedBy'] = listedBy;
    data['longDesc'] = longDesc;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['timezone'] = timezone;
    data['local_time'] = localTime;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['deleted_by'] = deletedBy;
    data['approval'] = approval;
    data['approved_at'] = approvedAt;
    data['commodities'] = commodities!.map((e) => e.toJson()).toList();
    data['qualified_sector_details'] =
        qualifiedSectorDetails!.map((e) => e.toJson()).toList();
    data['companies'] = companies!.toJson();
    return data;
  }
}

class Segment {
  Segment({
    required this.id,
    required this.segmentName,
    required this.sort,
    required this.icon,
    required this.unspscType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  int? id;
  String? segmentName;
  int? sort;
  String? icon;
  String? unspscType;
  String? status;
  String? createdAt;
  String? updatedAt;

  Segment.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    segmentName = json['segment_name'];
    sort = json['sort'];
    icon = json['icon'];
    unspscType = json['unspsc_type'];
    status = json['status'];
    createdAt = json['created_at'];
    //updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['segment_name'] = segmentName;
    data['sort'] = sort;
    data['icon'] = icon;
    data['unspsc_type'] = unspscType;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Family {
  Family({
    required this.id,
    required this.familyName,
    required this.unspscSegmentId,
    required this.unspscType,
    required this.createdAt,
    required this.updatedAt,
  });
  int? id;
  String? familyName;
  String? unspscSegmentId;
  String? unspscType;
  String? createdAt;
  String? updatedAt;

  Family.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    familyName = json['family_name'];
    unspscSegmentId = json['unspsc_segment_id'];
    unspscType = json['unspsc_type'];
    createdAt = json['created_at'];
    //updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['family_name'] = familyName;
    data['unspsc_segment_id'] = unspscSegmentId;
    data['unspsc_type'] = unspscType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Class {
  Class({
    required this.id,
    required this.className,
    required this.unspscSegmentId,
    required this.unspscFamilyId,
    required this.unspscType,
    required this.createdAt,
    required this.updatedAt,
  });
  int? id;
  String? className;
  String? unspscSegmentId;
  String? unspscFamilyId;
  String? unspscType;
  String? createdAt;
  String? updatedAt;

  Class.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    className = json['class_name'];
    unspscSegmentId = json['unspsc_segment_id'];
    unspscFamilyId = json['unspsc_family_id'];
    unspscType = json['unspsc_type'];
    //createdAt = json['created_at'];
    //updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['class_name'] = className;
    data['unspsc_segment_id'] = unspscSegmentId;
    data['unspsc_family_id'] = unspscFamilyId;
    data['unspsc_type'] = unspscType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Commodities {
  Commodities({
    required this.id,
    required this.commodityName,
    required this.commodityCode,
    required this.unspscSegmentId,
    required this.unspscFamilyId,
    required this.unspscClassId,
    required this.unspscType,
    required this.createdAt,
    required this.updatedAt,
  });
  int? id;
  String? commodityName;
  String? commodityCode;
  String? unspscSegmentId;
  String? unspscFamilyId;
  String? unspscClassId;
  String? unspscType;
  String? createdAt;
  String? updatedAt;

  Commodities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commodityName = json['commodity_name'];
    commodityCode = json['commodity_code'];
    unspscSegmentId = json['unspsc_segment_id'];
    unspscFamilyId = json['unspsc_family_id'];
    unspscClassId = json['unspsc_class_id'];
    unspscType = json['unspsc_type'];
    createdAt = json['created_at'];
    //updatedAt = json['updated_at'];
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
    data['updated_at'] = updatedAt;
    return data;
  }
}

class QualifiedSectorDetails {
  QualifiedSectorDetails({
    required this.mainActivity,
    required this.subCategory,
  });
  MainActivity? mainActivity;
  SubCategory? subCategory;

  QualifiedSectorDetails.fromJson(Map<String, dynamic> json) {
    mainActivity = MainActivity.fromJson(json['main_activity']);
    subCategory = SubCategory.fromJson(json['sub_category']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['main_activity'] = mainActivity!.toJson();
    data['sub_category'] = subCategory!.toJson();
    return data;
  }
}

class MainActivity {
  MainActivity({
    required this.id,
    required this.isic4MainActivityId,
    required this.customActivityName,
    required this.createdAt,
    this.updatedAt,
  });
  int? id;
  int? isic4MainActivityId;
  String? customActivityName;
  String? createdAt;
  String? updatedAt;

  MainActivity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isic4MainActivityId = json['isic4_main_activity_id'];
    customActivityName = json['custom_activity_name'];
    createdAt = json['created_at'];
    //updatedAt = null;
  }

  Map<String?, dynamic> toJson() {
    final data = <String?, dynamic>{};
    data['id'] = id;
    data['isic4_main_activity_id'] = isic4MainActivityId;
    data['custom_activity_name'] = customActivityName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.customActivityId,
    required this.isic4CategoryId,
    required this.isic4CategoryNo,
    required this.customCategoryName,
    required this.createdAt,
    required this.updatedAt,
  });
  int? id;
  int? customActivityId;
  int? isic4CategoryId;
  String? isic4CategoryNo;
  String? customCategoryName;
  String? createdAt;
  String? updatedAt;

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customActivityId = json['custom_activity_id'];
    isic4CategoryId = json['isic4_category_id'];
    isic4CategoryNo = json['isic4_category_no'];
    customCategoryName = json['custom_category_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['custom_activity_id'] = customActivityId;
    data['isic4_category_id'] = isic4CategoryId;
    data['isic4_category_no'] = isic4CategoryNo;
    data['custom_category_name'] = customCategoryName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Companies {
  Companies({
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

  Companies.fromJson(Map<String, dynamic> json) {
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
