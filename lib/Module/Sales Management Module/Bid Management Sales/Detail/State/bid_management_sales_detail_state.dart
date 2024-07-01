import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Detail/Model/InvoiceDetail.dart';

class BidManagementSalesDetailState {
  final Status responseStatus;
  final Invoicedetail? invoice;

  BidManagementSalesDetailState({
    this.responseStatus = Status.loading,
    this.invoice,
  });

  BidManagementSalesDetailState copyWith({
    Status? responseStatus,
    Invoicedetail? invoice,
  }) {
    return BidManagementSalesDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoice: invoice ?? this.invoice,
    );
  }
}
