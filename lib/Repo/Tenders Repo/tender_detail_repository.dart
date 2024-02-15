import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/Tenders/Detail/Model/TenderDetail.dart';
import '../../Services/Network Services/network_services.dart';

class TenderDetailRepository {
  final networkServices = NetworkServices();
  Future<TenderDetail> tenderDetailViewApi({
    required tenderId,
    required bearerToken,
  }) async {
    var response = await networkServices
        .getReq("${Api.getTendersDetail}/$tenderId", bearerToken: bearerToken);
    log(response.toString());
    return TenderDetail.fromJson(response);
  }
}
