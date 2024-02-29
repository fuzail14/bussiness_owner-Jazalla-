import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Module/ProcurementManagment/RFI/Model/Request4Information.dart';
import '../../../Services/Network Services/network_services.dart';

class SalesManagmentRFIRepository {
  final networkServices = NetworkServices();

  Future<Request4Information> salesManagmentRFIApi(
      {required bearerToken, required userId, required requestType}) async {
    var response = await networkServices.getReq(
        "${Api.getSalesManagmentRfi}/$userId/$requestType",
        bearerToken: bearerToken);
    log(response.toString());

    return Request4Information.fromJson(response);
  }
}
