import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/BussinesForSale/Detail/Model/SaleBussinesDetail.dart';
import '../../Services/Network Services/network_services.dart';

class BussinessSaleDetailRepository {
  final networkServices = NetworkServices();
  Future<SaleBussinesDetail> bussinesSaleDetailViewApi({
    required Id,
    required bearerToken,
  }) async {
    var response = await networkServices.getReq(
        "${Api.getBussinesForSaleDetail}/$Id",
        bearerToken: bearerToken);
    log(response.toString());
    return SaleBussinesDetail.fromJson(response);
  }
}
