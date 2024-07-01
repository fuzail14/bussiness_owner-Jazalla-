import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Module/BussinesCommunity/Main/Model/BussinesCommunity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../Constants/Person/person.dart';
import '../../../../../../Constants/Person/person_controller.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../../Repo/Procurement Managment/RFI/rfi_repository.dart';
import '../../../../../ProcurementManagment/RFI/Main/Model/Request4Information.dart';
import '../State/add_supplier_state.dart';

class AddSupplierNotifier extends StateNotifier<AddSupplierState> {
  final request4InformationRepository = Request4InformationRepository();
  final Person person;
  AddSupplierNotifier({required this.person}) : super(AddSupplierState()) {
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

final addSupplierProvider =
    StateNotifierProvider.autoDispose<AddSupplierNotifier, AddSupplierState>(
        (ref) {
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return AddSupplierNotifier(person: person);
}, dependencies: [personProvider]);
