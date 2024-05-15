import '../../../../Constants/Person/person.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../Model/ApprovalAuthority.dart';

class ApprovalAuthorityState {
  final Status responseStatus;
  final List<Approvalauthorities> approvalauthorities;

  ApprovalAuthorityState({
    this.responseStatus = Status.loading,
    this.approvalauthorities = const [],
  });

  ApprovalAuthorityState copyWith({
    Status? responseStatus,
    List<Approvalauthorities>? approvalauthorities,
  }) {
    return ApprovalAuthorityState(
      responseStatus: responseStatus ?? this.responseStatus,
      approvalauthorities: approvalauthorities ?? this.approvalauthorities,
    );
  }
}
