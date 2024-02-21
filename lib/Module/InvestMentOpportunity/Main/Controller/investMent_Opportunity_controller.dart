import 'dart:developer';
import 'package:flutter/material.dart';
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
  final List<Isic4MainActivities>? isic4MainActivities;
  final List<Industries>? industries;
  final int? selectedSectorId;
  final int? selectedIndustryId;

  InvestMentOpportunityState({
    this.responseStatus = Status.loading,
    this.investmentsList = const [],
    this.isic4MainActivities = const [],
    this.industries = const [],
    this.selectedSectorId,
    this.selectedIndustryId,
  });

  InvestMentOpportunityState copyWith({
    Status? responseStatus,
    List<Investments>? investmentsList,
    List<Isic4MainActivities>? isic4MainActivities,
    List<Industries>? industries,
    int? selectedSectorId,
    int? selectedIndustryId,
  }) {
    return InvestMentOpportunityState(
        responseStatus: responseStatus ?? this.responseStatus,
        investmentsList: investmentsList ?? this.investmentsList,
        isic4MainActivities: isic4MainActivities ?? this.isic4MainActivities,
        industries: industries ?? this.industries,
        selectedSectorId: selectedSectorId ?? this.selectedSectorId,
        selectedIndustryId: selectedIndustryId ?? this.selectedIndustryId);
  }
}

class InvestMentOpportunityController
    extends StateNotifier<InvestMentOpportunityState> {
  final investMentOpportunityRepository = InvestMentOpportunityRepository();
  final TextEditingController searchController = TextEditingController();
  // final String bearerToken;
  final Person person;
  InvestMentOpportunityController({required this.person})
      : super(InvestMentOpportunityState()) {
    loadInvestMentOpportunities();
  }

  Future<void> loadInvestMentOpportunities() async {
    setResponseStatus(Status.loading);
    try {
      final value =
          await investMentOpportunityRepository.InvestMentOpportunityResponse(
              bearerToken: person.Bearer);
      state = state.copyWith(
        investmentsList: value.investments,
        isic4MainActivities: value.isic4MainActivities,
        industries: value.industries,
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

  investmentOpportunitySearchApi({
    String? query,
  }) async {
    if (query == null || query.isEmpty) {
      // If the search query is empty, we might want to load the initial data again
      loadInvestMentOpportunities();
    } else {
      setResponseStatus(Status.loading);
      state.investmentsList.clear();

      try {
        final value = await investMentOpportunityRepository
            .investmentOpportunitySearchApi(
          query: query,
          bearerToken: person.Bearer,
        );
        log('my val ${value.investments.toString()}');

        state = state.copyWith(
          investmentsList: value.investments,
          responseStatus: Status.completed,
        );
        log(state
            .copyWith(
              investmentsList: value.investments,
              responseStatus: Status.completed,
            )
            .toString());
      } catch (e, stackTrace) {
        setResponseStatus(Status.error);

        // log(e.toString());
        //log(stackTrace.toString());
      }
    }
  }

  void setSelectedSectorId(int? sectorId) {
    //state = state.copyWith(selectedSectorId: sectorId);

    final currentSelectedId = state.selectedSectorId;

    if (currentSelectedId == sectorId) {
      state = state.copyWith(selectedSectorId: 0);
      loadInvestMentOpportunities();
    } else {
      // Otherwise, select the tapped sector
      state = state.copyWith(selectedSectorId: sectorId);
      investMentOpportunityIsic4mainActivityFilterApi(sectorId!);
    }
  }

  void setSelectedIndustryId(int? sectorId) {
    //state = state.copyWith(selectedSectorId: sectorId);

    final currentSelectedId = state.selectedIndustryId;

    if (currentSelectedId == sectorId) {
      state = state.copyWith(selectedIndustryId: 0);
      loadInvestMentOpportunities();
    } else {
      // Otherwise, select the tapped sector
      state = state.copyWith(selectedIndustryId: sectorId);
      investMentOpportunityIndustryFilterApi(sectorId!);
    }
  }

  investMentOpportunityIsic4mainActivityFilterApi(
    int sectorId,
  ) async {
    setResponseStatus(Status.loading);
    state.investmentsList.clear();

    try {
      final value = await investMentOpportunityRepository
          .investMentOpportunityIsicFilterApi(
        isicId: sectorId,
        bearerToken: person.Bearer,
      );
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

  investMentOpportunityIndustryFilterApi(
    int industryId,
  ) async {
    setResponseStatus(Status.loading);
    state.investmentsList.clear();

    try {
      final value = await investMentOpportunityRepository
          .investMentOpportunityIndustryApi(
        industryId: industryId,
        bearerToken: person.Bearer,
      );
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

  investMentOpportunitySortApi({
    String? filtertype,
  }) async {
    log(filtertype!);
    setResponseStatus(Status.loading);
    state.investmentsList.clear();
    try {
      final value =
          await investMentOpportunityRepository.investMentOpportunitySortApi(
        type: filtertype,
        bearerToken: person.Bearer,
      );
      log(value.toString());

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

  List<Map<String, dynamic>> investmentSortList = [
    {'id': '1', 'name': 'Size Low To High', 'isChecked': false},
    {'id': '2', 'name': 'Newest', 'isChecked': false},
    {'id': '3', 'name': 'Oldest', 'isChecked': false},
    {'id': '4', 'name': 'From Z-A', 'isChecked': false},
    {'id': '5', 'name': 'From A-Z', 'isChecked': false},
  ];
}
