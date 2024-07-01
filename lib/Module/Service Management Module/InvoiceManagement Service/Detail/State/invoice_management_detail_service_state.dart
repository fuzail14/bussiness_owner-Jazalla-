import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Detail/Model/InvoiceDetail.dart';

class InvoiceManagementDetailServiceState {
  final Status responseStatus;
  final Invoicedetail? invoice;

  InvoiceManagementDetailServiceState({
    this.responseStatus = Status.loading,
    this.invoice,
  });

  InvoiceManagementDetailServiceState copyWith({
    Status? responseStatus,
    Invoicedetail? invoice,
  }) {
    return InvoiceManagementDetailServiceState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoice: invoice ?? this.invoice,
    );
  }
}
