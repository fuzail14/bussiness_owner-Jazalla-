import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/GeneralServices/Services/Model/GeneralService.dart';
import '../../Services/Network Services/network_services.dart';

class GeneralServiceRepository {
  final networkServices = NetworkServices();

  Future<GeneralService> ServicesResponse({
    required bearerToken,
  }) async {
    var response = await networkServices.getReq(Api.generalServicesApi,
        bearerToken: bearerToken);
    log(response.toString());

    return GeneralService.fromJson(response);
  }

  Future<GeneralService> serviceSearchRepo(
      {required bearerToken, required query}) async {
    var response = await networkServices.getReq("${Api.serviceSearch}/$query",
        bearerToken: bearerToken);
    return GeneralService.fromJson(response);
  }

  Future<GeneralService> serviceFilterApi(
      {required bearerToken, required type, required userId}) async {
    var response = await networkServices.getReq(
        "${Api.serviceFilterItems}/$type/$userId",
        bearerToken: bearerToken);
    log(response.toString());

    return GeneralService.fromJson(response);
  }
}
