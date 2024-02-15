import 'dart:async';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Providers/argument_provider.dart';
import '../../../../Repo/InvestMent Opportunity Repo/investment_detail_repository.dart';
import '../Model/InvestmentDetail.dart';

final investmentPageProvider = StateNotifierProvider<
    InvestmentDetailPageController, InvestmentDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final Id = args['Id'] as int;
  final bearerToken = args['bearerToken'] as String;
  return InvestmentDetailPageController(
    Id: Id,
    bearerToken: bearerToken,
  );
}, dependencies: [routeArgsProvider]);

class InvestmentDetailState {
  final Status responseStatus;
  final List<Investment> investmentDetail;

  InvestmentDetailState({
    this.responseStatus = Status.loading,
    this.investmentDetail = const [],
  });

  InvestmentDetailState copyWith({
    Status? responseStatus,
    List<Investment>? investmentDetail,
  }) {
    return InvestmentDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      investmentDetail: investmentDetail ?? this.investmentDetail,
    );
  }
}

class InvestmentDetailPageController
    extends StateNotifier<InvestmentDetailState> {
  final investmentDetailRepository = InvestmentDetailRepository();
  final int Id;
  final String bearerToken;

  InvestmentDetailPageController({
    required this.Id,
    required this.bearerToken,
  }) : super(InvestmentDetailState()) {
    _loadServiceDetails();
  }

  Future<void> _loadServiceDetails() async {
    setResponseStatus(Status.loading);
    try {
      final value = await investmentDetailRepository.serviceDetailViewApi(
        Id: Id,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        investmentDetail: value.investment,
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
