import '../../../../Data/Api Resp/api_response.dart';
import '../../../ProcurementManagment/RFI/RfxManagmentRFIDetail/Model/RFIDetail.dart';

class SalaryPaySlipDetailState {
  final Status responseStatus;
  final List<RequestForInformationDetail> salaryPaySlipDetail;

  SalaryPaySlipDetailState({
    this.responseStatus = Status.loading,
    this.salaryPaySlipDetail = const [],
  });

  SalaryPaySlipDetailState copyWith({
    Status? responseStatus,
    List<RequestForInformationDetail>? salaryPaySlipDetail,
  }) {
    return SalaryPaySlipDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      salaryPaySlipDetail: salaryPaySlipDetail ?? this.salaryPaySlipDetail,
    );
  }
}
