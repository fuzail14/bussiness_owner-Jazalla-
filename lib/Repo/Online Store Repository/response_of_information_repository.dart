import 'dart:io';
import '../../Constants/api_routes.dart';
import '../../Services/Network Services/network_services.dart';

class ResponseOfInformationRepository {
  final networkServices = NetworkServices();

  Future<dynamic> responseOfInformation(Map<String, String> data,
      {File? pdfFile}) async {
    var response = await networkServices
        .postFormReq(Api.sendresponseForInformation, data, pdfFile: pdfFile);
    return response;
  }
}
