import 'dart:developer';
import 'dart:io';

import '../../Constants/api_routes.dart';
import '../../Module/OnlineStore/RequestQuote/Model/ProductWithTemplate.dart';
import '../../Services/Network Services/network_services.dart';

class SendInquiryRepository {
  final networkServices = NetworkServices();

  Future<ProductWithTemplate> productDetailWithTemplateViewApi({
    required productId,
  }) async {
    var response = await networkServices
        .getReq("${Api.getProductWithTemplate}/$productId");
    //log("api hits ${response.toString()}");
    return ProductWithTemplate.fromJson(response);
  }

  Future<dynamic> sendInquiry(Map<String, String> data, {File? pdfFile}) async {
    var response = await networkServices.postFormReq(Api.sendInquiry, data,
        pdfFile: pdfFile);
    return response;
  }
}
