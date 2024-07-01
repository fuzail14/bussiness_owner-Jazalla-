import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Main/Model/Invoice.dart';

class ContractManagementServiceState {
  final Status responseStatus;
  final List<Invoices> invoices;

  ContractManagementServiceState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
  });

  ContractManagementServiceState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
  }) {
    return ContractManagementServiceState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
    );
  }
}
