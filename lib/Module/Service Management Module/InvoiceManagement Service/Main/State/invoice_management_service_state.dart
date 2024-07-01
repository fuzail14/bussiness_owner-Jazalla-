import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class InvoiceManagementServiceState {
  final Status responseStatus;
  final List<Invoices> invoices;

  InvoiceManagementServiceState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  InvoiceManagementServiceState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return InvoiceManagementServiceState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
