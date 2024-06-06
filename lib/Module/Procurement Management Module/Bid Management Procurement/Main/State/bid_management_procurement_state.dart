import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class BidManagementProcurementState {
  final Status responseStatus;
  final List<Invoices> invoices;

  BidManagementProcurementState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  BidManagementProcurementState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return BidManagementProcurementState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
