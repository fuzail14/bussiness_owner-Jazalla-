import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Module/ProcurementManagment/RFQ/Main/Model/Request4Quotation.dart';
import '../../../Services/Network Services/network_services.dart';

class SalesManagmentRFQRepository {
  final networkServices = NetworkServices();

  Future<Request4Quotation> salesManagmentRFQApi(
      {required bearerToken, required userId}) async {
    var response = await networkServices.getReq(
        "${Api.getSalesManagmentRFQ}/$userId",
        bearerToken: bearerToken);
    log(response.toString());

    return Request4Quotation.fromJson(response);
  }
}
