import 'dart:io';

import '../../Constants/api_routes.dart';
import '../../Module/OnlineStore/RequestQuote/Model/ProductWithTemplate.dart';
import '../../Services/Network Services/network_services.dart';

class RequestQuoteRepository {
  final networkServices = NetworkServices();

  Future<ProductWithTemplate> productDetailWithTemplateViewApi({
    required productId,
  }) async {
    var response = await networkServices
        .getReq("${Api.getProductWithTemplate}/$productId");
    //log("api hits ${response.toString()}");
    return ProductWithTemplate.fromJson(response);
  }

  Future<dynamic> sendQuote(Map<String, String> data, {File? pdfFile}) async {
    var response = await networkServices.postFormReq(Api.requestQuotation, data,
        pdfFile: pdfFile);
    return response;
  }
}
