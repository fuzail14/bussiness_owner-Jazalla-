import 'package:bussines_owner/Module/Holidays/Model/EmployeeHoliday.dart';

import '../../../../Constants/Person/person.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';

class EmployeesAssetState {
  final Status responseStatus;
  final List<Holidays> holidays;
  final Person? person;

  EmployeesAssetState({
    this.responseStatus = Status.loading,
    this.holidays = const [],
    this.person,
  });

  EmployeesAssetState copyWith({
    Status? responseStatus,
    List<Holidays>? holidays,
    Person? person,
  }) {
    return EmployeesAssetState(
      responseStatus: responseStatus ?? this.responseStatus,
      holidays: holidays ?? this.holidays,
      person: person ?? this.person,
    );
  }
}
