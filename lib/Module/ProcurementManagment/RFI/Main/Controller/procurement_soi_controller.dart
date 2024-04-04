import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Module/BussinesCommunity/Main/Model/BussinesCommunity.dart';
import 'package:bussines_owner/Repo/Bussines%20Communities%20Repository/bussines_communities_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Repo/Procurement Managment/RFI/rfi_repository.dart';
import '../Model/Request4Information.dart';

class ProcuremenetSoiState {
  final Status responseStatus;
  final List<RequestForInformation> request4Information;
  final String secondFilterval;
  final Person person;
  int? selectedFilterIndex;
  bool isFilterSelected;
  final List<Isic4MainActivities>? isic4MainActivities;
  final List<Industries>? industries;
  int? selectedSectorId;
  int? selectedIndustryId;
  int? selectedProviderId;
  final int selectedIndex;

  ProcuremenetSoiState(
      {this.responseStatus = Status.loading,
      List<RequestForInformation>? request4Information,
      this.secondFilterval = 'Buyer',
      required this.person,
      this.selectedFilterIndex,
      this.isFilterSelected = false,
      List<Isic4MainActivities>? isic4MainActivities,
      List<Industries>? industries,
      this.selectedSectorId,
      this.selectedIndustryId,
      this.selectedProviderId,
      this.selectedIndex = 0})
      : request4Information = request4Information ?? [],
        isic4MainActivities = isic4MainActivities ?? [],
        industries = industries ?? [];

  ProcuremenetSoiState copyWith(
      {Status? responseStatus,
      List<RequestForInformation>? request4Information,
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
    return ProcuremenetSoiState(
        responseStatus: responseStatus ?? this.responseStatus,
        request4Information: request4Information ?? this.request4Information,
        secondFilterval: secondFilterval ?? this.secondFilterval,
        person: person ?? this.person,
        selectedFilterIndex: selectedFilterIndex ?? this.selectedFilterIndex,
        isFilterSelected: isFilterSelected ?? this.isFilterSelected,
        isic4MainActivities: isic4MainActivities ?? this.isic4MainActivities,
        industries: industries ?? this.industries,
        selectedSectorId: selectedSectorId ?? this.selectedSectorId,
        selectedIndustryId: selectedIndustryId ?? this.selectedIndustryId,
        selectedProviderId: selectedProviderId ?? this.selectedProviderId,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}

class ProcuremenetSoiController extends StateNotifier<ProcuremenetSoiState> {
  final request4InformationRepository = Request4InformationRepository();

  ProcuremenetSoiController(Person person)
      : super(ProcuremenetSoiState(person: person)) {
    request4InformationViewApi(
        userId: person.data!.id, bearerToken: person.Bearer);
  }
  final TextEditingController searchController = TextEditingController();

  Future<void> request4InformationViewApi(
      {required userId, required bearerToken}) async {
    setResponseStatus(Status.loading);
    try {
      final value = await request4InformationRepository.request4InformationApi(
        userId: userId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        request4Information: value.requestForInformation,
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

final ProcuremenetSoiProvider = StateNotifierProvider.autoDispose<
    ProcuremenetSoiController, ProcuremenetSoiState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ProcuremenetSoiController(person);
}, dependencies: [personProvider]);
