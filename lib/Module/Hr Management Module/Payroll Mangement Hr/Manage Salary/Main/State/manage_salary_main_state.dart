import '../../../../../../Constants/Person/person.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Employee Information/Main/Model/ManageEmployeeInformation.dart';

class ManageSalaryMainState {
  final Status responseStatus;
  final List<Employeeinformation> employeesInfo;

  ManageSalaryMainState({
    this.responseStatus = Status.loading,
    this.employeesInfo = const [],
  });

  ManageSalaryMainState copyWith({
    Status? responseStatus,
    List<Employeeinformation>? employeesInfo,
    Person? person,
  }) {
    return ManageSalaryMainState(
      responseStatus: responseStatus ?? this.responseStatus,
      employeesInfo: employeesInfo ?? this.employeesInfo,
    );
  }
}
