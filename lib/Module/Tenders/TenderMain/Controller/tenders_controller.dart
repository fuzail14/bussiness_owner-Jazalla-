import 'dart:developer';
import 'package:bussines_owner/Repo/Tenders%20Repo/tenders_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../Model/Tender.dart';

final tendersProvider =
    StateNotifierProvider<TendersController, TendersState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return TendersController(person: person);
}, dependencies: [personProvider]);

class TendersState {
  final Status responseStatus;
  final List<Tenders> tendersList;
  final List<CustomMainCategory> customMainCategory;
  int? selectedSectorId;

  TendersState(
      {this.responseStatus = Status.loading,
      this.tendersList = const [],
      this.customMainCategory = const [],
      this.selectedSectorId});

  TendersState copyWith(
      {Status? responseStatus,
      List<Tenders>? tendersList,
      List<CustomMainCategory>? customMainCategory,
      int? selectedSectorId}) {
    return TendersState(
        responseStatus: responseStatus ?? this.responseStatus,
        tendersList: tendersList ?? this.tendersList,
        customMainCategory: customMainCategory ?? this.customMainCategory,
        selectedSectorId: selectedSectorId ?? this.selectedSectorId);
  }
}

class TendersController extends StateNotifier<TendersState> {
  final tendersRepository = TendersRepository();
  final Person person;
  final TextEditingController searchController = TextEditingController();

  TendersController({required this.person}) : super(TendersState()) {
    loadTenders();
  }

  Future<void> loadTenders() async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await tendersRepository.TendersResponse(bearerToken: person.Bearer);
      state = state.copyWith(
        tendersList: value.tenders,
        customMainCategory: value.customMainCategory,
        responseStatus: Status.completed,
      );
      log(value.customMainCategory.toString());
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);

      // Handle error
      log(e.toString());
      log(stackTrace.toString());
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  void setSelectedSectorId(int? sectorId) {
    //state = state.copyWith(selectedSectorId: sectorId);

    final currentSelectedId = state.selectedSectorId;

    if (currentSelectedId == sectorId) {
      state = state.copyWith(selectedSectorId: 0);
      loadTenders();
    } else {
      // Otherwise, select the tapped sector
      state = state.copyWith(selectedSectorId: sectorId);
      tenderIsic4mainActivityFilterApi(sectorId!);
    }
  }

  tenderSearchApi({
    String? query,
  }) async {
    if (query == null || query.isEmpty) {
      // If the search query is empty, we might want to load the initial data again
      loadTenders();
    } else {
      setResponseStatus(Status.loading);
      state.tendersList.clear();

      try {
        final value = await tendersRepository.tenderSearchApi(
          query: query,
          bearerToken: person.Bearer,
        );
        log(value.toString());

        state = state.copyWith(
          tendersList: value.tenders,
          responseStatus: Status.completed,
        );
      } catch (e, stackTrace) {
        setResponseStatus(Status.error);
        log(e.toString());
        log(stackTrace.toString());
      }
      // bussinesCommunitiesRepo
      //     .bussinesSearchApi(
      //   query: query,
      //   bearerToken: state.person.Bearer,
      // )
      //     .then((value) {
      //   Status.completed;
      //   final updatedCompaniesList = List<Companies>.from(value.companies);

      //   for (int i = 0; i < value.companies.length; i++) {
      //     state.companiesApiList.add(value.companies[i]);
      //   }
      //   print('dikaaaa ${state.companiesApiList}');
      //   state = state.copyWith(
      //     companiesApiList: updatedCompaniesList,
      //   );

      //   setResponseStatus(Status.completed);
      //   //update();
      // }).onError((error, stackTrace) {
      //   setResponseStatus(Status.error);

      //   myToast(
      //     backgroundColor: Colors.white,
      //     msg: '$error ',
      //   );
      //   log('controller error ${error.toString()}');
      //   //log(stackTrace.toString());
      // });
    }
  }

  tenderIsic4mainActivityFilterApi(
    int sectorId,
  ) async {
    setResponseStatus(Status.loading);
    state.tendersList.clear();

    try {
      final value = await tendersRepository.tenderIsicFilterApi(
        isicId: sectorId,
        bearerToken: person.Bearer,
      );
      state = state.copyWith(
        tendersList: value.tenders,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());
    }
  }

  tenderSortApi({
    String? filtertype,
  }) async {
    log(filtertype!);
    setResponseStatus(Status.loading);
    state.tendersList.clear();
    try {
      final value = await tendersRepository.sortTenderApi(
        type: filtertype,
        bearerToken: person.Bearer,
      );
      log(value.toString());

      state = state.copyWith(
        tendersList: value.tenders,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());
    }
  }
}
