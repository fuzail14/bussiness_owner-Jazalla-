import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Repo/General Service Repo/general_service_repository.dart';
import '../State/service_catalouge_state.dart';

final serviceCatalougeProvider =
    StateNotifierProvider<ServiceCatalougeNotifier, ServiceCatalougeState>(
        (ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ServiceCatalougeNotifier(person: person);
}, dependencies: [personProvider]);

class ServiceCatalougeNotifier extends StateNotifier<ServiceCatalougeState> {
  final generalServiceRepository = GeneralServiceRepository();
  // final String bearerToken;
  final TextEditingController searchController = TextEditingController();

  final Person person;
  ServiceCatalougeNotifier({required this.person})
      : super(ServiceCatalougeState()) {
    loadServices();
  }

  Future<void> loadServices() async {
    setResponseStatus(Status.loading);
    try {
      final value = await generalServiceRepository.ServicesResponse(
          bearerToken: person.Bearer);
      state = state.copyWith(
        servicesList: value.services,
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
