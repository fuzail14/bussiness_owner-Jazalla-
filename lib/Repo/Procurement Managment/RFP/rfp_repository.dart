import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Module/ProcurementManagment/RFP/Main/Model/Request4Proposal.dart';
import '../../../Services/Network Services/network_services.dart';

class RequestForProposalRepository {
  final networkServices = NetworkServices();

  Future<Request4Proposal> request4ProposalApi(
      {required bearerToken, required userId}) async {
    var response = await networkServices
        .getReq("${Api.getProcurementRfp}/$userId", bearerToken: bearerToken);
    log(response.toString());

    return Request4Proposal.fromJson(response);
  }
}
