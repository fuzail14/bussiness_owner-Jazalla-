import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Detail/Model/InvoiceDetail.dart';

class BidManagementServiceDetailState {
  final Status responseStatus;
  final Invoicedetail? invoice;

  BidManagementServiceDetailState({
    this.responseStatus = Status.loading,
    this.invoice,
  });

  BidManagementServiceDetailState copyWith({
    Status? responseStatus,
    Invoicedetail? invoice,
  }) {
    return BidManagementServiceDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoice: invoice ?? this.invoice,
    );
  }
}
