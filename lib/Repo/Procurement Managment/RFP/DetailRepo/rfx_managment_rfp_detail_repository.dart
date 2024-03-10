import 'dart:developer';
import '../../../../Constants/api_routes.dart';
import '../../../../Module/ProcurementManagment/RFP/RFXManagmentRFPDetail/Model/RFPDetail.dart';
import '../../../../Services/Network Services/network_services.dart';

class RFXManagmentRFPDetailRepository {
  final networkServices = NetworkServices();

  Future<RequestForProposalDetail> rfpDetailApi({required rfpId}) async {
    var response = await networkServices.getReq(
      "${Api.getProcurementRfpDetail}/$rfpId",
    );
    log(response.toString());

    return RequestForProposalDetail.fromJson(response);
  }
}
