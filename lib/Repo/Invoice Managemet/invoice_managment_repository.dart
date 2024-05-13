import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';
import '../../Module/InvoiceManagement/Detail/Model/InvoiceDetail.dart';
import '../../Module/InvoiceManagement/Main/Model/Invoice.dart';

class InvoiceManagmentRepository {
  final networkServices = NetworkServices();

  Future<Invoice> invoiceForBuyerApi(
      {required bearerToken,
      required companyId,
      required companyActivity}) async {
    var response = await networkServices.getReq(
        "${Api.getInvocies}/$companyId/$companyActivity",
        bearerToken: bearerToken);
    log(response.toString());

    return Invoice.fromJson(response);
  }

  Future<IndividualInvoiceDetail> invoiceDetail({
    required invoiceId,
  }) async {
    var response =
        await networkServices.getReq("${Api.getInvocieDetail}/$invoiceId");
    log(response.toString());

    return IndividualInvoiceDetail.fromJson(response);
  }
}
