class InvestMentOpportunity {
  InvestMentOpportunity({
    required this.success,
    required this.investments,
  });
  late final bool success;
  late final List<Investments> investments;
  late final List<Isic4MainActivities> isic4MainActivities;
  late final List<Industries> industries;

  InvestMentOpportunity.fromJson(Map<String, dynamic> json) {
    success = json['success'];

    investments = (json['investments'] as List?)
            ?.map((e) => Investments.fromJson(e))
            .toList() ??
        [];
    isic4MainActivities = (json['Isic4MainActivities'] as List?)
            ?.map((e) => Isic4MainActivities.fromJson(e))
            .toList() ??
        [];
    industries = (json['Industries'] as List?)
            ?.map((e) => Industries.fromJson(e))
            .toList() ??
        [];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['investments'] = investments.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Investments {
  Investments({
    required this.id,
    required this.companyId,
    required this.menuType,
    required this.isPackage,
    required this.title,
    required this.investSizeFrom,
    required this.investSizeTo,
    required this.investCurrency,
    required this.yourCompany,
    required this.companyWebsite,
    required this.yourDesignation,
    required this.postedDesignation,
    required this.establishedDate,
    required this.interest,
    required this.totalEmployee,
    required this.isPromot,
    required this.emailShow,
    required this.phoneShow,
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
    required this.image,
    required this.attachment,
    required this.shortDesc,
    required this.categoryLevel1,
    required this.categoryLevel2,
    required this.categoryLevel3,
    required this.country,
    required this.state,
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
    required this.lookingFor,
    required this.aboutCompany,
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
    required this.rejectReason,
    required this.companies,
  });
  int? id;
  int? companyId;
  String? menuType;
  String? isPackage;
  String? title;
  String? investSizeFrom;
  String? investSizeTo;
  String? investCurrency;
  String? yourCompany;
  String? companyWebsite;
  String? yourDesignation;
  String? postedDesignation;
  String? establishedDate;
  String? interest;
  int? totalEmployee;
  String? isPromot;
  String? emailShow;
  String? phoneShow;
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
  String? image;
  String? attachment;
  String? shortDesc;
  int? categoryLevel1;
  int? categoryLevel2;
  int? categoryLevel3;
  int? country;
  int? state;
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
  String? lookingFor;
  String? aboutCompany;
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
  String? rejectReason;
  Companies? companies;

  Investments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    menuType = json['menuType'];
    isPackage = json['isPackage'];
    title = json['title'];
    investSizeFrom = json['invest_size_from'];
    investSizeTo = json['invest_size_to'];
    investCurrency = json['invest_currency'];
    yourCompany = json['your_company'];
    companyWebsite = json['company_website'];
    yourDesignation = json['your_designation'];
    postedDesignation = json['posted_designation'];
    establishedDate = json['established_date'];
    interest = json['interest'];
    totalEmployee = json['total_employee'];
    isPromot = json['isPromot'];
    emailShow = json['emailShow'];
    phoneShow = json['phoneShow'];
    businessOverview = json['business_overview'];
    facilitiesOverview = json['facilities_overview'];
    prodnservOverview = json['prodnserv_overview'];
    reasonforsale = json['reasonforsale'];
    // industryPreference =
    //     List.castFrom<dynamic, String>(json['industry_preference']);

    locationPreference = json['location_preference'];
    assets = json['assets'];
    monthlySale = json['monthly_sale'];
    monthlySaleCurrency = json['monthly_sale_currency'];

    reportedSaleCurrency = json['reported_sale_currency'];
    targetSellingPrice = json['target_selling_price'];
    targetSellingPriceCurrency = json['target_selling_price_currency'];
    physicalAssetsValue = json['physical_assets_value'];
    physicalAssetsValueCurrency = json['physical_assets_value_currency'];
    isic4Main = json['isic4_main'];
    isic4Category = json['isic4_category'];
    isic4Activity = List.castFrom<dynamic, String>(json['isic4_activity']);
    image = json['image'];
    attachment = json['attachment'];
    shortDesc = json['shortDesc'];
    categoryLevel1 = json['categoryLevel1'];
    categoryLevel2 = json['categoryLevel2'];
    categoryLevel3 = json['categoryLevel3'];
    country = json['country'];
    state = json['state'];
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
    lookingFor = json['looking_for'];
    aboutCompany = json['about_company'];
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
    rejectReason = json['reject_reason'];
    companies = Companies.fromJson(json['companies']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['menuType'] = menuType;
    _data['isPackage'] = isPackage;
    _data['title'] = title;
    _data['invest_size_from'] = investSizeFrom;
    _data['invest_size_to'] = investSizeTo;
    _data['invest_currency'] = investCurrency;
    _data['your_company'] = yourCompany;
    _data['company_website'] = companyWebsite;
    _data['your_designation'] = yourDesignation;
    _data['posted_designation'] = postedDesignation;
    _data['established_date'] = establishedDate;
    _data['interest'] = interest;
    _data['total_employee'] = totalEmployee;
    _data['isPromot'] = isPromot;
    _data['emailShow'] = emailShow;
    _data['phoneShow'] = phoneShow;
    _data['business_overview'] = businessOverview;
    _data['facilities_overview'] = facilitiesOverview;
    _data['prodnserv_overview'] = prodnservOverview;
    _data['reasonforsale'] = reasonforsale;
    _data['industry_preference'] = industryPreference;
    _data['location_preference'] = locationPreference;
    _data['assets'] = assets;
    _data['monthly_sale'] = monthlySale;
    _data['monthly_sale_currency'] = monthlySaleCurrency;

    _data['reported_sale_currency'] = reportedSaleCurrency;
    _data['target_selling_price'] = targetSellingPrice;
    _data['target_selling_price_currency'] = targetSellingPriceCurrency;
    _data['physical_assets_value'] = physicalAssetsValue;
    _data['physical_assets_value_currency'] = physicalAssetsValueCurrency;
    _data['isic4_main'] = isic4Main;
    _data['isic4_category'] = isic4Category;
    _data['isic4_activity'] = isic4Activity;
    _data['image'] = image;
    _data['attachment'] = attachment;
    _data['shortDesc'] = shortDesc;
    _data['categoryLevel1'] = categoryLevel1;
    _data['categoryLevel2'] = categoryLevel2;
    _data['categoryLevel3'] = categoryLevel3;
    _data['country'] = country;
    _data['state'] = state;
    _data['city'] = city;
    _data['professionalSummary'] = professionalSummary;
    _data['investmentClito'] = investmentClito;
    _data['investmentSize'] = investmentSize;
    _data['transactionReference'] = transactionReference;
    _data['financialInvestment'] = financialInvestment;
    _data['runRateSales'] = runRateSales;
    _data['ebitdaMargin'] = ebitdaMargin;
    _data['established'] = established;
    _data['employeeCapacity'] = employeeCapacity;
    _data['legalEntry'] = legalEntry;
    _data['reportedSales'] = reportedSales;
    _data['industries'] = industries;
    _data['looking_for'] = lookingFor;
    _data['about_company'] = aboutCompany;
    _data['listedBy'] = listedBy;
    _data['longDesc'] = longDesc;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['timezone'] = timezone;
    _data['local_time'] = localTime;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;

    _data['created_by'] = createdBy;
    _data['updated_by'] = updatedBy;
    _data['deleted_by'] = deletedBy;
    _data['approval'] = approval;
    _data['approved_at'] = approvedAt;
    _data['reject_reason'] = rejectReason;
    _data['companies'] = companies!.toJson();
    return _data;
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
    this.deletedAt,
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
  Null deletedAt;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_code'] = companyCode;
    _data['company_name'] = companyName;
    _data['ar_company_name'] = arCompanyName;
    _data['business_type'] = businessType;
    _data['description'] = description;
    _data['website'] = website;
    _data['country_code'] = countryCode;
    _data['mobile_no'] = mobileNo;
    _data['phone'] = phone;
    _data['fax'] = fax;
    _data['email'] = email;
    _data['zip_code'] = zipCode;
    _data['street'] = street;
    _data['logo'] = logo;
    _data['logo_path'] = logoPath;
    _data['contact_person_name'] = contactPersonName;
    _data['designation'] = designation;
    _data['primary_activity'] = primaryActivity;
    _data['industry'] = industry;
    _data['vat_no'] = vatNo;
    _data['vat_percentage'] = vatPercentage;
    _data['is_verified'] = isVerified;
    _data['is_public'] = isPublic;
    _data['is_branch'] = isBranch;
    _data['is_department'] = isDepartment;
    _data['registration_no'] = registrationNo;
    _data['registration_date'] = registrationDate;
    _data['facebook_link'] = facebookLink;
    _data['linkedin_link'] = linkedinLink;
    _data['twitter_link'] = twitterLink;
    _data['company_sector_id'] = companySectorId;
    _data['legal_status_id'] = legalStatusId;
    _data['status'] = status;
    _data['created_by'] = createdBy;
    _data['invited_id'] = invitedId;
    _data['currency_id'] = currencyId;
    _data['timezone_id'] = timezoneId;
    _data['language_id'] = languageId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['verification_link'] = verificationLink;
    _data['otp'] = otp;
    _data['main_segment_p'] = mainSegmentP;
    _data['family_p'] = familyP;
    _data['class_p'] = classP;
    _data['commodity_p'] = commodityP;
    _data['main_segment_s'] = mainSegmentS;
    _data['family_s'] = familyS;
    _data['class_s'] = classS;
    _data['commodity_s'] = commodityS;
    _data['isProfileEnabled'] = isProfileEnabled;
    _data['isic4_main'] = isic4Main;
    _data['isic4_category'] = isic4Category;
    _data['activity'] = activity;
    _data['subscription_id'] = subscriptionId;
    _data['network'] = network;
    _data['registration_requirement'] = registrationRequirement;
    _data['govt_requirement'] = govtRequirement;
    _data['company_requirement'] = companyRequirement;
    _data['attached_file'] = attachedFile;
    return _data;
  }
}

class Isic4MainActivities {
  Isic4MainActivities({
    required this.id,
    required this.mainActivityName,
    required this.sort,
    required this.icon,
    required this.status,
  });
  int? id;
  String? mainActivityName;
  int? sort;
  String? icon;
  String? status;

  Isic4MainActivities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mainActivityName = json['main_activity_name'];
    sort = json['sort'];
    icon = json['icon'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main_activity_name'] = mainActivityName;
    _data['sort'] = sort;
    _data['icon'] = icon;
    _data['status'] = status;

    return _data;
  }
}

class Industries {
  Industries({
    required this.id,
    required this.name,
    this.description,
    required this.sort,
    required this.icon,
    required this.status,
  });
  int? id;
  String? name;
  String? description;
  int? sort;
  String? icon;
  String? status;

  Industries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = null;
    sort = json['sort'];
    icon = json['icon'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['sort'] = sort;
    _data['icon'] = icon;
    _data['status'] = status;

    return _data;
  }
}
