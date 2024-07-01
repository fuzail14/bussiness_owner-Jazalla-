import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';

class ClientRecievedInviationSalesState {
  final Status responseStatus;
  final List<RequestForInformation> request4Information;

  final int selectedIndex;

  ClientRecievedInviationSalesState(
      {this.responseStatus = Status.loading,
      List<RequestForInformation>? request4Information,
      this.selectedIndex = 0})
      : request4Information = request4Information ?? [];

  ClientRecievedInviationSalesState copyWith(
      {Status? responseStatus,
      List<RequestForInformation>? request4Information,
      String? secondFilterval,
      int? selectedIndex}) {
    return ClientRecievedInviationSalesState(
        responseStatus: responseStatus ?? this.responseStatus,
        request4Information: request4Information ?? this.request4Information,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
