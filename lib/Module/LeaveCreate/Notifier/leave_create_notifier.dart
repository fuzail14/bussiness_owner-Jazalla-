import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/Approval Managment Repository/approval_managment_repository.dart';
import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';
import '../State/leave_create_state.dart';

class LeaveCreateNotifier extends StateNotifier<LeaveCreateState> {
  final Person? person;
  final approvalManagmentRepository = ApprovalManagmentRepository();

  LeaveCreateNotifier(this.person) : super(LeaveCreateState()) {
    request4InformationViewApi(
        userId: person!.data!.id!, bearerToken: person!.Bearer);
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

  Future<void> request4InformationViewApi(
      {required userId, required bearerToken}) async {
    setResponseStatus(Status.loading);
    print('come here');
    print(userId);
    try {
      final value = await approvalManagmentRepository.request4InformationApi(
        userId: userId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        request4Informatio: value.requestForInformation,
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

// final LeaveCreateProvider = StateNotifierProvider.autoDispose<
//     LeaveCreateNotifier, LeaveCreateState>((ref) {
//   return LeaveCreateNotifier();
// });

final leaveCreateProvider =
    StateNotifierProvider<LeaveCreateNotifier, LeaveCreateState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return LeaveCreateNotifier(person);
}, dependencies: [personProvider]);
