import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class OrderManagementSalesState {
  final Status responseStatus;
  final List<Invoices> invoices;

  OrderManagementSalesState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  OrderManagementSalesState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return OrderManagementSalesState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
