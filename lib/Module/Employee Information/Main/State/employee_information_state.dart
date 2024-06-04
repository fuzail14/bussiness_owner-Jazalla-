import '../../../../../Constants/Person/person.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../Model/ManageEmployeeInformation.dart';

class EmployeeInformationState {
  final Status responseStatus;
  final List<Employeeinformation> employeesInfo;
  final Person? person;

  EmployeeInformationState({
    this.responseStatus = Status.loading,
    this.employeesInfo = const [],
    this.person,
  });

  EmployeeInformationState copyWith({
    Status? responseStatus,
    List<Employeeinformation>? employeesInfo,
    Person? person,
  }) {
    return EmployeeInformationState(
      responseStatus: responseStatus ?? this.responseStatus,
      employeesInfo: employeesInfo ?? this.employeesInfo,
      person: person ?? this.person,
    );
  }
}
