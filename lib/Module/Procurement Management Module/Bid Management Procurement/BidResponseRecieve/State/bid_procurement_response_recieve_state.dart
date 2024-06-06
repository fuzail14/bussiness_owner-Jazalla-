import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class BidProcurementResponseRecieveState {
  final Status responseStatus;
  final List<Invoices> invoices;

  BidProcurementResponseRecieveState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  BidProcurementResponseRecieveState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return BidProcurementResponseRecieveState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
