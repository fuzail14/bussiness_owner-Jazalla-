import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/Procurement Managment/RFP/DetailRepo/rfx_managment_rfp_detail_repository.dart';
import '../../../../ProcurementManagment/RFP/RFXManagmentRFPDetail/Model/RFPDetail.dart';

class SerivceManagmentRFPDetailState {
  final Status responseStatus;
  final List<RfpDetail> serviceManagmentRFPDetail;

  SerivceManagmentRFPDetailState({
    this.responseStatus = Status.loading,
    this.serviceManagmentRFPDetail = const [],
  });

  SerivceManagmentRFPDetailState copyWith({
    Status? responseStatus,
    List<RfpDetail>? serviceManagmentRFPDetail,
  }) {
    return SerivceManagmentRFPDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      serviceManagmentRFPDetail:
          serviceManagmentRFPDetail ?? this.serviceManagmentRFPDetail,
    );
  }
}

class ServiceManagmentRFPDetailNotifier
    extends StateNotifier<SerivceManagmentRFPDetailState> {
  ServiceManagmentRFPDetailNotifier({
    required int rfpId,
  }) : super(SerivceManagmentRFPDetailState()) {
    rFPDetailViewApi(rfpId: rfpId);
  }

  final rFXManagmentRFPDetailRepository = RFXManagmentRFPDetailRepository();

  Future<void> rFPDetailViewApi({required int rfpId}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await rFXManagmentRFPDetailRepository.rfpDetailApi(rfpId: rfpId);
      state = state.copyWith(
        serviceManagmentRFPDetail: value.rfpDetail,
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

final serviceManagmentRFPDetailProvider = StateNotifierProvider.autoDispose<
    ServiceManagmentRFPDetailNotifier, SerivceManagmentRFPDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final rfpId = args['rfpId'] as int;

  return ServiceManagmentRFPDetailNotifier(
    rfpId: rfpId,
  );
}, dependencies: [routeArgsProvider]);
