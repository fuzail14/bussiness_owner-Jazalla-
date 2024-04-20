import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../Repo/Procurement Managment/RFI/DetailRepo/rfx_managment_rfi_detail_repository.dart';
import '../State/salary_payslip_detail_state.dart';

class SalaryPaySlipDetailNotifier
    extends StateNotifier<SalaryPaySlipDetailState> {
  SalaryPaySlipDetailNotifier({
    required int rfiId,
  }) : super(SalaryPaySlipDetailState()) {
    rfiDetailViewApi(rfiId: rfiId);
  }

  final rFXManagmentRFIDetailRepository = RFXManagmentRFIDetailRepository();

  Future<void> rfiDetailViewApi({required int rfiId}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await rFXManagmentRFIDetailRepository.rfiDetailApi(rfiId: rfiId);
      state = state.copyWith(
        salaryPaySlipDetail: value.requestForInformationDetail,
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

final salaryPaySlipDetailProvider = StateNotifierProvider<
    SalaryPaySlipDetailNotifier, SalaryPaySlipDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final rfiId = args['sId'] as int;

  return SalaryPaySlipDetailNotifier(
    rfiId: rfiId,
  );
}, dependencies: [routeArgsProvider]);
