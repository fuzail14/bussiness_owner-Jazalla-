import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Module/ProcurementManagment/RFQ/Model/Request4Quotation.dart';
import '../../../Services/Network Services/network_services.dart';

class RequestForQuotationRepository {
  final networkServices = NetworkServices();

  Future<Request4Quotation> request4QuotationApi(
      {required bearerToken, required userId}) async {
    var response = await networkServices
        .getReq("${Api.getProcurementRfq}/$userId", bearerToken: bearerToken);
    log(response.toString());

    return Request4Quotation.fromJson(response);
  }
}
