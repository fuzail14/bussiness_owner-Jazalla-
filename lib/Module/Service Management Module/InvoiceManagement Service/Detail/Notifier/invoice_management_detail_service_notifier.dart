import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/Invoice Managemet/invoice_managment_repository.dart';
import '../State/invoice_management_detail_service_state.dart';

class InvoiceManagementDetailServiceNotifier
    extends StateNotifier<InvoiceManagementDetailServiceState> {
  InvoiceManagementDetailServiceNotifier({
    required int invoiceId,
  }) : super(InvoiceManagementDetailServiceState()) {
    invoiceDetailViewApi(invoiceId: invoiceId);
  }

  final invoiceManagmentRepository = InvoiceManagmentRepository();

  Future<void> invoiceDetailViewApi({required int invoiceId}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await invoiceManagmentRepository.invoiceDetail(invoiceId: invoiceId);
      state = state.copyWith(
        invoice: value.invoicedetail,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);

      log(e.toString());
      log(stackTrace.toString());
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }
}

final invoiceManagementDetailServiceProvider =
    StateNotifierProvider.autoDispose<InvoiceManagementDetailServiceNotifier,
        InvoiceManagementDetailServiceState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final invoiceId = args['invoiceId'] as int;

  return InvoiceManagementDetailServiceNotifier(
    invoiceId: invoiceId,
  );
}, dependencies: [routeArgsProvider]);
