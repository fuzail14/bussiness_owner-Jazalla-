import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/Procurement Managment/RFI/DetailRepo/rfx_managment_rfi_detail_repository.dart';
import '../Model/RFIDetail.dart';

class RFXManagmentRFIDetailState {
  final Status responseStatus;
  final List<RequestForInformationDetail> rfxManagmentRFIDetail;

  RFXManagmentRFIDetailState({
    this.responseStatus = Status.loading,
    this.rfxManagmentRFIDetail = const [],
  });

  RFXManagmentRFIDetailState copyWith({
    Status? responseStatus,
    List<RequestForInformationDetail>? rfxManagmentRFIDetail,
  }) {
    return RFXManagmentRFIDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      rfxManagmentRFIDetail:
          rfxManagmentRFIDetail ?? this.rfxManagmentRFIDetail,
    );
  }
}

class RFXManagmentRFIDetailNotifier
    extends StateNotifier<RFXManagmentRFIDetailState> {
  RFXManagmentRFIDetailNotifier({
    required int rfiId,
  }) : super(RFXManagmentRFIDetailState()) {
    rfiDetailViewApi(rfiId: rfiId);
  }

  final rFXManagmentRFIDetailRepository = RFXManagmentRFIDetailRepository();

  Future<void> rfiDetailViewApi({required int rfiId}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await rFXManagmentRFIDetailRepository.rfiDetailApi(rfiId: rfiId);
      state = state.copyWith(
        rfxManagmentRFIDetail: value.requestForInformationDetail,
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

final rFXManagmentRFIDetailProvider = StateNotifierProvider<
    RFXManagmentRFIDetailNotifier, RFXManagmentRFIDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final rfiId = args['rfiId'] as int;

  return RFXManagmentRFIDetailNotifier(
    rfiId: rfiId,
  );
}, dependencies: [routeArgsProvider]);
