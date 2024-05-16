import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';
import '../../Module/Approval Authority/Create/Model/AddApprovalAuthorityUser.dart';
import '../../Module/Approval Authority/Create/Model/AddModule.dart';
import '../../Module/Approval Authority/Create/Model/AddSubModule.dart';
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

  Future<AddModule> getModuleForAddApprovalAuthorityApi() async {
    var response = await networkServices.getReq(
      Api.getModuleForAddApprovalAuthority,
    );
    log(response.toString());

    return AddModule.fromJson(response);
  }

  Future<AddSubModule> getSubModuleForAddApprovalAuthorityApi(
      {required moduleId}) async {
    var response = await networkServices.getReq(
      "${Api.getsubModuleFunctionForAddApprovalAuthority}/$moduleId",
    );
    log(response.toString());

    return AddSubModule.fromJson(response);
  }

  Future<AddApprovalAuthorityUser> getUserForAddApprovalAuthorityApi(
      {required companyId, required type}) async {
    var response = await networkServices.getReq(
      "${Api.getUserForAddApprovalAuthority}/$companyId/$type",
    );
    log(response.toString());

    return AddApprovalAuthorityUser.fromJson(response);
  }
}
