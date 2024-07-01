import '../../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';

class AddServiceProviderState {
  final Status responseStatus;
  final List<RequestForInformation> request4Information;

  final int selectedIndex;

  AddServiceProviderState(
      {this.responseStatus = Status.loading,
      List<RequestForInformation>? request4Information,
      this.selectedIndex = 0})
      : request4Information = request4Information ?? [];

  AddServiceProviderState copyWith(
      {Status? responseStatus,
      List<RequestForInformation>? request4Information,
      int? selectedIndex}) {
    return AddServiceProviderState(
        responseStatus: responseStatus ?? this.responseStatus,
        request4Information: request4Information ?? this.request4Information,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
