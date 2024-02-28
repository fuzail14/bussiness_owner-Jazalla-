import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Module/BussinesCommunity/Main/Model/BussinesCommunity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/SalesManagment/RFQ/rfq_repository.dart';
import '../../../ProcurementManagment/RFQ/Model/Request4Quotation.dart';

class SalesManagmentRFQState {
  final Status responseStatus;
  final List<RequestForQuotation> requestForQuotation;
  final Person person;

  SalesManagmentRFQState({
    this.responseStatus = Status.loading,
    this.requestForQuotation = const [],
    required this.person,
  });

  SalesManagmentRFQState copyWith({
    Status? responseStatus,
    List<RequestForQuotation>? requestForQuotation,
    Person? person,
  }) {
    return SalesManagmentRFQState(
      responseStatus: responseStatus ?? this.responseStatus,
      requestForQuotation: requestForQuotation ?? this.requestForQuotation,
      person: person ?? this.person,
    );
  }
}

class SalesManagmentRFQController
    extends StateNotifier<SalesManagmentRFQState> {
  final salesManagmentRFQRepository = SalesManagmentRFQRepository();

  SalesManagmentRFQController(Person person)
      : super(SalesManagmentRFQState(person: person)) {
    request4InformationViewApi(
        userId: person.data!.companyId, bearerToken: person.Bearer);
  }
  final TextEditingController searchController = TextEditingController();

  Future<void> request4InformationViewApi(
      {required userId, required bearerToken}) async {
    setResponseStatus(Status.loading);
    try {
      final value = await salesManagmentRFQRepository.salesManagmentRFQApi(
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
}

final ProcuremenetSoiProvider = StateNotifierProvider.autoDispose<
    SalesManagmentRFQController, SalesManagmentRFQState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return SalesManagmentRFQController(person);
}, dependencies: [personProvider]);
