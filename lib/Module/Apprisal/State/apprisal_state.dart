import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../Model/EmployeeAppraisal.dart';

class ApprisalState {
  final Status responseStatus;
  final List<Appraisals> appraisals;
  final Person? person;

  ApprisalState({
    this.responseStatus = Status.loading,
    this.appraisals = const [],
    this.person,
  });

  ApprisalState copyWith({
    Status? responseStatus,
    List<Appraisals>? appraisals,
    Person? person,
  }) {
    return ApprisalState(
      responseStatus: responseStatus ?? this.responseStatus,
      appraisals: appraisals ?? this.appraisals,
      person: person ?? this.person,
    );
  }
}
