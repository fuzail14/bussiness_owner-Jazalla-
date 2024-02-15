import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Module/BussinesCommunity/Main/Model/BussinesCommunity.dart';
import 'package:bussines_owner/Repo/Bussines%20Communities%20Repository/bussines_communities_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Data/Api Resp/api_response.dart';

class BussinesCommunitiesState {
  final Status responseStatus;
  final List<Companies> companiesApiList;
  final String secondFilterval;
  final Person person;
  int? selectedFilterIndex;
  bool isFilterSelected;

  BussinesCommunitiesState(
      {this.responseStatus = Status.loading,
      List<Companies>? companiesApiList,
      this.secondFilterval = 'Buyer',
      required this.person,
      this.selectedFilterIndex,
      this.isFilterSelected = false})
      : companiesApiList = companiesApiList ?? [];

  BussinesCommunitiesState copyWith(
      {Status? responseStatus,
      List<Companies>? companiesApiList,
      String? secondFilterval,
      Person? person,
      int? selectedFilterIndex,
      bool? isFilterSelected}) {
    return BussinesCommunitiesState(
        responseStatus: responseStatus ?? this.responseStatus,
        companiesApiList: companiesApiList ?? this.companiesApiList,
        secondFilterval: secondFilterval ?? this.secondFilterval,
        person: person ?? this.person,
        selectedFilterIndex: selectedFilterIndex ?? this.selectedFilterIndex,
        isFilterSelected: isFilterSelected ?? this.isFilterSelected);
  }
}

class BussinesCommunitiesController
    extends StateNotifier<BussinesCommunitiesState> {
  final bussinesCommunitiesRepo = BussinessCommunitiesRepository();

  BussinesCommunitiesController(Person person)
      : super(BussinesCommunitiesState(person: person)) {
    BussinesCommunitiesViewApi(bearerToken: person.Bearer);
  }

  Future<void> BussinesCommunitiesViewApi({required bearerToken}) async {
    setResponseStatus(Status.loading);
    try {
      final value = await bussinesCommunitiesRepo.bussinesCommunitiesViewApi(
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        companiesApiList: value.companies,
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

  companyBussinesFilterApi({
    String? bussinestype,
  }) async {
    setResponseStatus(Status.loading);
    state.companiesApiList.clear();

    try {
      final value = await bussinesCommunitiesRepo.bussinesTypeFilterApi(
        type: bussinestype,
        bearerToken: state.person.Bearer,
      );
      state = state.copyWith(
        companiesApiList: value.companies,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  companyBussinesIsic4mainActivityFilterApi(
    String sectorId,
  ) async {
    setResponseStatus(Status.loading);
    state.companiesApiList.clear();

    try {
      final value =
          await bussinesCommunitiesRepo.bussinesCommunityIsicFilterApi(
        isicId: sectorId,
        bearerToken: state.person.Bearer,
      );
      state = state.copyWith(
        companiesApiList: value.companies,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  companyBussinesIndustryFilterApi(
    String industryId,
  ) async {
    setResponseStatus(Status.loading);
    state.companiesApiList.clear();

    try {
      final value = await bussinesCommunitiesRepo.bussinesCommunityIndustryApi(
        industryId: industryId,
        bearerToken: state.person.Bearer,
      );
      state = state.copyWith(
        companiesApiList: value.companies,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  companyFilterApi({
    String? filtertype,
  }) async {
    setResponseStatus(Status.loading);
    state.companiesApiList.clear();
    try {
      final value = await bussinesCommunitiesRepo.CompanyFilterApi(
        type: filtertype,
        bearerToken: state.person.Bearer,
      );
      state = state.copyWith(
        companiesApiList: value.companies,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  bussinesCommunitySearchApi({
    String? query,
  }) {
    if (query == null || query.isEmpty) {
      // If the search query is empty, we might want to load the initial data again
      BussinesCommunitiesViewApi(bearerToken: state.person.Bearer);
    } else {
      //state.companiesApiList.clear();
      //update();
      bussinesCommunitiesRepo
          .bussinesSearchApi(
        query: query,
        bearerToken: state.person.Bearer,
      )
          .then((value) {
        Status.completed;
        final updatedCompaniesList = List<Companies>.from(value.companies);

        for (int i = 0; i < value.companies.length; i++) {
          state.companiesApiList.add(value.companies[i]);
        }
        print('dikaaaa ${state.companiesApiList}');
        state = state.copyWith(
          companiesApiList: updatedCompaniesList,
        );

        setResponseStatus(Status.completed);
        //update();
      }).onError((error, stackTrace) {
        setResponseStatus(Status.error);

        myToast(
          backgroundColor: Colors.white,
          msg: '$error ',
        );
        log('controller error ${error.toString()}');
        //log(stackTrace.toString());
      });
    }
  }

  String? searchQuery;
  Timer? debouncer;
  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer?.isActive ?? false) debouncer!.cancel();
    debouncer = Timer(duration, callback);
    if (debouncer != null) {
      debouncer!.cancel();
      setResponseStatus(Status.completed);
    }

    debouncer = Timer(duration, callback);
    setResponseStatus(Status.completed);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debouncer?.cancel();
  }

  List<Map<String, dynamic>> businessProviders = [
    {'id': '1', 'name': 'Buyer', 'isChecked': false},
    {'id': '2', 'name': 'Supplier', 'isChecked': false},
    {'id': '3', 'name': 'Service-Provider', 'isChecked': false},
  ];
}

final bussinesCommunitiesProvider = StateNotifierProvider.autoDispose<
    BussinesCommunitiesController, BussinesCommunitiesState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return BussinesCommunitiesController(person);
}, dependencies: [personProvider]);
