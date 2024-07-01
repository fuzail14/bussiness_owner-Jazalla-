import 'package:bussines_owner/Module/OnlineStore/onlinestore/Model/Product.dart';

import '../../../../../Data/Api Resp/api_response.dart';

class ProductCatalougeSalesState {
  final Status responseStatus;

  final List<Products> productsApiList;
  final List<Companies> productsCompaniesApiList;

  ProductCatalougeSalesState({
    this.responseStatus = Status.loading,
    this.productsApiList = const [],
    this.productsCompaniesApiList = const [],
  });

  ProductCatalougeSalesState copyWith({
    Status? responseStatus,
    List<Products>? productsApiList,
    List<Companies>? productsCompaniesApiList,
    String? description,
  }) {
    return ProductCatalougeSalesState(
      responseStatus: responseStatus ?? this.responseStatus,
      productsApiList: productsApiList ?? this.productsApiList,
      productsCompaniesApiList:
          productsCompaniesApiList ?? this.productsCompaniesApiList,
    );
  }
}
