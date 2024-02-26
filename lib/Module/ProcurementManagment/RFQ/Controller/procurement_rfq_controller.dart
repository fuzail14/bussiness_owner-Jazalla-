import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Module/BussinesCommunity/Main/Model/BussinesCommunity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/Procurement Managment/RFQ/rfq_repository.dart';
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

  ProcuremenetRFQState(
      {this.responseStatus = Status.loading,
      this.requestForQuotation = const [],
      this.secondFilterval = 'Buyer',
      required this.person,
      this.selectedFilterIndex,
      this.isFilterSelected = false,
      this.selectedSectorId,
      this.selectedIndustryId,
      this.selectedProviderId});

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
      int? selectedProviderId}) {
    return ProcuremenetRFQState(
        responseStatus: responseStatus ?? this.responseStatus,
        requestForQuotation: requestForQuotation ?? this.requestForQuotation,
        secondFilterval: secondFilterval ?? this.secondFilterval,
        person: person ?? this.person,
        selectedFilterIndex: selectedFilterIndex ?? this.selectedFilterIndex,
        isFilterSelected: isFilterSelected ?? this.isFilterSelected,
        selectedSectorId: selectedSectorId ?? this.selectedSectorId,
        selectedIndustryId: selectedIndustryId ?? this.selectedIndustryId,
        selectedProviderId: selectedProviderId ?? this.selectedProviderId);
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

  // companyBussinesFilterApi({
  //   String? bussinestype,
  // }) async {
  //   setResponseStatus(Status.loading);
  //   state.companiesApiList.clear();

  //   try {
  //     final value = await bussinesCommunitiesRepo.bussinesTypeFilterApi(
  //       type: bussinestype,
  //       bearerToken: state.person.Bearer,
  //     );
  //     state = state.copyWith(
  //       companiesApiList: value.companies,
  //       responseStatus: Status.completed,
  //     );
  //   } catch (e, stackTrace) {
  //     setResponseStatus(Status.error);
  //     log(e.toString());
  //     log(stackTrace.toString());

  //     myToast(msg: e.toString());
  //   }
  // }

  // companyBussinesIsic4mainActivityFilterApi(
  //   int sectorId,
  // ) async {
  //   setResponseStatus(Status.loading);
  //   state.companiesApiList.clear();

  //   try {
  //     final value =
  //         await bussinesCommunitiesRepo.bussinesCommunityIsicFilterApi(
  //       isicId: sectorId,
  //       bearerToken: state.person.Bearer,
  //     );
  //     state = state.copyWith(
  //       companiesApiList: value.companies,
  //       responseStatus: Status.completed,
  //     );
  //   } catch (e, stackTrace) {
  //     setResponseStatus(Status.error);
  //     log(e.toString());
  //     log(stackTrace.toString());

  //     myToast(msg: e.toString());
  //   }
  // }

  // companyBussinesIndustryFilterApi(
  //   int industryId,
  // ) async {
  //   setResponseStatus(Status.loading);
  //   state.companiesApiList.clear();

  //   try {
  //     final value = await bussinesCommunitiesRepo.bussinesCommunityIndustryApi(
  //       industryId: industryId,
  //       bearerToken: state.person.Bearer,
  //     );
  //     state = state.copyWith(
  //       companiesApiList: value.companies,
  //       responseStatus: Status.completed,
  //     );
  //   } catch (e, stackTrace) {
  //     setResponseStatus(Status.error);
  //     log(e.toString());
  //     log(stackTrace.toString());

  //     myToast(msg: e.toString());
  //   }
  // }

  // companyFilterApi({
  //   String? filtertype,
  // }) async {
  //   log(filtertype!);
  //   setResponseStatus(Status.loading);
  //   state.companiesApiList.clear();
  //   try {
  //     final value = await bussinesCommunitiesRepo.CompanyFilterApi(
  //       type: filtertype,
  //       bearerToken: state.person.Bearer,
  //     );
  //     log(value.toString());

  //     state = state.copyWith(
  //       companiesApiList: value.companies,
  //       responseStatus: Status.completed,
  //     );
  //   } catch (e, stackTrace) {
  //     setResponseStatus(Status.error);
  //     log(e.toString());
  //     log(stackTrace.toString());

  //     myToast(msg: e.toString());
  //   }
  // }

  // bussinesCommunitySearchApi({
  //   String? query,
  // }) async {
  //   if (query == null || query.isEmpty) {
  //     // If the search query is empty, we might want to load the initial data again
  //     BussinesCommunitiesViewApi(bearerToken: state.person.Bearer);
  //   } else {
  //     setResponseStatus(Status.loading);
  //     state.companiesApiList.clear();

  //     try {
  //       final value = await bussinesCommunitiesRepo.bussinesSearchApi(
  //         query: query,
  //         bearerToken: state.person.Bearer,
  //       );
  //       log(value.toString());

  //       state = state.copyWith(
  //         companiesApiList: value.companies,
  //         responseStatus: Status.completed,
  //       );
  //     } catch (e, stackTrace) {
  //       setResponseStatus(Status.error);
  //       log(e.toString());
  //       log(stackTrace.toString());

  //       myToast(msg: e.toString());
  //     }
  //     // bussinesCommunitiesRepo
  //     //     .bussinesSearchApi(
  //     //   query: query,
  //     //   bearerToken: state.person.Bearer,
  //     // )
  //     //     .then((value) {
  //     //   Status.completed;
  //     //   final updatedCompaniesList = List<Companies>.from(value.companies);

  //     //   for (int i = 0; i < value.companies.length; i++) {
  //     //     state.companiesApiList.add(value.companies[i]);
  //     //   }
  //     //   print('dikaaaa ${state.companiesApiList}');
  //     //   state = state.copyWith(
  //     //     companiesApiList: updatedCompaniesList,
  //     //   );

  //     //   setResponseStatus(Status.completed);
  //     //   //update();
  //     // }).onError((error, stackTrace) {
  //     //   setResponseStatus(Status.error);

  //     //   myToast(
  //     //     backgroundColor: Colors.white,
  //     //     msg: '$error ',
  //     //   );
  //     //   log('controller error ${error.toString()}');
  //     //   //log(stackTrace.toString());
  //     // });
  //   }
  // }

  // String? searchQuery;
  // Timer? debouncer;

  // void debounce(
  //   VoidCallback callback, {
  //   Duration duration = const Duration(milliseconds: 1000),
  // }) {
  //   // Cancel the existing timer if it's active to ensure only the last call is executed
  //   // after the specified duration of no further calls.
  //   if (debouncer?.isActive ?? false) {
  //     debouncer!.cancel();
  //   }

  //   // Set up a new timer that will invoke the callback after the duration if no new
  //   // debounce calls are made.
  //   debouncer = Timer(duration, callback);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   // Ensure the debouncer is cancelled when the controller is disposed to avoid memory leaks.
  //   debouncer?.cancel();
  // }

  // String? searchQuery;
  // Timer? debouncer;
  // void debounce(
  //   VoidCallback callback, {
  //   Duration duration = const Duration(milliseconds: 1000),
  // }) {
  //   if (debouncer?.isActive ?? false) debouncer!.cancel();
  //   debouncer = Timer(duration, callback);
  //   if (debouncer != null) {
  //     debouncer!.cancel();
  //     setResponseStatus(Status.completed);
  //   }

  //   debouncer = Timer(duration, callback);
  //   setResponseStatus(Status.completed);
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   debouncer?.cancel();
  // }

  List<Map<String, dynamic>> businessProviders = [
    {'id': '1', 'name': 'Buyer', 'isChecked': false},
    {'id': '2', 'name': 'Supplier', 'isChecked': false},
    {'id': '3', 'name': 'Service-Provider', 'isChecked': false},
  ];
  // void setSelectedSectorId(int? sectorId) {
  //   //state = state.copyWith(selectedSectorId: sectorId);

  //   final currentSelectedId = state.selectedSectorId;

  //   if (currentSelectedId == sectorId) {
  //     state = state.copyWith(selectedSectorId: 0);
  //     BussinesCommunitiesViewApi(bearerToken: state.person.Bearer);
  //   } else {
  //     // Otherwise, select the tapped sector
  //     state = state.copyWith(selectedSectorId: sectorId);
  //     companyBussinesIsic4mainActivityFilterApi(sectorId!);
  //   }
  // }

  // void setSelectedIndustryId(int? sectorId) {
  //   //state = state.copyWith(selectedSectorId: sectorId);

  //   final currentSelectedId = state.selectedIndustryId;

  //   if (currentSelectedId == sectorId) {
  //     state = state.copyWith(selectedIndustryId: 0);
  //     BussinesCommunitiesViewApi(bearerToken: state.person.Bearer);
  //   } else {
  //     // Otherwise, select the tapped sector
  //     state = state.copyWith(selectedIndustryId: sectorId);
  //     companyBussinesIndustryFilterApi(sectorId!);
  //   }
  // }

  // void updateSelectedProviderId(int? providerId) {
  //   //state = state.copyWith(selectedSectorId: sectorId);

  //   final currentSelectedId = state.selectedProviderId;

  //   if (currentSelectedId == providerId) {
  //     state = state.copyWith(selectedProviderId: 0);
  //     BussinesCommunitiesViewApi(bearerToken: state.person.Bearer);
  //   } else {
  //     // Otherwise, select the tapped sector
  //     state = state.copyWith(selectedProviderId: providerId);
  //     companyBussinesIndustryFilterApi(providerId!);
  //   }
  // }
}

final ProcuremenetSoiProvider = StateNotifierProvider.autoDispose<
    ProcuremenetRFQController, ProcuremenetRFQState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ProcuremenetRFQController(person);
}, dependencies: [personProvider]);
