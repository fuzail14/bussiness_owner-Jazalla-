import 'dart:developer';
import 'package:bussines_owner/Module/OnlineStore/Detail/Model/ProductDetail.dart';
import '../../Constants/api_routes.dart';
import '../../Services/Network Services/network_services.dart';

class OnineStoreDetailRepository {
  final networkServices = NetworkServices();
  Future<ProductDetail> productDetailViewApi({
    required productId,
    required bearerToken,
  }) async {
    var response = await networkServices
        .getReq("${Api.getProductDetail}/$productId", bearerToken: bearerToken);
    log(response.toString());
    return ProductDetail.fromJson(response);
  }
}
