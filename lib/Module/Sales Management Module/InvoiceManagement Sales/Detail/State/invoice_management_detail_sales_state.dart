import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Detail/Model/InvoiceDetail.dart';

class InvoiceManagementDetailSalesState {
  final Status responseStatus;
  final Invoicedetail? invoice;

  InvoiceManagementDetailSalesState({
    this.responseStatus = Status.loading,
    this.invoice,
  });

  InvoiceManagementDetailSalesState copyWith({
    Status? responseStatus,
    Invoicedetail? invoice,
  }) {
    return InvoiceManagementDetailSalesState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoice: invoice ?? this.invoice,
    );
  }
}
