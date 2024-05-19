import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Repo/Attendance Employee Repository/attendance_employee_repository.dart';
import '../State/attendance_managment_state.dart';

class AttendanceManagmentNotifier
    extends StateNotifier<AttendanceManagmentState> {
  final Person? person;
  final attendanceEmployeeRepository = AttendanceEmployeeRepository();

  AttendanceManagmentNotifier(this.person) : super(AttendanceManagmentState()) {
    if (person!.data!.type == 'company') {
      attendanceEmployeeViewApi(
          employeeId: person!.data!.companyId!,
          type: person!.data!.type!,
          bearerToken: person!.Bearer);
    } else {
      attendanceEmployeeViewApi(
          employeeId: person!.employee!.id!,
          type: person!.data!.type!,
          bearerToken: person!.Bearer);
    }
  }

  final TextEditingController searchController = TextEditingController();

  Future<void> attendanceEmployeeViewApi(
      {required employeeId, required type, required bearerToken}) async {
    setResponseStatus(Status.loading);
    print('come here');
    print(employeeId);
    try {
      final value = await attendanceEmployeeRepository.getAttendanceEmployeeApi(
        employeeId: employeeId,
        type: type,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        employeeattendance: value.employeeattendance,
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

// final attendanceManagmentProvider = StateNotifierProvider.autoDispose<
//     AttendanceManagmentNotifier, AttendanceManagmentState>((ref) {
//   return AttendanceManagmentNotifier();
// });

final attendanceManagmentProvider = StateNotifierProvider.autoDispose<
    AttendanceManagmentNotifier, AttendanceManagmentState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return AttendanceManagmentNotifier(person);
}, dependencies: [personProvider]);
