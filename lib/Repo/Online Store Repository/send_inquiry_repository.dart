import 'dart:io';
import '../../Constants/api_routes.dart';
import '../../Services/Network Services/network_services.dart';

class SendInquiryRepository {
  final networkServices = NetworkServices();

  Future<dynamic> sendInquiry(Map<String, String> data, {File? pdfFile}) async {
    var response = await networkServices.postFormReq(Api.sendInquiry, data,
        pdfFile: pdfFile);
    return response;
  }
}
