import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class InventoryManagementProcurementState {
  final Status responseStatus;
  final List<Invoices> invoices;

  InventoryManagementProcurementState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  InventoryManagementProcurementState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return InventoryManagementProcurementState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
