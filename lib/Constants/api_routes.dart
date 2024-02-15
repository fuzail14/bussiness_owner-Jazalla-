class Api {
  static const String imageBaseUrl = 'http://127.0.0.1:8000/uploads/logo/';
  static const String originalImageBaseUrl = 'http://127.0.0.1:8000';
  static const String baseUrl = 'http://127.0.0.1:8000/api/';

  // static const String imageBaseUrl = 'http://192.168.100.47:8000/uploads/logo/';
  // static const String originalImageBaseUrl = 'http://192.168.100.47:8000';
  // static const String baseUrl = 'http://192.168.100.47:8000/api/';

  static const String login = "${baseUrl}loginWithMobileNumber";
  static const String bussinesCommunities =
      "${baseUrl}marketplace/bussinesCommunity/bussinesCommunityView";

  static const String bussinesCommunityFilter =
      "${baseUrl}marketplace/bussinesCommunity/bussinesCommunityFilter";

  static const String bussinesCommunityIsicFilter =
      "${baseUrl}marketplace/bussinesCommunity/bussinesCommunityIsicFilter";
  static const String bussinesCommunityIndustryFilter =
      "${baseUrl}marketplace/bussinesCommunity/bussinesCommunityIndustryFilter";

  static const String bussinesCommunitySearch =
      "${baseUrl}marketplace/bussinesCommunity/bussinesCommunitySearch";

  static const String filterCompanies =
      "${baseUrl}marketplace/bussinesCommunity/FilterCompanies";

  static const String getCompanyDetail =
      "${baseUrl}marketplace/bussinesCommunity/getCompanyDetail";

  static const String onlineStoreView =
      "${baseUrl}marketplace/OnlineStore/onlineStoreView";

  static const String productSearch =
      "${baseUrl}marketplace/OnlineStore/productSearch";
  static const String filterItems =
      "${baseUrl}marketplace/OnlineStore/filterItems";

  static const String getProductDetail =
      "${baseUrl}marketplace/OnlineStore/getProductDetail";

  static const String bussinesForSale =
      "${baseUrl}marketplace/BussinesForSale/bussinesForSale";
  static const String getBussinesForSaleDetail =
      "${baseUrl}marketplace/BussinesForSale/getBussinesForSaleDetail";

  static const String tendersApi = "${baseUrl}marketplace/Tenders/TendersApi";
  static const String getTendersDetail =
      "${baseUrl}marketplace/Tenders/getTendersDetail";
  static const String generalServicesApi =
      "${baseUrl}marketplace/GeneralServices/GeneralServicesApi";
  static const String serviceSearch =
      "${baseUrl}marketplace/GeneralServices/serviceSearch";
  static const String serviceFilterItems =
      "${baseUrl}marketplace/GeneralServices/serviceFilterItems";

  static const String getGenralServicesDetail =
      "${baseUrl}marketplace/GeneralServices/getGenralServicesDetail";

  static const String investmentOpportunityUrl =
      "${baseUrl}marketplace/InvestmentOpportunity/InvestmentOpportunityApi";
  static const String getInvestmentOpportunityDetail =
      "${baseUrl}marketplace/InvestmentOpportunity/getInvestmentOpportunityDetail";

  static const String sendInquiry =
      "${baseUrl}marketplace/OnlineStore/sendInquiry";

  static const String getProductWithTemplate =
      "${baseUrl}marketplace/OnlineStore/getProductWithTemplate";

  static const String requestQuotation =
      "${baseUrl}marketplace/OnlineStore/requestQuotation";

  static const String sendServiceInquiry =
      "${baseUrl}marketplace/GeneralServices/sendServiceInquiry";

  static const String getServiceWithTemplate =
      "${baseUrl}marketplace/GeneralServices/getServiceWithTemplate";

  static const String requestforProposal =
      "${baseUrl}marketplace/GeneralServices/requestforProposal";
}
