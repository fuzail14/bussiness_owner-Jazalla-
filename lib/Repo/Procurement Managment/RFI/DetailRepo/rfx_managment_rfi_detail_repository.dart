import 'dart:developer';
import 'package:bussines_owner/Module/ProcurementManagment/RFI/RfxManagmentRFIDetail/Model/RFIDetail.dart';
import '../../../../Constants/api_routes.dart';
import '../../../../Services/Network Services/network_services.dart';

class RFXManagmentRFIDetailRepository {
  final networkServices = NetworkServices();

  Future<RFIDetail> rfiDetailApi({required rfiId}) async {
    var response = await networkServices.getReq(
      "${Api.getProcurementRfiDetail}/$rfiId",
    );
    log(response.toString());

    return RFIDetail.fromJson(response);
  }
}
