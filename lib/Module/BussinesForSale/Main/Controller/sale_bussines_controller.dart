import 'dart:developer';

import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/Bussines For Sale Repo/sale_bussines_repository.dart';
import '../Model/SaleBussines.dart';

final businessForSaleControllerProvider =
    StateNotifierProvider<BusinessForSaleController, BusinessForSaleState>(
        (ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return BusinessForSaleController(person);
}, dependencies: [personProvider]);

class BusinessForSaleState {
  final Status responseStatus;
  final List<Businesses> businesses;
  final List<Companies> companies;
  final List<Isic4MainActivities>? isic4MainActivities;
  final List<Industries>? industries;
  final int? selectedSectorId;
  final int? selectedIndustryId;

  BusinessForSaleState({
    this.responseStatus = Status.loading,
    this.businesses = const [],
    this.companies = const [],
    this.isic4MainActivities = const [],
    this.industries = const [],
    this.selectedSectorId,
    this.selectedIndustryId,
  });

  BusinessForSaleState copyWith(
      {Status? responseStatus,
      List<Businesses>? businesses,
      List<Companies>? companies,
      List<Isic4MainActivities>? isic4MainActivities,
      List<Industries>? industries,
      int? selectedSectorId,
      int? selectedIndustryId}) {
    return BusinessForSaleState(
        responseStatus: responseStatus ?? this.responseStatus,
        businesses: businesses ?? this.businesses,
        companies: companies ?? this.companies,
        isic4MainActivities: isic4MainActivities ?? this.isic4MainActivities,
        industries: industries ?? this.industries,
        selectedSectorId: selectedSectorId ?? this.selectedSectorId,
        selectedIndustryId: selectedIndustryId ?? this.selectedIndustryId);
  }
}

class BusinessForSaleController extends StateNotifier<BusinessForSaleState> {
  final saleBussinesRepository = SaleBussinesRepository();
  final Person? person;
  final TextEditingController searchController = TextEditingController();

  BusinessForSaleController(this.person) : super(BusinessForSaleState()) {
    loadBusinessesForSale();
  }
  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  Future<void> loadBusinessesForSale() async {
    state = state.copyWith(responseStatus: Status.loading);

    try {
      final value = await saleBussinesRepository.BussinesForSaleResponse(
          bearerToken: person!.Bearer);
      state = state.copyWith(
          businesses: value.businesses,
          isic4MainActivities: value.isic4MainActivities,
          industries: value.industries,
          responseStatus: Status.completed);
    } catch (error) {
      state = state.copyWith(responseStatus: Status.error);
      myToast(msg: error.toString());
    }
  }

  bussinesForSaleSearchApi({
    String? query,
  }) async {
    if (query == null || query.isEmpty) {
      // If the search query is empty, we might want to load the initial data again
      loadBusinessesForSale();
    } else {
      setResponseStatus(Status.loading);
      state.businesses.clear();

      try {
        final value = await saleBussinesRepository.bussinesForSaleSearchApi(
          query: query,
          bearerToken: person!.Bearer,
        );
        log('herre');
        log(value.toString());

        state = state.copyWith(
          businesses: value.businesses,
          responseStatus: Status.completed,
        );
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
      loadBusinessesForSale();
    } else {
      // Otherwise, select the tapped sector
      state = state.copyWith(selectedSectorId: sectorId);
      companyForSaleBussinesIsic4mainActivityFilterApi(sectorId!);
    }
  }

  void setSelectedIndustryId(int? sectorId) {
    //state = state.copyWith(selectedSectorId: sectorId);

    final currentSelectedId = state.selectedIndustryId;

    if (currentSelectedId == sectorId) {
      state = state.copyWith(selectedIndustryId: 0);
      loadBusinessesForSale();
    } else {
      // Otherwise, select the tapped sector
      state = state.copyWith(selectedIndustryId: sectorId);
      companyBussinesIndustryFilterApi(sectorId!);
    }
  }

  companyForSaleBussinesIsic4mainActivityFilterApi(
    int sectorId,
  ) async {
    setResponseStatus(Status.loading);
    state.businesses.clear();

    try {
      final value = await saleBussinesRepository.bussinesForSaleIsicFilterApi(
        isicId: sectorId,
        bearerToken: person!.Bearer,
      );
      state = state.copyWith(
        businesses: value.businesses,
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
    int industryId,
  ) async {
    setResponseStatus(Status.loading);
    state.businesses.clear();

    try {
      final value = await saleBussinesRepository.bussinesForSaleIndustryApi(
        industryId: industryId,
        bearerToken: person!.Bearer,
      );
      state = state.copyWith(
        businesses: value.businesses,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  bussinesSortApi({
    String? filtertype,
  }) async {
    log(filtertype!);
    setResponseStatus(Status.loading);
    state.businesses.clear();
    try {
      final value = await saleBussinesRepository.bussinesForSaleSortApi(
        type: filtertype,
        bearerToken: person!.Bearer,
      );
      log(value.toString());

      state = state.copyWith(
        businesses: value.businesses,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }
}
