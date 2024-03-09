import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Module/BussinesCommunity/Main/Model/BussinesCommunity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Repo/Procurement Managment/RFI/rfi_repository.dart';
import '../../../../../Repo/SalesManagment/RFI/sale_managment_rfi_repository.dart';
import '../../../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';

class SalesManagmentRFIState {
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

  SalesManagmentRFIState(
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
      this.selectedProviderId})
      : request4Information = request4Information ?? [],
        isic4MainActivities = isic4MainActivities ?? [],
        industries = industries ?? [];

  SalesManagmentRFIState copyWith(
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
      int? selectedProviderId}) {
    return SalesManagmentRFIState(
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
        selectedProviderId: selectedProviderId ?? this.selectedProviderId);
  }
}

class SalesManagmentRFIController
    extends StateNotifier<SalesManagmentRFIState> {
  final salesManagmentRFIRepository = SalesManagmentRFIRepository();

  SalesManagmentRFIController(Person person)
      : super(SalesManagmentRFIState(person: person)) {
    request4InformationViewApi(
        userId: person.data!.companyId, bearerToken: person.Bearer);
    print(person.data!.companyId);
  }
  final TextEditingController searchController = TextEditingController();

  Future<void> request4InformationViewApi(
      {required userId, required bearerToken}) async {
    String type = 'product';
    setResponseStatus(Status.loading);
    try {
      log(userId.toString());
      final value = await salesManagmentRFIRepository.salesManagmentRFIApi(
        userId: userId.toString(),
        requestType: type,
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

final SalesManagmentRFIProvider = StateNotifierProvider.autoDispose<
    SalesManagmentRFIController, SalesManagmentRFIState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return SalesManagmentRFIController(person);
}, dependencies: [personProvider]);
