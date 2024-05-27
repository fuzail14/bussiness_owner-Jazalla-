import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/Person/person.dart';
import 'package:bussines_owner/Constants/Person/person_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Providers/argument_provider.dart';
import '../../../../Repo/Tenders Repo/tender_detail_repository.dart';
import '../Model/TenderDetail.dart';

final tenderDetailProvider =
    StateNotifierProvider<TenderDetailController, TenderDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final person = ref.read(personProvider);

  final tenderId = args['tenderId'] as int;

  return TenderDetailController(tenderId: tenderId, person: person);
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
  final Person? person;

  TenderDetailController({required this.tenderId, required this.person})
      : super(TenderDetailState()) {
    _loadTenderDetail();
  }

  Future<void> _loadTenderDetail() async {
    setResponseStatus(Status.loading);
    try {
      final value = await tenderDetailRepository.tenderDetailViewApi(
          tenderId: tenderId, bearerToken: person!.Bearer);
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
