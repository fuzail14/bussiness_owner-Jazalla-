import '../../../Data/Api Resp/api_response.dart';

class EmployeeCenterState {
  final Status responseStatus;

  EmployeeCenterState({
    this.responseStatus = Status.loading,
  });

  EmployeeCenterState copyWith({
    Status? responseStatus,
  }) {
    return EmployeeCenterState(
      responseStatus: responseStatus ?? this.responseStatus,
    );
  }
}
