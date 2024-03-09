import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Module/ProcurementManagment/RFI/Main/Model/Request4Information.dart';
import '../../../Services/Network Services/network_services.dart';

class ServiceManagmentRFIRepository {
  final networkServices = NetworkServices();

  Future<Request4Information> serviceManagmentRFIApi(
      {required bearerToken, required userId, required requestType}) async {
    var response = await networkServices.getReq(
        "${Api.getSalesManagmentRfi}/$userId/$requestType",
        bearerToken: bearerToken);
    log(response.toString());

    return Request4Information.fromJson(response);
  }
}
