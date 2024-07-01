import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Detail/Model/InvoiceDetail.dart';

class InvoiceManagementDetailProcurementState {
  final Status responseStatus;
  final Invoicedetail? invoice;

  InvoiceManagementDetailProcurementState({
    this.responseStatus = Status.loading,
    this.invoice,
  });

  InvoiceManagementDetailProcurementState copyWith({
    Status? responseStatus,
    Invoicedetail? invoice,
  }) {
    return InvoiceManagementDetailProcurementState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoice: invoice ?? this.invoice,
    );
  }
}
