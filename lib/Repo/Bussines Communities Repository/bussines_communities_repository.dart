import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/BussinesCommunity/Main/Model/BussinesCommunity.dart';
import '../../Services/Network Services/network_services.dart';

class BussinessCommunitiesRepository {
  final networkServices = NetworkServices();

  Future<BussinesCommunity> bussinesCommunitiesViewApi({
    required bearerToken,
  }) async {
    var response = await networkServices.getReq("${Api.bussinesCommunities}",
        bearerToken: bearerToken);
    log(response.toString());

    return BussinesCommunity.fromJson(response);
  }

  Future<BussinesCommunity> bussinesTypeFilterApi(
      {required bearerToken, required type}) async {
    var response = await networkServices.getReq(
        "${Api.bussinesCommunityFilter}/$type",
        bearerToken: bearerToken);
    log(response.toString());

    return BussinesCommunity.fromJson(response);
  }

  Future<BussinesCommunity> bussinesCommunityIsicFilterApi(
      {required bearerToken, required isicId}) async {
    var response = await networkServices.getReq(
        "${Api.bussinesCommunityIsicFilter}/$isicId",
        bearerToken: bearerToken);
    log(response.toString());

    return BussinesCommunity.fromJson(response);
  }

  Future<BussinesCommunity> bussinesCommunityIndustryApi(
      {required bearerToken, required industryId}) async {
    var response = await networkServices.getReq(
        "${Api.bussinesCommunityIndustryFilter}/$industryId",
        bearerToken: bearerToken);
    log(response.toString());

    return BussinesCommunity.fromJson(response);
  }

  Future<BussinesCommunity> bussinesSearchApi(
      {required bearerToken, required query}) async {
    var response = await networkServices.getReq(
        "${Api.bussinesCommunitySearch}/$query",
        bearerToken: bearerToken);
    //log('my response${response.toString()}');

    return BussinesCommunity.fromJson(response);
  }

  Future<BussinesCommunity> CompanyFilterApi(
      {required bearerToken, required type}) async {
    var response = await networkServices.getReq("${Api.filterCompanies}/$type",
        bearerToken: bearerToken);
    log(response.toString());

    return BussinesCommunity.fromJson(response);
  }
}
