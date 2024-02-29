import 'dart:developer';
import 'package:bussines_owner/Module/ProcurementManagment/RFP/Model/Request4Proposal.dart';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';

class ServiceManagmentRFPRepository {
  final networkServices = NetworkServices();

  Future<Request4Proposal> serviceManagmentRFPApi(
      {required bearerToken, required serviceProviderId}) async {
    var response = await networkServices.getReq(
        "${Api.getServiceManagmentRFP}/$serviceProviderId",
        bearerToken: bearerToken);
    log(response.toString());

    return Request4Proposal.fromJson(response);
  }
}
