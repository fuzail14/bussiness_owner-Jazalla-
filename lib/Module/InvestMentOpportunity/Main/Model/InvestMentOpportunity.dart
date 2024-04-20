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
    final data = <String, dynamic>{};
    data['success'] = success;
    data['investments'] = investments.map((e) => e.toJson()).toList();
    return data;
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['menuType'] = menuType;
    data['isPackage'] = isPackage;
    data['title'] = title;
    data['invest_size_from'] = investSizeFrom;
    data['invest_size_to'] = investSizeTo;
    data['invest_currency'] = investCurrency;
    data['your_company'] = yourCompany;
    data['company_website'] = companyWebsite;
    data['your_designation'] = yourDesignation;
    data['posted_designation'] = postedDesignation;
    data['established_date'] = establishedDate;
    data['interest'] = interest;
    data['total_employee'] = totalEmployee;
    data['isPromot'] = isPromot;
    data['emailShow'] = emailShow;
    data['phoneShow'] = phoneShow;
    data['business_overview'] = businessOverview;
    data['facilities_overview'] = facilitiesOverview;
    data['prodnserv_overview'] = prodnservOverview;
    data['reasonforsale'] = reasonforsale;
    data['industry_preference'] = industryPreference;
    data['location_preference'] = locationPreference;
    data['assets'] = assets;
    data['monthly_sale'] = monthlySale;
    data['monthly_sale_currency'] = monthlySaleCurrency;

    data['reported_sale_currency'] = reportedSaleCurrency;
    data['target_selling_price'] = targetSellingPrice;
    data['target_selling_price_currency'] = targetSellingPriceCurrency;
    data['physical_assets_value'] = physicalAssetsValue;
    data['physical_assets_value_currency'] = physicalAssetsValueCurrency;
    data['isic4_main'] = isic4Main;
    data['isic4_category'] = isic4Category;
    data['isic4_activity'] = isic4Activity;
    data['image'] = image;
    data['attachment'] = attachment;
    data['shortDesc'] = shortDesc;
    data['categoryLevel1'] = categoryLevel1;
    data['categoryLevel2'] = categoryLevel2;
    data['categoryLevel3'] = categoryLevel3;
    data['country'] = country;
    data['state'] = state;
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
    data['looking_for'] = lookingFor;
    data['about_company'] = aboutCompany;
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
    data['reject_reason'] = rejectReason;
    data['companies'] = companies!.toJson();
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
    data['deleted_at'] = deletedAt;
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['main_activity_name'] = mainActivityName;
    data['sort'] = sort;
    data['icon'] = icon;
    data['status'] = status;

    return data;
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['sort'] = sort;
    data['icon'] = icon;
    data['status'] = status;

    return data;
  }
}
