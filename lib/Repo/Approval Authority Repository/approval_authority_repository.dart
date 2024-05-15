import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';
import '../../Module/Approval Authority/Main/Model/ApprovalAuthority.dart';

class ApprovalAuthorityRepository {
  final networkServices = NetworkServices();

  Future<Approvalauthority> getApprovalAuthorityApi(
      {required bearerToken, required companyId}) async {
    var response = await networkServices.getReq(
        "${Api.getApprovalAuthority}/$companyId",
        bearerToken: bearerToken);
    log(response.toString());

    return Approvalauthority.fromJson(response);
  }
}
