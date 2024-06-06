import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class ContractManagementProcurementState {
  final Status responseStatus;
  final List<Invoices> invoices;

  ContractManagementProcurementState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  ContractManagementProcurementState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return ContractManagementProcurementState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
