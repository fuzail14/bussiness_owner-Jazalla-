import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';

class ClientRecievedInviationServiceState {
  final Status responseStatus;
  final List<RequestForInformation> request4Information;

  final int selectedIndex;

  ClientRecievedInviationServiceState(
      {this.responseStatus = Status.loading,
      List<RequestForInformation>? request4Information,
      this.selectedIndex = 0})
      : request4Information = request4Information ?? [];

  ClientRecievedInviationServiceState copyWith(
      {Status? responseStatus,
      List<RequestForInformation>? request4Information,
      String? secondFilterval,
      int? selectedIndex}) {
    return ClientRecievedInviationServiceState(
        responseStatus: responseStatus ?? this.responseStatus,
        request4Information: request4Information ?? this.request4Information,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
