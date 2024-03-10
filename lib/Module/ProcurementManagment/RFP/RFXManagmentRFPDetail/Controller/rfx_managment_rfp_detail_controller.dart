import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/Procurement Managment/RFP/DetailRepo/rfx_managment_rfp_detail_repository.dart';
import '../Model/RFPDetail.dart';

class RFXManagmentRFPDetailState {
  final Status responseStatus;
  final List<RfpDetail> rfxManagmentRFPDetail;

  RFXManagmentRFPDetailState({
    this.responseStatus = Status.loading,
    this.rfxManagmentRFPDetail = const [],
  });

  RFXManagmentRFPDetailState copyWith({
    Status? responseStatus,
    List<RfpDetail>? rfxManagmentRFPDetail,
  }) {
    return RFXManagmentRFPDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      rfxManagmentRFPDetail:
          rfxManagmentRFPDetail ?? this.rfxManagmentRFPDetail,
    );
  }
}

class RFXManagmentRFPDetailNotifier
    extends StateNotifier<RFXManagmentRFPDetailState> {
  RFXManagmentRFPDetailNotifier({
    required int rfpId,
  }) : super(RFXManagmentRFPDetailState()) {
    rFPDetailViewApi(rfpId: rfpId);
  }

  final rFXManagmentRFPDetailRepository = RFXManagmentRFPDetailRepository();

  Future<void> rFPDetailViewApi({required int rfpId}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await rFXManagmentRFPDetailRepository.rfpDetailApi(rfpId: rfpId);
      state = state.copyWith(
        rfxManagmentRFPDetail: value.rfpDetail,
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

final rFXManagmentRFPDetailProvider = StateNotifierProvider.autoDispose<
    RFXManagmentRFPDetailNotifier, RFXManagmentRFPDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final rfpId = args['rfpId'] as int;

  return RFXManagmentRFPDetailNotifier(
    rfpId: rfpId,
  );
}, dependencies: [routeArgsProvider]);
