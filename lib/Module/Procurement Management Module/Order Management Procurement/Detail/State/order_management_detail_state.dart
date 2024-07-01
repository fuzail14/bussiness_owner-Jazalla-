import 'package:bussines_owner/Module/InvoiceManagement/Main/Model/Invoice.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../InvoiceManagement/Detail/Model/InvoiceDetail.dart';

class OrderManagementDetailState {
  final Status responseStatus;
  final Invoicedetail? invoice;

  OrderManagementDetailState({
    this.responseStatus = Status.loading,
    this.invoice,
  });

  OrderManagementDetailState copyWith({
    Status? responseStatus,
    Invoicedetail? invoice,
  }) {
    return OrderManagementDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      invoice: invoice ?? this.invoice,
    );
  }
}
