import '../../../../Constants/Person/person.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../Model/Invoice.dart';

class InvoiceManagementState {
  final Status responseStatus;
  final List<Invoices> invoices;
  final Person? person;

  InvoiceManagementState({
    this.responseStatus = Status.loading,
    this.invoices = const [],
    this.person,
  });

  InvoiceManagementState copyWith({
    Status? responseStatus,
    List<Invoices>? invoices,
    Person? person,
  }) {
    return InvoiceManagementState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoices: invoices ?? this.invoices,
      person: person ?? this.person,
    );
  }
}
