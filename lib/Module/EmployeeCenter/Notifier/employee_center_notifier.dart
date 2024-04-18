import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../Constants/Person/person_controller.dart';
import '../State/employee_center_state.dart';

class EmployeeCenterNotifier extends StateNotifier<EmployeeCenterState> {
  EmployeeCenterNotifier() : super(EmployeeCenterState()) {}

  final TextEditingController searchController = TextEditingController();

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }
}

// final LeaveManagmentProvider = StateNotifierProvider.autoDispose<
//     LeaveManagmentNotifier, LeaveManagmentState>((ref) {
//   return LeaveManagmentNotifier();
// });

final employeeCenterProvider =
    StateNotifierProvider<EmployeeCenterNotifier, EmployeeCenterState>((ref) {
  return EmployeeCenterNotifier();
});
