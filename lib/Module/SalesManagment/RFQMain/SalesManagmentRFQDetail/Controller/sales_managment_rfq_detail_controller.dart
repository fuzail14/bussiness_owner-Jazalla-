import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/Procurement Managment/RFQ/DetailRepo/rfx_managment_RFQ_detail_repository.dart';
import '../../../../ProcurementManagment/RFQ/RFXManagmentRFQDetail/Model/RFQDetail.dart';

class SalesManagmentRFQDetailState {
  final Status responseStatus;
  final List<RfqDetail> salesManagmentRFQDetail;

  SalesManagmentRFQDetailState({
    this.responseStatus = Status.loading,
    this.salesManagmentRFQDetail = const [],
  });

  SalesManagmentRFQDetailState copyWith({
    Status? responseStatus,
    List<RfqDetail>? salesManagmentRFQDetail,
  }) {
    return SalesManagmentRFQDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      salesManagmentRFQDetail:
          salesManagmentRFQDetail ?? this.salesManagmentRFQDetail,
    );
  }
}

class SalesManagmentRFQDetailNotifier
    extends StateNotifier<SalesManagmentRFQDetailState> {
  SalesManagmentRFQDetailNotifier({
    required int rfqId,
  }) : super(SalesManagmentRFQDetailState()) {
    rFQDetailViewApi(rfqId: rfqId);
  }

  final salesManagmentRFQDetailRepository = RFXManagmentRFQDetailRepository();

  Future<void> rFQDetailViewApi({required int rfqId}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await salesManagmentRFQDetailRepository.rfqDetailApi(rfqId: rfqId);
      state = state.copyWith(
        salesManagmentRFQDetail: value.rfqDetail,
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

final salesManagmentRFQDetailProvider = StateNotifierProvider.autoDispose<
    SalesManagmentRFQDetailNotifier, SalesManagmentRFQDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final rfqId = args['rfqId'] as int;

  return SalesManagmentRFQDetailNotifier(
    rfqId: rfqId,
  );
}, dependencies: [routeArgsProvider]);
