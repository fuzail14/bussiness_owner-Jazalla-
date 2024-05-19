import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';
import '../Model/AllCompanyUsers.dart';

class UserManagementState {
  final Status responseStatus;
  final List<Companyusers> companyusers;

  final String department;

  final String function;

  UserManagementState({
    this.responseStatus = Status.loading,
    this.companyusers = const [],
    this.department = 'Accounting Department',
    this.function = 'Accounting Management',
  });

  UserManagementState copyWith({
    Status? responseStatus,
    List<Companyusers>? companyusers,
    String? department,
    List<String>? currentOptions,
    String? function,
  }) {
    return UserManagementState(
      responseStatus: responseStatus ?? this.responseStatus,
      companyusers: companyusers ?? this.companyusers,
      department: department ?? this.department,
      function: function ?? this.function,
    );
  }
}
