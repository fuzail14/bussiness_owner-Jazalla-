import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Repo/ServiceManagment/RFP/service_managment_rfp_repository.dart';
import '../../../../ProcurementManagment/RFP/Main/Model/Request4Proposal.dart';

class ServiceManagmentRFQState {
  final Status responseStatus;
  final List<RequestForProposal> requestForProposal;
  final Person person;

  ServiceManagmentRFQState({
    this.responseStatus = Status.loading,
    this.requestForProposal = const [],
    required this.person,
  });

  ServiceManagmentRFQState copyWith({
    Status? responseStatus,
    List<RequestForProposal>? requestForProposal,
    Person? person,
  }) {
    return ServiceManagmentRFQState(
      responseStatus: responseStatus ?? this.responseStatus,
      requestForProposal: requestForProposal ?? this.requestForProposal,
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
        requestForProposal: value.requestForProposal,
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
}

final serviceManagmentRFPProvider = StateNotifierProvider.autoDispose<
    ServiceManagmentRFQController, ServiceManagmentRFQState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ServiceManagmentRFQController(person);
}, dependencies: [personProvider]);
