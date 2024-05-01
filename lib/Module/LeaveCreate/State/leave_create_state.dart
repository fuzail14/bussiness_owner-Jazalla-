import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';
import '../Model/leave_type.dart';

class LeaveCreateState {
  final Status responseStatus;
  final List<Allleavetypes> leavetype;
  final Person? person;
  final String leaveType;

  LeaveCreateState(
      {this.responseStatus = Status.loading,
      this.leavetype = const [],
      this.person,
      this.leaveType = 'Casual Leave'});

  LeaveCreateState copyWith({
    Status? responseStatus,
    List<Allleavetypes>? leavetype,
    Person? person,
    String? leaveType,
  }) {
    return LeaveCreateState(
        responseStatus: responseStatus ?? this.responseStatus,
        leavetype: leavetype ?? this.leavetype,
        person: person ?? this.person,
        leaveType: leaveType ?? this.leaveType);
  }
}
