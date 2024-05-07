import 'dart:developer';

import 'package:bussines_owner/Constants/Person/person_controller.dart';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Repo/Attendance Employee Repository/attendance_employee_repository.dart';
import '../State/main_home_screen_state.dart';
import 'package:flutter/foundation.dart';

final mainHomeScreenProvider =
    StateNotifierProvider<MainHomeScreenNotifier, MainHomeScreenState>((ref) {
  final person = ref.read(personProvider);
  return MainHomeScreenNotifier(person);
});

class MainHomeScreenNotifier extends StateNotifier<MainHomeScreenState> {
  late PageController pageController;
  final Person? person;
  final attendanceEmployeeRepository = AttendanceEmployeeRepository();
  DateTime dateTime = DateTime.now().toUtc();

  MainHomeScreenNotifier(this.person) : super(MainHomeScreenState()) {
    pageController = PageController(initialPage: 0, viewportFraction: 1.1);

    pageController.addListener(_updatePageIndex);
    formatDateTime();

    companyTimingApi(companyId: person!.data!.companyId);
  }
  String? formattedDate;
  String? lateTime;
  String? formattedTime;

  @override
  void dispose() {
    pageController.removeListener(_updatePageIndex); // Clean up listener
    pageController.dispose();
    super.dispose();
  }

  void cardIndexChanged(int index) {
    state = state.copyWith(currentPage: index);
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  void _updatePageIndex() {
    final int currentIndex = pageController.page!.round();
    if (currentIndex != state.currentPage) {
      state = state.copyWith(currentPage: currentIndex);
    }
  }

  void formatDateTime() {
    // Get the current time zone offset from UTC
    var timeZoneOffset = DateTime.now().timeZoneOffset;

    // Add the time zone offset to the UTC time to get the local time
    dateTime = dateTime.add(timeZoneOffset);

    formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    // formattedTime = DateFormat('HH:mm:ss').format(dateTime);
    formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);

    print('date $formattedDate');
    print(
        'time ${formattedTime}'); // This will now print the local time in Dhahran
  }

  // Assuming formattedTime is in the format 'HH:mm:ss'
  String calculateLateTime(String formattedTime, String companyStartTime) {
    // Parse formattedTime to DateTime object
    DateTime clockIn = DateTime.parse(formattedTime);

    // Parse companyStartTime to DateTime object
    DateTime startTime = DateTime.parse('2024-05-07 $companyStartTime');

    // Calculate the difference in seconds
    int diffSeconds = clockIn.difference(startTime).inSeconds;

    // Convert the difference to HH:mm:ss format
    String lateHours = (diffSeconds ~/ 3600).toString().padLeft(2, '0');
    String lateMinutes =
        ((diffSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
    String lateSeconds = (diffSeconds % 60).toString().padLeft(2, '0');

    return '$lateHours:$lateMinutes:$lateSeconds';
  }

  Future<void> sendClockInApi({
    required companyId,
    required employeeId,
    required date,
    required clockInTime,
    required BuildContext context,
  }) async {
    state = state.copyWith(isLoading: true);

    String formattedClockInTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(clockInTime!));
    print(clockInTime.toString());
    Map<String, String> data = {
      "company_id": companyId.toString(),
      "employee_id": employeeId.toString(),
      "date": date.toString(),
      "clock_in": formattedClockInTime,
      "late": lateTime.toString(),
      "status": '1',
    };

    print(data);
    try {
      await attendanceEmployeeRepository.clockInRequest(
        data,
      );
      state = state.copyWith(isLoading: false);

      Fluttertoast.showToast(
          msg: 'Attendance Marked successfully',
          gravity: ToastGravity.CENTER,
          fontSize: 20,
          timeInSecForIosWeb: 3,
          backgroundColor: const Color(0xff6FD943));
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (error, stackTrace) {
      state = state.copyWith(isLoading: false);
      print('check catch error $error');

      Fluttertoast.showToast(
          msg: 'Attendance Not Marked',
          gravity: ToastGravity.CENTER,
          fontSize: 20,
          timeInSecForIosWeb: 3,
          backgroundColor: const Color(0xffEF2E61));

      if (kDebugMode) {
        print(error.toString());
        print(stackTrace.toString());

        // Fluttertoast.showToast(
        //     msg: error.toString(), gravity: ToastGravity.CENTER);
      }
    }
  }

  Future<void> companyTimingApi({required companyId}) async {
    setResponseStatus(Status.loading);
    print('come here');
    print(companyId);
    try {
      final value = await attendanceEmployeeRepository.getCompanyTimingsApi(
        companyId: companyId,
      );
      state = state.copyWith(
        companytime: value.companytime,
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

  List glassCardList = [
    {
      'title': 'Attendees',
      'widget_icon1': 'assets/images/check_in_icon.svg',
      'widget_title1': 'Check In',
      'widget_icon2': 'assets/images/check_out_icon.svg',
      'widget_title2': 'Check Out',
    },
    {
      'title': 'Leave Management',
      'widget_icon1': 'assets/images/vacation_balance_icon.svg',
      'widget_title1': 'Vacation Balance',
      'widget_icon2': 'assets/images/leave_request_icon.svg',
      'widget_title2': 'Leave Request',
    },
    {
      'title': 'General Information',
      'widget_icon1': 'assets/images/profile_icon.svg',
      'widget_title1': 'Profile',
      'widget_icon2': 'assets/images/company_icon.svg',
      'widget_title2': 'Company',
    }
  ];
}
