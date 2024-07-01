import '../../../../../../../Data/Api Resp/api_response.dart';

import '../../../../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';

class ServiceProviderRecievedInvitationState {
  final Status responseStatus;
  final List<RequestForInformation> request4Information;

  final int selectedIndex;

  ServiceProviderRecievedInvitationState(
      {this.responseStatus = Status.loading,
      List<RequestForInformation>? request4Information,
      this.selectedIndex = 0})
      : request4Information = request4Information ?? [];

  ServiceProviderRecievedInvitationState copyWith(
      {Status? responseStatus,
      List<RequestForInformation>? request4Information,
      int? selectedIndex}) {
    return ServiceProviderRecievedInvitationState(
        responseStatus: responseStatus ?? this.responseStatus,
        request4Information: request4Information ?? this.request4Information,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
