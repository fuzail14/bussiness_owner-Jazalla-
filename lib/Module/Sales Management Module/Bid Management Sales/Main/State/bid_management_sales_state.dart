import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class BidManagementSalesState {
  final Status responseStatus;
  final List<Invoices> invoices;

  BidManagementSalesState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  BidManagementSalesState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return BidManagementSalesState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
