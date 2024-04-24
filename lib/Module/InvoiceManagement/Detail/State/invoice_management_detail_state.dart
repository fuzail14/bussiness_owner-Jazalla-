import '../../../../Data/Api Resp/api_response.dart';
import '../../../ProcurementManagment/RFI/RfxManagmentRFIDetail/Model/RFIDetail.dart';

class InvoiceManagementDetailState {
  final Status responseStatus;
  final List<RequestForInformationDetail> InvoiceManagementDetail;

  InvoiceManagementDetailState({
    this.responseStatus = Status.loading,
    this.InvoiceManagementDetail = const [],
  });

  InvoiceManagementDetailState copyWith({
    Status? responseStatus,
    List<RequestForInformationDetail>? InvoiceManagementDetail,
  }) {
    return InvoiceManagementDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      InvoiceManagementDetail:
          InvoiceManagementDetail ?? this.InvoiceManagementDetail,
    );
  }
}
