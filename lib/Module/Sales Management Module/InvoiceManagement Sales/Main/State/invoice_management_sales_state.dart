import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class InvoiceManagementSalesState {
  final Status responseStatus;
  final List<Invoices> invoices;

  InvoiceManagementSalesState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  InvoiceManagementSalesState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return InvoiceManagementSalesState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
