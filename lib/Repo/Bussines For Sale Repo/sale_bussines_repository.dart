import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/BussinesForSale/Main/Model/SaleBussines.dart';
import '../../Services/Network Services/network_services.dart';

class SaleBussinesRepository {
  final networkServices = NetworkServices();

  Future<SaleBussines> BussinesForSaleResponse({
    required bearerToken,
  }) async {
    var response = await networkServices.getReq("${Api.bussinesForSale}",
        bearerToken: bearerToken);
    log(response.toString());

    return SaleBussines.fromJson(response);
  }

  Future<SaleBussines> bussinesForSaleSearchApi(
      {required bearerToken, required query}) async {
    var response = await networkServices.getReq(
        "${Api.bussinesForSaleSearch}/$query",
        bearerToken: bearerToken);
    //log('my response${response.toString()}');

    return SaleBussines.fromJson(response);
  }

  Future<SaleBussines> bussinesForSaleIsicFilterApi(
      {required bearerToken, required isicId}) async {
    var response = await networkServices.getReq(
        "${Api.bussinesForSaleIsicFilter}/$isicId",
        bearerToken: bearerToken);
    log(response.toString());

    return SaleBussines.fromJson(response);
  }

  Future<SaleBussines> bussinesForSaleIndustryApi(
      {required bearerToken, required industryId}) async {
    var response = await networkServices.getReq(
        "${Api.bussinesForSaleIndustryFilter}/$industryId",
        bearerToken: bearerToken);
    log(response.toString());

    return SaleBussines.fromJson(response);
  }

  Future<SaleBussines> bussinesForSaleSortApi(
      {required bearerToken, required type}) async {
    var response = await networkServices
        .getReq("${Api.sortBussinesForSale}/$type", bearerToken: bearerToken);
    log(response.toString());

    return SaleBussines.fromJson(response);
  }
}
