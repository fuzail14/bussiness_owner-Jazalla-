import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';
import '../Model/AttendanceEmployee.dart';

class AttendanceManagmentState {
  final Status responseStatus;
  final List<Employeeattendance> employeeattendance;
  final Person? person;

  AttendanceManagmentState({
    this.responseStatus = Status.loading,
    this.employeeattendance = const [],
    this.person,
  });

  AttendanceManagmentState copyWith({
    Status? responseStatus,
    List<Employeeattendance>? employeeattendance,
    Person? person,
  }) {
    return AttendanceManagmentState(
      responseStatus: responseStatus ?? this.responseStatus,
      employeeattendance: employeeattendance ?? this.employeeattendance,
      person: person ?? this.person,
    );
  }
}
