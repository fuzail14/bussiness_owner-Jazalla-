import '../../../../Constants/Person/person.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';
import '../Model/SalaryPaySlip.dart';

class SalaryPaySlipState {
  final Status responseStatus;
  final List<Payslips> payslips;
  final Person? person;

  SalaryPaySlipState({
    this.responseStatus = Status.loading,
    this.payslips = const [],
    this.person,
  });

  SalaryPaySlipState copyWith({
    Status? responseStatus,
    List<Payslips>? payslips,
    Person? person,
  }) {
    return SalaryPaySlipState(
      responseStatus: responseStatus ?? this.responseStatus,
      payslips: payslips ?? this.payslips,
      person: person ?? this.person,
    );
  }
}
