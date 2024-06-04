import '../../../../../Data/Api Resp/api_response.dart';
import '../Model/ManageEmployeeInfoDetail.dart';

class EmployeeInformationDetailState {
  final Status responseStatus;
  final List<Employeeinformationdetail> employeeinformationdetail;

  EmployeeInformationDetailState({
    this.responseStatus = Status.loading,
    this.employeeinformationdetail = const [],
  });

  EmployeeInformationDetailState copyWith({
    Status? responseStatus,
    List<Employeeinformationdetail>? employeeinformationdetail,
  }) {
    return EmployeeInformationDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      employeeinformationdetail:
          employeeinformationdetail ?? this.employeeinformationdetail,
    );
  }
}
