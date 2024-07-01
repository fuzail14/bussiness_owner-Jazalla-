import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class BidSalesResponseRecieveState {
  final Status responseStatus;
  final List<Invoices> invoices;

  BidSalesResponseRecieveState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  BidSalesResponseRecieveState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return BidSalesResponseRecieveState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
