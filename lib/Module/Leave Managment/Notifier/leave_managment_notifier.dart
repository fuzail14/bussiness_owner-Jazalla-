import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/Approval Managment Repository/approval_managment_repository.dart';
import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';
import '../State/leave_managment_state.dart';

class LeaveManagmentNotifier extends StateNotifier<LeaveManagmentState> {
  final Person? person;
  final approvalManagmentRepository = ApprovalManagmentRepository();

  LeaveManagmentNotifier(this.person) : super(LeaveManagmentState()) {
    request4InformationViewApi(
        userId: person!.data!.id!, bearerToken: person!.Bearer);
  }

  final TextEditingController searchController = TextEditingController();

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

// final LeaveManagmentProvider = StateNotifierProvider.autoDispose<
//     LeaveManagmentNotifier, LeaveManagmentState>((ref) {
//   return LeaveManagmentNotifier();
// });

final leaveManagmentProvider =
    StateNotifierProvider<LeaveManagmentNotifier, LeaveManagmentState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return LeaveManagmentNotifier(person);
}, dependencies: [personProvider]);
