import 'dart:io';
import '../../Constants/api_routes.dart';
import '../../Services/Network Services/network_services.dart';

class TenderResponseRepository {
  final networkServices = NetworkServices();
  Future<dynamic> sendTederExpressInterest(Map<String, String> data,
      {File? pdfFile}) async {
    var response = await networkServices
        .postFormReq(Api.tendersExpressInterestApi, data, pdfFile: pdfFile);
    return response;
  }
}
