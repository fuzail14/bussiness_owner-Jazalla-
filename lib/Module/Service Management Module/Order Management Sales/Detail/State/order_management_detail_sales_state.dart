import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Detail/Model/InvoiceDetail.dart';

class OrderManagementDetailSalesState {
  final Status responseStatus;
  final Invoicedetail? invoice;

  OrderManagementDetailSalesState({
    this.responseStatus = Status.loading,
    this.invoice,
  });

  OrderManagementDetailSalesState copyWith({
    Status? responseStatus,
    Invoicedetail? invoice,
  }) {
    return OrderManagementDetailSalesState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoice: invoice ?? this.invoice,
    );
  }
}
