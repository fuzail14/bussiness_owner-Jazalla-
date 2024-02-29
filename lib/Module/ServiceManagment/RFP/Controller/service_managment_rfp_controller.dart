import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Module/BussinesCommunity/Main/Model/BussinesCommunity.dart';
import 'package:bussines_owner/Module/ProcurementManagment/RFP/Model/Request4Proposal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/ServiceManagment/RFP/service_managment_rfp_repository.dart';

class ServiceManagmentRFQState {
  final Status responseStatus;
  final List<RequestForProposal> requestForQuotation;
  final Person person;

  ServiceManagmentRFQState({
    this.responseStatus = Status.loading,
    this.requestForQuotation = const [],
    required this.person,
  });

  ServiceManagmentRFQState copyWith({
    Status? responseStatus,
    List<RequestForProposal>? requestForQuotation,
    Person? person,
  }) {
    return ServiceManagmentRFQState(
      responseStatus: responseStatus ?? this.responseStatus,
      requestForQuotation: requestForQuotation ?? this.requestForQuotation,
      person: person ?? this.person,
    );
  }
}

class ServiceManagmentRFQController
    extends StateNotifier<ServiceManagmentRFQState> {
  final serviceManagmentRFPRepository = ServiceManagmentRFPRepository();

  ServiceManagmentRFQController(Person person)
      : super(ServiceManagmentRFQState(person: person)) {
    request4InformationViewApi(
        serviceProviderId: person.data!.companyId, bearerToken: person.Bearer);
  }
  final TextEditingController searchController = TextEditingController();

  Future<void> request4InformationViewApi(
      {required serviceProviderId, required bearerToken}) async {
    setResponseStatus(Status.loading);
    try {
      final value = await serviceManagmentRFPRepository.serviceManagmentRFPApi(
        serviceProviderId: serviceProviderId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        requestForQuotation: value.requestForProposal,
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

final serviceManagmentRFPProvider = StateNotifierProvider.autoDispose<
    ServiceManagmentRFQController, ServiceManagmentRFQState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ServiceManagmentRFQController(person);
}, dependencies: [personProvider]);
