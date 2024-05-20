import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Repo/Announcement%20Repository/announcements_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Repo/Meetings Repository/meetings_repository.dart';
import '../State/employee_dashboard_state.dart';

class EmployeeDashboardNotifier extends StateNotifier<EmployeeDashboardState> {
  final Person? person;
  final meetingRepository = MeetingRepository();
  final announcementsRepository = AnnouncementsRepository();

  EmployeeDashboardNotifier(this.person) : super(EmployeeDashboardState()) {
    getannouncements(
        employeeId: person!.data!.employee!.id!, bearerToken: person!.Bearer);
    getmeetings(
        employeeId: person!.data!.employee!.id!, bearerToken: person!.Bearer);
  }

  final TextEditingController searchController = TextEditingController();

  Future<void> getannouncements(
      {required employeeId, required bearerToken}) async {
    setResponseStatus(Status.loading);

    try {
      final value = await announcementsRepository.getEmployeeAnnouncementApi(
        employeeId: employeeId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        employeeannouncments: value.employeeannouncments,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  Future<void> getmeetings({required employeeId, required bearerToken}) async {
    setResponseStatus(Status.loading);

    try {
      final value = await meetingRepository.getEmployeeMeetingApi(
        employeeId: employeeId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        employeemeetings: value.employeemeetings,
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

// final EventProvider = StateNotifierProvider.autoDispose<
//     EventNotifier, EventState>((ref) {
//   return EventNotifier();
// });

final employeeDashboardProvider =
    StateNotifierProvider<EmployeeDashboardNotifier, EmployeeDashboardState>(
        (ref) {
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return EmployeeDashboardNotifier(person);
}, dependencies: [personProvider]);
