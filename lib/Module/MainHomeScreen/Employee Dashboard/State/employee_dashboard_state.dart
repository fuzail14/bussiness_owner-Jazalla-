import 'package:bussines_owner/Module/Event/Model/EmployeeEvenyt.dart';

import '../../../../Constants/Person/person.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../Model/EmployeeAnnouncement.dart';
import '../Model/EmployeeMeeting.dart';

class EmployeeDashboardState {
  final Status responseStatus;
  final List<Employeeannouncments> employeeannouncments;
  final List<Employeemeetings> employeemeetings;

  EmployeeDashboardState({
    this.responseStatus = Status.loading,
    this.employeeannouncments = const [],
    this.employeemeetings = const [],
  });

  EmployeeDashboardState copyWith(
      {Status? responseStatus,
      List<Employeeannouncments>? employeeannouncments,
      final List<Employeemeetings>? employeemeetings}) {
    return EmployeeDashboardState(
      responseStatus: responseStatus ?? this.responseStatus,
      employeeannouncments: employeeannouncments ?? this.employeeannouncments,
      employeemeetings: employeemeetings ?? this.employeemeetings,
    );
  }
}
