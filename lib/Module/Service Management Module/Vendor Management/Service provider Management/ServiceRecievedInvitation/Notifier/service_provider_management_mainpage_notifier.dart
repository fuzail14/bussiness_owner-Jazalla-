import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../Constants/Person/person.dart';
import '../../../../../../../Constants/Person/person_controller.dart';
import '../../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../../../Repo/Procurement Managment/RFI/rfi_repository.dart';
import '../State/service_provider_state.dart';

class ServiceProviderRecievedInvitationNotifier
    extends StateNotifier<ServiceProviderRecievedInvitationState> {
  final request4InformationRepository = Request4InformationRepository();
  final Person person;
  ServiceProviderRecievedInvitationNotifier({required this.person})
      : super(ServiceProviderRecievedInvitationState()) {
    request4InformationViewApi(
        userId: person.data!.id, bearerToken: person.Bearer);
  }
  final TextEditingController searchController = TextEditingController();

  Future<void> request4InformationViewApi(
      {required userId, required bearerToken}) async {
    setResponseStatus(Status.loading);
    try {
      final value = await request4InformationRepository.request4InformationApi(
        userId: userId,
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

      myToast(msg: e.toString());
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  void setTabBarStatus(int val) {
    state = state.copyWith(selectedIndex: val);
  }
}

final serviceProviderRecievedInvitationProvider =
    StateNotifierProvider.autoDispose<ServiceProviderRecievedInvitationNotifier,
        ServiceProviderRecievedInvitationState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ServiceProviderRecievedInvitationNotifier(person: person);
}, dependencies: [personProvider]);
