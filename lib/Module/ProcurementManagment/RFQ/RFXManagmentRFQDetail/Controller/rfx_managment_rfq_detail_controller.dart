import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/Procurement Managment/RFQ/DetailRepo/rfx_managment_RFQ_detail_repository.dart';
import '../Model/RFQDetail.dart';

class RFXManagmentRFQDetailState {
  final Status responseStatus;
  final List<RfqDetail> rfxManagmentRFQDetail;

  RFXManagmentRFQDetailState({
    this.responseStatus = Status.loading,
    this.rfxManagmentRFQDetail = const [],
  });

  RFXManagmentRFQDetailState copyWith({
    Status? responseStatus,
    List<RfqDetail>? rfxManagmentRFQDetail,
  }) {
    return RFXManagmentRFQDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      rfxManagmentRFQDetail:
          rfxManagmentRFQDetail ?? this.rfxManagmentRFQDetail,
    );
  }
}

class RFXManagmentRFQDetailNotifier
    extends StateNotifier<RFXManagmentRFQDetailState> {
  RFXManagmentRFQDetailNotifier({
    required int rfqId,
  }) : super(RFXManagmentRFQDetailState()) {
    rFQDetailViewApi(rfqId: rfqId);
  }

  final rfXManagmentRFQDetailRepository = RFXManagmentRFQDetailRepository();

  Future<void> rFQDetailViewApi({required int rfqId}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await rfXManagmentRFQDetailRepository.rfqDetailApi(rfqId: rfqId);
      state = state.copyWith(
        rfxManagmentRFQDetail: value.rfqDetail,
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

final rFXManagmentRFQDetailProvider = StateNotifierProvider.autoDispose<
    RFXManagmentRFQDetailNotifier, RFXManagmentRFQDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final rfqId = args['rfqId'] as int;

  return RFXManagmentRFQDetailNotifier(
    rfqId: rfqId,
  );
}, dependencies: [routeArgsProvider]);
