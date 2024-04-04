import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Module/BussinesCommunity/Main/Model/BussinesCommunity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Repo/Procurement Managment/RFP/RFP_repository.dart';
import '../Model/Request4Proposal.dart';

class ProcuremenetRFPState {
  final Status responseStatus;
  final List<RequestForProposal> requestForProposal;
  final String secondFilterval;
  final Person person;
  int? selectedFilterIndex;
  bool isFilterSelected;

  int? selectedSectorId;
  int? selectedIndustryId;
  int? selectedProviderId;
  final int selectedIndex;

  ProcuremenetRFPState(
      {this.responseStatus = Status.loading,
      this.requestForProposal = const [],
      this.secondFilterval = 'Buyer',
      required this.person,
      this.selectedFilterIndex,
      this.isFilterSelected = false,
      this.selectedSectorId,
      this.selectedIndustryId,
      this.selectedProviderId,
      this.selectedIndex = 0});

  ProcuremenetRFPState copyWith(
      {Status? responseStatus,
      List<RequestForProposal>? requestForProposal,
      String? secondFilterval,
      Person? person,
      int? selectedFilterIndex,
      bool? isFilterSelected,
      List<Isic4MainActivities>? isic4MainActivities,
      List<Industries>? industries,
      int? selectedSectorId,
      int? selectedIndustryId,
      int? selectedProviderId,
      int? selectedIndex}) {
    return ProcuremenetRFPState(
        responseStatus: responseStatus ?? this.responseStatus,
        requestForProposal: requestForProposal ?? this.requestForProposal,
        secondFilterval: secondFilterval ?? this.secondFilterval,
        person: person ?? this.person,
        selectedFilterIndex: selectedFilterIndex ?? this.selectedFilterIndex,
        isFilterSelected: isFilterSelected ?? this.isFilterSelected,
        selectedSectorId: selectedSectorId ?? this.selectedSectorId,
        selectedIndustryId: selectedIndustryId ?? this.selectedIndustryId,
        selectedProviderId: selectedProviderId ?? this.selectedProviderId,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}

class ProcuremenetRFPController extends StateNotifier<ProcuremenetRFPState> {
  final requestForProposalRepository = RequestForProposalRepository();

  ProcuremenetRFPController(Person person)
      : super(ProcuremenetRFPState(person: person)) {
    request4ProposalViewApi(
        userId: person.data!.id, bearerToken: person.Bearer);
  }
  final TextEditingController searchController = TextEditingController();

  Future<void> request4ProposalViewApi(
      {required userId, required bearerToken}) async {
    setResponseStatus(Status.loading);
    try {
      final value = await requestForProposalRepository.request4ProposalApi(
        userId: userId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        requestForProposal: value.requestForProposal,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  void setTabBarStatus(int val) {
    state = state.copyWith(selectedIndex: val);
  }
}

final ProcuremenetRFpProvider = StateNotifierProvider.autoDispose<
    ProcuremenetRFPController, ProcuremenetRFPState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ProcuremenetRFPController(person);
}, dependencies: [personProvider]);
