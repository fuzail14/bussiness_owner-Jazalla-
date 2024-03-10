import 'dart:developer';
import '../../../../Constants/api_routes.dart';
import '../../../../Module/SalesManagment/RFIMain/SalesManagmentRFIDetail/Model/SalesManagmentRFIDetail.dart';
import '../../../../Services/Network Services/network_services.dart';

class SalesManagmentRFIDetailRepository {
  final networkServices = NetworkServices();

  Future<SalesManagmentRFIDetail> rfiDetailApi({required rfiId}) async {
    var response = await networkServices.getReq(
      "${Api.getSalesManagmentRfiDetail}/$rfiId",
    );
    log(response.toString());

    return SalesManagmentRFIDetail.fromJson(response);
  }
}
