import 'package:bussines_owner/Module/Holidays/Model/EmployeeHoliday.dart';

import '../../../../Constants/Person/person.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';

class EmployeeInformationState {
  final Status responseStatus;
  final List<Holidays> holidays;
  final Person? person;

  EmployeeInformationState({
    this.responseStatus = Status.loading,
    this.holidays = const [],
    this.person,
  });

  EmployeeInformationState copyWith({
    Status? responseStatus,
    List<Holidays>? holidays,
    Person? person,
  }) {
    return EmployeeInformationState(
      responseStatus: responseStatus ?? this.responseStatus,
      holidays: holidays ?? this.holidays,
      person: person ?? this.person,
    );
  }
}
