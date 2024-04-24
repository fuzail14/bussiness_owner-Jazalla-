import '../../../../Constants/Person/person.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';

class InvoiceManagementState {
  final Status responseStatus;
  final List<RequestForInformation> request4Informatio;
  final Person? person;

  InvoiceManagementState({
    this.responseStatus = Status.loading,
    this.request4Informatio = const [],
    this.person,
  });

  InvoiceManagementState copyWith({
    Status? responseStatus,
    List<RequestForInformation>? request4Informatio,
    Person? person,
  }) {
    return InvoiceManagementState(
      responseStatus: responseStatus ?? this.responseStatus,
      request4Informatio: request4Informatio ?? this.request4Informatio,
      person: person ?? this.person,
    );
  }
}
