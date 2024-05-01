import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../State/employee_center_state.dart';

class EmployeeCenterNotifier extends StateNotifier<EmployeeCenterState> {
  EmployeeCenterNotifier() : super(EmployeeCenterState());

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }
}

// final LeaveManagmentProvider = StateNotifierProvider.autoDispose<
//     LeaveManagmentNotifier, LeaveManagmentState>((ref) {
//   return LeaveManagmentNotifier();
// });

final employeeCenterProvider = StateNotifierProvider.autoDispose<
    EmployeeCenterNotifier, EmployeeCenterState>((ref) {
  return EmployeeCenterNotifier();
});
