import 'dart:io';

import '../../Constants/api_routes.dart';
import '../../Module/GeneralServices/RequestProposal/Model/ServiceWithTemplate.dart';
import '../../Services/Network Services/network_services.dart';

class RequestProposalRepository {
  final networkServices = NetworkServices();

  Future<ServiceWithTemplate> serviceDetailWithTemplateViewApi({
    required serviceId,
  }) async {
    var response = await networkServices
        .getReq("${Api.getServiceWithTemplate}/$serviceId");
    //log("api hits ${response.toString()}");
    return ServiceWithTemplate.fromJson(response);
  }

  Future<dynamic> sendProposal(Map<String, String> data,
      {File? pdfFile}) async {
    var response = await networkServices
        .postFormReq(Api.requestforProposal, data, pdfFile: pdfFile);
    return response;
  }
}
