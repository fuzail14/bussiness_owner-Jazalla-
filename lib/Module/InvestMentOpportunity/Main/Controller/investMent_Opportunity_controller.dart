import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Constants/constants.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/InvestMent Opportunity Repo/investment_opportunity_repository.dart';
import '../Model/InvestMentOpportunity.dart';

final investMentOpportunityStateProvider = StateNotifierProvider.autoDispose<
    InvestMentOpportunityController, InvestMentOpportunityState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('User data is not available');
  }
  return InvestMentOpportunityController(person: person);
}, dependencies: [personProvider]);

class InvestMentOpportunityState {
  final Status responseStatus;
  final List<Investments> investmentsList;

  InvestMentOpportunityState(
      {this.responseStatus = Status.loading, this.investmentsList = const []});

  InvestMentOpportunityState copyWith(
      {Status? responseStatus, List<Investments>? investmentsList}) {
    return InvestMentOpportunityState(
      responseStatus: responseStatus ?? this.responseStatus,
      investmentsList: investmentsList ?? this.investmentsList,
    );
  }
}

class InvestMentOpportunityController
    extends StateNotifier<InvestMentOpportunityState> {
  final investMentOpportunityRepository = InvestMentOpportunityRepository();
  // final String bearerToken;
  final Person person;
  InvestMentOpportunityController({required this.person})
      : super(InvestMentOpportunityState()) {
    _loadInvestMentOpportunities();
  }

  Future<void> _loadInvestMentOpportunities() async {
    setResponseStatus(Status.loading);
    try {
      final value =
          await investMentOpportunityRepository.InvestMentOpportunityResponse(
              bearerToken: person.Bearer);
      state = state.copyWith(
        investmentsList: value.investments,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  setResponseStatus(Status val) {
    state.copyWith(responseStatus: val);
  }
}
