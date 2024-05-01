import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../Model/LeaveManagment.dart';

class LeaveManagmentState {
  final Status responseStatus;
  final List<Employeeleave> employeeleave;
  final Person? person;

  LeaveManagmentState({
    this.responseStatus = Status.loading,
    this.employeeleave = const [],
    this.person,
  });

  LeaveManagmentState copyWith({
    Status? responseStatus,
    List<Employeeleave>? employeeleave,
    Person? person,
  }) {
    return LeaveManagmentState(
      responseStatus: responseStatus ?? this.responseStatus,
      employeeleave: employeeleave ?? this.employeeleave,
      person: person ?? this.person,
    );
  }
}
