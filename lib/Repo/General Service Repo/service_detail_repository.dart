import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/GeneralServices/Detail/Model/ServiceDetail.dart';
import '../../Services/Network Services/network_services.dart';

class ServiceDetailRepository {
  final networkServices = NetworkServices();
  Future<ServiceDetail> serviceDetailViewApi({
    required serviceId,
    required bearerToken,
  }) async {
    var response = await networkServices.getReq(
        "${Api.getGenralServicesDetail}/$serviceId",
        bearerToken: bearerToken);
    log(response.toString());
    return ServiceDetail.fromJson(response);
  }
}
