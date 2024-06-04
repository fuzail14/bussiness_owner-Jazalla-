import 'package:bussines_owner/Module/Event/Model/EmployeeEvenyt.dart';

import '../../../../Constants/Person/person.dart';
import '../../../../Data/Api Resp/api_response.dart';

class WarningState {
  final Status responseStatus;
  final List<Employeeevent> event;
  final Person? person;

  WarningState({
    this.responseStatus = Status.loading,
    this.event = const [],
    this.person,
  });

  WarningState copyWith({
    Status? responseStatus,
    List<Employeeevent>? event,
    Person? person,
  }) {
    return WarningState(
      responseStatus: responseStatus ?? this.responseStatus,
      event: event ?? this.event,
      person: person ?? this.person,
    );
  }
}
