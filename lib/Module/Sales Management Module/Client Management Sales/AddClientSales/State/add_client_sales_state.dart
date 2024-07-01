import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';

class AddClientSalesState {
  final Status responseStatus;
  final List<RequestForInformation> request4Information;

  final int selectedIndex;

  AddClientSalesState(
      {this.responseStatus = Status.loading,
      List<RequestForInformation>? request4Information,
      this.selectedIndex = 0})
      : request4Information = request4Information ?? [];

  AddClientSalesState copyWith(
      {Status? responseStatus,
      List<RequestForInformation>? request4Information,
      int? selectedIndex}) {
    return AddClientSalesState(
        responseStatus: responseStatus ?? this.responseStatus,
        request4Information: request4Information ?? this.request4Information,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
