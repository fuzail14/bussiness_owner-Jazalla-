import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class InvoiceManagementProcurementState {
  final Status responseStatus;
  final List<Invoices> invoices;

  InvoiceManagementProcurementState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  InvoiceManagementProcurementState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return InvoiceManagementProcurementState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
