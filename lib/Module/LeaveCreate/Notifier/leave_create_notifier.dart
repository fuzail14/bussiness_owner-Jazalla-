import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Repo/Leave Management/leave_managment_repository.dart';
import '../State/leave_create_state.dart';

class LeaveCreateNotifier extends StateNotifier<LeaveCreateState> {
  final Person? person;

  final leaveManagmentRepository = LeaveManagmentRepository();

  LeaveCreateNotifier(this.person) : super(LeaveCreateState()) {
    getLeaveTypesViewApi(
        companyId: person!.data!.companyId!, bearerToken: person!.Bearer);
  }

  final TextEditingController searchController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController totalPriceAmountController = TextEditingController();

  var responseDurationTimeUnitLists = ['Casual Leave', 'Medical Leave'];
  Future StartDate(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(2080),
        context: context);
    if (picked != null) {
      startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future endDate(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(2080),
        context: context);
    if (picked != null) {
      endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> getLeaveTypesViewApi(
      {required companyId, required bearerToken}) async {
    setResponseStatus(Status.loading);
    print('come here');
    print(companyId);
    try {
      final value = await leaveManagmentRepository.getLeaveTypesApi(
        companyId: companyId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        leavetype: value.allleavetypes,
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

final leaveCreateProvider =
    StateNotifierProvider<LeaveCreateNotifier, LeaveCreateState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return LeaveCreateNotifier(person);
}, dependencies: [personProvider]);
