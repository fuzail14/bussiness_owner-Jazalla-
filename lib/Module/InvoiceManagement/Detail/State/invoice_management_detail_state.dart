import 'package:bussines_owner/Module/InvoiceManagement/Main/Model/Invoice.dart';

import '../../../../Data/Api Resp/api_response.dart';
import '../../../ProcurementManagment/RFI/RfxManagmentRFIDetail/Model/RFIDetail.dart';
import '../Model/InvoiceDetail.dart';

class InvoiceManagementDetailState {
  final Status responseStatus;
  final Invoicedetail? invoice;

  InvoiceManagementDetailState({
    this.responseStatus = Status.loading,
    this.invoice,
  });

  InvoiceManagementDetailState copyWith({
    Status? responseStatus,
    Invoicedetail? invoice,
  }) {
    return InvoiceManagementDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoice: invoice ?? this.invoice,
    );
  }
}
