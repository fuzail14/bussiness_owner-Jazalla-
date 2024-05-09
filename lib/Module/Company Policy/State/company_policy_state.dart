import '../../../../Constants/Person/person.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../Model/CompanyPolicy.dart';

class CompanyPolicyState {
  final Status responseStatus;
  final List<Companypolicies> companypolicies;
  final Person? person;

  CompanyPolicyState({
    this.responseStatus = Status.loading,
    this.companypolicies = const [],
    this.person,
  });

  CompanyPolicyState copyWith({
    Status? responseStatus,
    List<Companypolicies>? companypolicies,
    Person? person,
  }) {
    return CompanyPolicyState(
      responseStatus: responseStatus ?? this.responseStatus,
      companypolicies: companypolicies ?? this.companypolicies,
      person: person ?? this.person,
    );
  }
}
