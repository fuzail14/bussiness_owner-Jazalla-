class BussinesCommunity {
  BussinesCommunity({
    required this.success,
    required this.companies,
  });
  late final bool success;
  late final List<Companies> companies;
  late final List<Isic4MainActivities> isic4MainActivities;
  late final List<Industries> industries;

  BussinesCommunity.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    companies =
        List.from(json['companies']).map((e) => Companies.fromJson(e)).toList();
    isic4MainActivities = (json['Isic4MainActivities'] as List?)
            ?.map((e) => Isic4MainActivities.fromJson(e))
            .toList() ??
        [];
    industries = (json['Industries'] as List?)
            ?.map((e) => Industries.fromJson(e))
            .toList() ??
        [];
    // isic4MainActivities = List.from(json['Isic4MainActivities'])
    //     .map((e) => Isic4MainActivities.fromJson(e))
    //     .toList();
    // industries = List.from(json['Industries'])
    //     .map((e) => Industries.fromJson(e))
    //     .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['companies'] = companies.map((e) => e.toJson()).toList();
    return data;
  }
}

class Companies {
  Companies({
    required this.id,
    this.companyCode,
    required this.companyName,
    this.arCompanyName,
    this.businessType,
    this.description,
    this.website,
    required this.countryCode,
    required this.mobileNo,
    this.phone,
    this.fax,
    required this.email,
    required this.zipCode,
    required this.street,
    this.logo,
    this.logoPath,
    required this.contactPersonName,
    required this.designation,
    required this.primaryActivity,
    this.industry,
    required this.vatNo,
    required this.vatPercentage,
    required this.isVerified,
    required this.isPublic,
    required this.isBranch,
    required this.isDepartment,
    this.registrationNo,
    this.registrationDate,
    this.facebookLink,
    this.linkedinLink,
    this.twitterLink,
    this.companySectorId,
    this.legalStatusId,
    required this.status,
    this.createdBy,
    this.invitedId,
    this.currencyId,
    this.timezoneId,
    this.languageId,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.verificationLink,
    this.otp,
    this.mainSegmentP,
    this.familyP,
    this.classP,
    this.commodityP,
    this.mainSegmentS,
    this.familyS,
    this.classS,
    this.commodityS,
    required this.isProfileEnabled,
    this.isic4Main,
    this.isic4Category,
    this.subscriptionId,
    required this.network,
    required this.registrationRequirement,
    this.govtRequirement,
    this.companyRequirement,
    this.attachedFile,
  });
  late final int id;
  late final String? companyCode;
  late final String companyName;
  late final String? arCompanyName;
  late final String? businessType;
  late final String? description;
  late final String? website;
  late final String countryCode;
  late final String mobileNo;
  late final String? phone;
  late final String? fax;
  late final String email;
  late final int zipCode;
  late final String street;
  late final String? logo;
  late final String? logoPath;
  late final String contactPersonName;
  late final String designation;
  late final String primaryActivity;
  late final int? industry;
  late final int vatNo;
  late final String vatPercentage;
  late final int isVerified;
  late final int isPublic;
  late final int isBranch;
  late final int isDepartment;
  late final String? registrationNo;
  late final String? registrationDate;
  late final String? facebookLink;
  late final String? linkedinLink;
  late final String? twitterLink;
  late final int? companySectorId;
  late final int? legalStatusId;
  late final String status;
  late final int? createdBy;
  late final Null invitedId;
  late final int? currencyId;
  late final int? timezoneId;
  late final int? languageId;
  late final String createdAt;
  late final String? updatedAt;
  late final Null deletedAt;
  late final Null verificationLink;
  late final String? otp;
  late final int? mainSegmentP;
  late final int? familyP;
  late final int? classP;
  late final String? commodityP;
  late final int? mainSegmentS;
  late final int? familyS;
  late final int? classS;
  late final String? commodityS;
  late final String isProfileEnabled;
  late final int? isic4Main;
  late final int? isic4Category;
  late final int? subscriptionId;
  late final String network;
  late final String registrationRequirement;
  late final String? govtRequirement;
  late final String? companyRequirement;
  late final String? attachedFile;

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyCode = null;
    companyName = json['company_name'];
    arCompanyName = null;
    businessType = null;
    description = null;
    website = null;
    countryCode = json['country_code'];
    mobileNo = json['mobile_no'];
    phone = null;
    fax = null;
    email = json['email'];
    zipCode = json['zip_code'];
    street = json['street'];
    logo = null;
    logoPath = null;
    contactPersonName = json['contact_person_name'];
    designation = json['designation'];
    primaryActivity = json['primary_activity'];
    industry = null;
    vatNo = json['vat_no'];
    vatPercentage = json['vat_percentage'];
    isVerified = json['is_verified'];
    isPublic = json['is_public'];
    isBranch = json['is_branch'];
    isDepartment = json['is_department'];
    registrationNo = null;
    registrationDate = null;
    facebookLink = null;
    linkedinLink = null;
    twitterLink = null;
    companySectorId = null;
    legalStatusId = null;
    status = json['status'];
    createdBy = null;
    invitedId = null;
    currencyId = null;
    timezoneId = null;
    languageId = null;
    createdAt = json['created_at'];
    updatedAt = null;
    deletedAt = null;
    verificationLink = null;
    otp = null;
    mainSegmentP = null;
    familyP = null;
    classP = null;
    commodityP = null;
    mainSegmentS = null;
    familyS = null;
    classS = null;
    commodityS = null;
    isProfileEnabled = json['isProfileEnabled'];
    isic4Main = null;
    isic4Category = null;
    subscriptionId = null;
    network = json['network'];
    registrationRequirement = json['registration_requirement'];
    govtRequirement = null;
    companyRequirement = null;
    attachedFile = null;
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
