import 'package:bussines_owner/Constants/Person/person.dart';
import 'package:bussines_owner/Module/ProcurementManagment/RFI/Main/Model/Request4Information.dart';
import '../../../../Data/Api Resp/api_response.dart';

class ApprovalAuthorityCreateState {
  final Status responseStatus;
  final List<RequestForInformation> request4Informatio;
  final Person? person;
  final String ApprovalAuthorityType;

  ApprovalAuthorityCreateState(
      {this.responseStatus = Status.loading,
      this.request4Informatio = const [],
      this.person,
      this.ApprovalAuthorityType = 'Casual ApprovalAuthority'});

  ApprovalAuthorityCreateState copyWith({
    Status? responseStatus,
    List<RequestForInformation>? request4Informatio,
    Person? person,
    String? ApprovalAuthorityType,
  }) {
    return ApprovalAuthorityCreateState(
        responseStatus: responseStatus ?? this.responseStatus,
        request4Informatio: request4Informatio ?? this.request4Informatio,
        person: person ?? this.person,
        ApprovalAuthorityType:
            ApprovalAuthorityType ?? this.ApprovalAuthorityType);
  }
}
