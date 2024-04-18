import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';

class LeaveCreateState {
  final Status responseStatus;
  final List<RequestForInformation> request4Informatio;
  final Person? person;
  final String leaveType;

  LeaveCreateState(
      {this.responseStatus = Status.loading,
      this.request4Informatio = const [],
      this.person,
      this.leaveType = 'Casual Leave'});

  LeaveCreateState copyWith({
    Status? responseStatus,
    List<RequestForInformation>? request4Informatio,
    Person? person,
    String? leaveType,
  }) {
    return LeaveCreateState(
        responseStatus: responseStatus ?? this.responseStatus,
        request4Informatio: request4Informatio ?? this.request4Informatio,
        person: person ?? this.person,
        leaveType: leaveType ?? this.leaveType);
  }
}
