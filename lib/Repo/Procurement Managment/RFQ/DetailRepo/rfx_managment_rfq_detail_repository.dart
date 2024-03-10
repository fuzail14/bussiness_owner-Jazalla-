import 'dart:developer';
import '../../../../Constants/api_routes.dart';
import '../../../../Module/ProcurementManagment/RFQ/RFXManagmentRFQDetail/Model/RFQDetail.dart';
import '../../../../Services/Network Services/network_services.dart';

class RFXManagmentRFQDetailRepository {
  final networkServices = NetworkServices();

  Future<RequestForQuotationDetail> rfqDetailApi({required rfqId}) async {
    var response = await networkServices.getReq(
      "${Api.getProcurementRfqDetail}/$rfqId",
    );
    log(response.toString());

    return RequestForQuotationDetail.fromJson(response);
  }
}
