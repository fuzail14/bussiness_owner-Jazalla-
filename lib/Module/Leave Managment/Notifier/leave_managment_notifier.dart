import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Repo/Leave Management/leave_managment_repository.dart';
import '../State/leave_managment_state.dart';

class LeaveManagmentNotifier extends StateNotifier<LeaveManagmentState> {
  final Person? person;
  final leaveManagmentRepository = LeaveManagmentRepository();

  LeaveManagmentNotifier(this.person) : super(LeaveManagmentState()) {
    leavesViewApi(userId: person!.data!.id!, bearerToken: person!.Bearer);
  }

  final TextEditingController searchController = TextEditingController();

  Future<void> leavesViewApi({required userId, required bearerToken}) async {
    setResponseStatus(Status.loading);
    print('come here');
    print(userId);
    try {
      final value = await leaveManagmentRepository.getEmployeeLeavesApi(
        userId: userId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        employeeleave: value.employeeleave,
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
