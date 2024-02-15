import 'dart:async';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Providers/argument_provider.dart';
import '../../../../Repo/Tenders Repo/tender_detail_repository.dart';
import '../Model/TenderDetail.dart';

final tenderDetailProvider =
    StateNotifierProvider<TenderDetailController, TenderDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final tenderId = args['tenderId'] as int;
  final bearerToken = args['bearerToken'] as String;
  return TenderDetailController(
    tenderId: tenderId,
    Bearer: bearerToken,
  );
}, dependencies: [routeArgsProvider]);

class TenderDetailState {
  final Status responseStatus;
  final List<Tenderdetail> tenderDetail;

  TenderDetailState(
      {this.responseStatus = Status.loading, this.tenderDetail = const []});

  TenderDetailState copyWith(
      {Status? responseStatus, List<Tenderdetail>? tenderDetail}) {
    return TenderDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      tenderDetail: tenderDetail ?? this.tenderDetail,
    );
  }
}

class TenderDetailController extends StateNotifier<TenderDetailState> {
  final tenderDetailRepository = TenderDetailRepository();
  final int tenderId;
  final String Bearer;

  TenderDetailController({required this.tenderId, required this.Bearer})
      : super(TenderDetailState()) {
    _loadTenderDetail();
  }

  Future<void> _loadTenderDetail() async {
    setResponseStatus(Status.loading);
    try {
      final value = await tenderDetailRepository.tenderDetailViewApi(
          tenderId: tenderId, bearerToken: Bearer);
      state = state.copyWith(
        tenderDetail: value.tenderdetail,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());
      // Handle error
    }
  }

  setResponseStatus(Status val) {
    state.copyWith(responseStatus: val);
  }
}
