import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class InventoryManagementSalesState {
  final Status responseStatus;
  final List<Invoices> invoices;

  InventoryManagementSalesState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  InventoryManagementSalesState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return InventoryManagementSalesState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
