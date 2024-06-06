import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class OrderManagementProcurementState {
  final Status responseStatus;
  final List<Invoices> invoices;

  OrderManagementProcurementState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  OrderManagementProcurementState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return OrderManagementProcurementState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
