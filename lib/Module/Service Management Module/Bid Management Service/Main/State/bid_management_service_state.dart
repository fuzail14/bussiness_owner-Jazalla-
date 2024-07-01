import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class BidManagementServiceState {
  final Status responseStatus;
  final List<Invoices> invoices;

  BidManagementServiceState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  BidManagementServiceState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return BidManagementServiceState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
