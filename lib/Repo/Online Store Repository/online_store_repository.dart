import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/OnlineStore/onlinestore/Model/Product.dart';
import '../../Services/Network Services/network_services.dart';

class OnlineStoreRepository {
  final networkServices = NetworkServices();

  Future<Product> onlineStoreViewApi({
    required bearerToken,
  }) async {
    var response = await networkServices.getReq(Api.onlineStoreView,
        bearerToken: bearerToken);
    //log(response.toString());

    return Product.fromJson(response);
  }

  Future<Product> productSearchRepo(
      {required bearerToken, required query}) async {
    var response = await networkServices.getReq("${Api.productSearch}/$query",
        bearerToken: bearerToken);
    //log('my response${response.toString()}');

    return Product.fromJson(response);
  }

  Future<Product> productFilterApi(
      {required bearerToken, required type, required userId}) async {
    var response = await networkServices
        .getReq("${Api.filterItems}/$type/$userId", bearerToken: bearerToken);
    log(response.toString());

    return Product.fromJson(response);
  }
}
