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

import '../State/client_management_mainpage_state.dart';

class ClientManagementMainpageNotifier
    extends StateNotifier<ClientManagementMainpageState> {
  final request4InformationRepository = Request4InformationRepository();
  Person? person;
  ClientManagementMainpageNotifier({person})
      : super(ClientManagementMainpageState());
  final TextEditingController searchController = TextEditingController();

  void setTabBarStatus(int val) {
    state = state.copyWith(selectedIndex: val);
  }
}

final clientManagementMainPageProvider = StateNotifierProvider.autoDispose<
    ClientManagementMainpageNotifier, ClientManagementMainpageState>((ref) {
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ClientManagementMainpageNotifier(person: person);
}, dependencies: [personProvider]);
