import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';

import '../../../../../Repo/Procurement Managment/RFI/rfi_repository.dart';

import '../State/client_management_mainpage_service_state.dart';

class ClientManagementServiceMainpageNotifier
    extends StateNotifier<ClientManagementServiceMainpageState> {
  final request4InformationRepository = Request4InformationRepository();
  Person? person;
  ClientManagementServiceMainpageNotifier({person})
      : super(ClientManagementServiceMainpageState());
  final TextEditingController searchController = TextEditingController();

  void setTabBarStatus(int val) {
    state = state.copyWith(selectedIndex: val);
  }
}

final clientManagementServiceMainPageProvider =
    StateNotifierProvider.autoDispose<ClientManagementServiceMainpageNotifier,
        ClientManagementServiceMainpageState>((ref) {
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ClientManagementServiceMainpageNotifier(person: person);
}, dependencies: [personProvider]);
