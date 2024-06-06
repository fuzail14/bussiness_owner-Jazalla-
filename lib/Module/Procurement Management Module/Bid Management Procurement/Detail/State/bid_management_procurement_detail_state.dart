import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Detail/Model/InvoiceDetail.dart';

class BidManagementProcurementDetailState {
  final Status responseStatus;
  final Invoicedetail? invoice;

  BidManagementProcurementDetailState({
    this.responseStatus = Status.loading,
    this.invoice,
  });

  BidManagementProcurementDetailState copyWith({
    Status? responseStatus,
    Invoicedetail? invoice,
  }) {
    return BidManagementProcurementDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoice: invoice ?? this.invoice,
    );
  }
}
