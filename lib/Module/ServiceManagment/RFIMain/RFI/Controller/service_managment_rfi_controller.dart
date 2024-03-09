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
import '../../../../../Repo/ServiceManagment/RFI/service_managment_rfi_repository.dart';
import '../../../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';

class ServiceManagmentRFIState {
  final Status responseStatus;
  final List<RequestForInformation> request4Information;
  final Person person;

  ServiceManagmentRFIState({
    this.responseStatus = Status.loading,
    List<RequestForInformation>? request4Information,
    required this.person,
    List<Isic4MainActivities>? isic4MainActivities,
    List<Industries>? industries,
  }) : request4Information = request4Information ?? [];

  ServiceManagmentRFIState copyWith({
    Status? responseStatus,
    List<RequestForInformation>? request4Information,
    Person? person,
  }) {
    return ServiceManagmentRFIState(
      responseStatus: responseStatus ?? this.responseStatus,
      request4Information: request4Information ?? this.request4Information,
      person: person ?? this.person,
    );
  }
}

class ServiceManagmentRFIController
    extends StateNotifier<ServiceManagmentRFIState> {
  final serviceManagmentRFIRepository = ServiceManagmentRFIRepository();

  ServiceManagmentRFIController(Person person)
      : super(ServiceManagmentRFIState(person: person)) {
    request4InformationViewApi(
        userId: person.data!.companyId, bearerToken: person.Bearer);
    print(person.data!.companyId);
  }
  final TextEditingController searchController = TextEditingController();

  Future<void> request4InformationViewApi(
      {required userId, required bearerToken}) async {
    String type = 'service';
    setResponseStatus(Status.loading);

    try {
      log(userId.toString());
      final value = await serviceManagmentRFIRepository.serviceManagmentRFIApi(
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
}

final serviceManagmentRFIProvider = StateNotifierProvider.autoDispose<
    ServiceManagmentRFIController, ServiceManagmentRFIState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ServiceManagmentRFIController(person);
}, dependencies: [personProvider]);
