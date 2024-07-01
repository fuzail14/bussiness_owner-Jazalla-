import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/General Service Repo/service_detail_repository.dart';

import '../State/service_catalouge_detail_state.dart';

final serviceCatalougeDetailProvider = StateNotifierProvider.autoDispose<
    ServiceCatalougeDetailNotifier, ServiceCatalougeDetailState>((ref) {
  final args = ref.read(routeArgsProvider);
  final serviceId = args['serviceId'] as int;
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ServiceCatalougeDetailNotifier(serviceId: serviceId, person: person);
}, dependencies: [routeArgsProvider]);

class ServiceCatalougeDetailNotifier
    extends StateNotifier<ServiceCatalougeDetailState> {
  final serviceDetailRepository = ServiceDetailRepository();
  final int serviceId;
  final Person person;

  ServiceCatalougeDetailNotifier({
    required this.serviceId,
    required this.person,
  }) : super(ServiceCatalougeDetailState(pageController: PageController())) {
    _loadServiceDetails();
  }

  Future<void> _loadServiceDetails() async {
    setResponseStatus(Status.loading);
    try {
      final value = await serviceDetailRepository.serviceDetailViewApi(
        serviceId: serviceId,
        bearerToken: person.Bearer,
      );
      state = state.copyWith(
        serviceDetail: value.servicedetail,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());
    }
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  void moreDetailBuild(int val) {
    state = state.copyWith(
      selectedOptionIndex: val,
      moreDetail: true,
    );
  }
}
