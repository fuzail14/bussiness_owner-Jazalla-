import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/SalesManagment/RFI/DetailRepo/sales_managment_rfi_detail_repository.dart';
import '../Model/SalesManagmentRFIDetail.dart';

class SalesManagmentRFIDetailState {
  final Status responseStatus;
  final List<SalesManagmentRfiDetail> salesManagmentRFIDetail;

  SalesManagmentRFIDetailState({
    this.responseStatus = Status.loading,
    this.salesManagmentRFIDetail = const [],
  });

  SalesManagmentRFIDetailState copyWith({
    Status? responseStatus,
    List<SalesManagmentRfiDetail>? salesManagmentRFIDetail,
  }) {
    return SalesManagmentRFIDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      salesManagmentRFIDetail:
          salesManagmentRFIDetail ?? this.salesManagmentRFIDetail,
    );
  }
}

class SalesManagmentRFIDetailNotifier
    extends StateNotifier<SalesManagmentRFIDetailState> {
  SalesManagmentRFIDetailNotifier({
    required int rfiId,
  }) : super(SalesManagmentRFIDetailState()) {
    rfiDetailViewApi(rfiId: rfiId);
  }

  final salesManagmentRFIDetailRepository = SalesManagmentRFIDetailRepository();

  Future<void> rfiDetailViewApi({required int rfiId}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await salesManagmentRFIDetailRepository.rfiDetailApi(rfiId: rfiId);
      state = state.copyWith(
        salesManagmentRFIDetail: value.salesManagmentRfiDetail,
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

final salesManagmentRFIDetailProvider = StateNotifierProvider.autoDispose<
    SalesManagmentRFIDetailNotifier, SalesManagmentRFIDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final rfiId = args['rfiId'] as int;

  return SalesManagmentRFIDetailNotifier(
    rfiId: rfiId,
  );
}, dependencies: [routeArgsProvider]);
