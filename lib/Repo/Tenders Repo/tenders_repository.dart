import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/Tenders/TenderMain/Model/Tender.dart';
import '../../Services/Network Services/network_services.dart';

class TendersRepository {
  final networkServices = NetworkServices();

  Future<Tender> TendersResponse({
    required bearerToken,
  }) async {
    var response = await networkServices.getReq("${Api.tendersApi}",
        bearerToken: bearerToken);
    log(response.toString());

    return Tender.fromJson(response);
  }

  Future<Tender> tenderSearchApi({required bearerToken, required query}) async {
    var response = await networkServices.getReq("${Api.tenderSearch}/$query",
        bearerToken: bearerToken);
    return Tender.fromJson(response);
  }

  Future<Tender> tenderIsicFilterApi(
      {required bearerToken, required isicId}) async {
    var response = await networkServices
        .getReq("${Api.tenderIsicFilter}/$isicId", bearerToken: bearerToken);
    return Tender.fromJson(response);
  }

  Future<Tender> sortTenderApi({required bearerToken, required type}) async {
    var response = await networkServices.getReq("${Api.sortTenders}/$type",
        bearerToken: bearerToken);
    return Tender.fromJson(response);
  }
}
