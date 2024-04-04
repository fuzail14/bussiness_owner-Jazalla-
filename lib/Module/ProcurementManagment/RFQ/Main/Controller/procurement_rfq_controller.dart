import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Module/BussinesCommunity/Main/Model/BussinesCommunity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Repo/Procurement Managment/RFQ/rfq_repository.dart';
import '../Model/Request4Quotation.dart';

class ProcuremenetRFQState {
  final Status responseStatus;
  final List<RequestForQuotation> requestForQuotation;
  final String secondFilterval;
  final Person person;
  int? selectedFilterIndex;
  bool isFilterSelected;

  int? selectedSectorId;
  int? selectedIndustryId;
  int? selectedProviderId;
  final int selectedIndex;

  ProcuremenetRFQState(
      {this.responseStatus = Status.loading,
      this.requestForQuotation = const [],
      this.secondFilterval = 'Buyer',
      required this.person,
      this.selectedFilterIndex,
      this.isFilterSelected = false,
      this.selectedSectorId,
      this.selectedIndustryId,
      this.selectedProviderId,
      this.selectedIndex = 0});

  ProcuremenetRFQState copyWith(
      {Status? responseStatus,
      List<RequestForQuotation>? requestForQuotation,
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
    return ProcuremenetRFQState(
        responseStatus: responseStatus ?? this.responseStatus,
        requestForQuotation: requestForQuotation ?? this.requestForQuotation,
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

class ProcuremenetRFQController extends StateNotifier<ProcuremenetRFQState> {
  final requestForQuotationRepository = RequestForQuotationRepository();

  ProcuremenetRFQController(Person person)
      : super(ProcuremenetRFQState(person: person)) {
    request4InformationViewApi(
        userId: person.data!.id, bearerToken: person.Bearer);
  }
  final TextEditingController searchController = TextEditingController();

  Future<void> request4InformationViewApi(
      {required userId, required bearerToken}) async {
    setResponseStatus(Status.loading);
    try {
      final value = await requestForQuotationRepository.request4QuotationApi(
        userId: userId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        requestForQuotation: value.requestForQuotation,
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
    ProcuremenetRFQController, ProcuremenetRFQState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ProcuremenetRFQController(person);
}, dependencies: [personProvider]);
