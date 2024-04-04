import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Module/ProcurementManagment/RFI/Main/Model/Request4Information.dart';
import '../../../Services/Network Services/network_services.dart';

class ApprovalManagmentRepository {
  final networkServices = NetworkServices();

  Future<Request4Information> request4InformationApi(
      {required bearerToken, required userId}) async {
    var response = await networkServices
        .getReq("${Api.getProcurementRfi}/$userId", bearerToken: bearerToken);
    log(response.toString());

    return Request4Information.fromJson(response);
  }
}
