import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';

class UserManagementState {
  final Status responseStatus;
  final List<RequestForInformation> request4Informatio;
  final Person? person;
  final String department;

  final String function;

  UserManagementState({
    this.responseStatus = Status.loading,
    this.request4Informatio = const [],
    this.person,
    this.department = 'Accounting Department',
    this.function = 'Accounting Management',
  });

  UserManagementState copyWith({
    Status? responseStatus,
    List<RequestForInformation>? request4Informatio,
    Person? person,
    String? department,
    List<String>? currentOptions,
    String? function,
  }) {
    return UserManagementState(
      responseStatus: responseStatus ?? this.responseStatus,
      request4Informatio: request4Informatio ?? this.request4Informatio,
      person: person ?? this.person,
      department: department ?? this.department,
      function: function ?? this.function,
    );
  }
}
