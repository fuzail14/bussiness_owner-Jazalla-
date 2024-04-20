import 'dart:io';
import '../../Constants/api_routes.dart';
import '../../Services/Network Services/network_services.dart';

class SendServiceInquiryRepository {
  final networkServices = NetworkServices();

  Future<dynamic> sendServiceInquiry(Map<String, String> data,
      {File? pdfFile}) async {
    var response = await networkServices
        .postFormReq(Api.sendServiceInquiry, data, pdfFile: pdfFile);
    return response;
  }
}
