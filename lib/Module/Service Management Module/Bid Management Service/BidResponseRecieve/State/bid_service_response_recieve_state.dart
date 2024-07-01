import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class BidServiceResponseRecieveState {
  final Status responseStatus;
  final List<Invoices> invoices;

  BidServiceResponseRecieveState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  BidServiceResponseRecieveState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return BidServiceResponseRecieveState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
