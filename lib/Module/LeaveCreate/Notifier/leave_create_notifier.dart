import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Repo/Leave Management/leave_managment_repository.dart';
import '../State/leave_create_state.dart';
import 'package:flutter/foundation.dart';

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
  TextEditingController leaveReasonController = TextEditingController();
  final key = GlobalKey<FormState>();
  var appliedOn =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .toString()
          .split(' ')[0];

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

  void updateLeaveTypeValue(int newValue) {
    state = state.copyWith(leaveTypeId: newValue);
  }

  Future<void> sendLeaveRequestApi({
    required companyId,
    required employeeId,
    required leaveTypeId,
    required appliedOn,
    required startDate,
    required endDate,
    required leaveReason,
    required BuildContext context,
  }) async {
    state = state.copyWith(isLoading: true);
    print(leaveTypeId);

    print(appliedOn);

    Map<String, String> data = {
      "company_id": companyId.toString(),
      "employee_id": employeeId.toString(),
      "leave_type_id": leaveTypeId.toString(),
      "applied_on": appliedOn.toString(),
      "start_date": startDate.toString(),
      "end_date": endDate.toString(),
      "status": 'Pending',
      "leave_reason": leaveReason.toString(),
    };

    print(data);
    try {
      await leaveManagmentRepository.sendLeaveRequest(
        data,
      );
      state = state.copyWith(isLoading: false);
      Fluttertoast.showToast(
          msg: 'Leave Created successfully', gravity: ToastGravity.CENTER);
      //  descriptionController.clear();
      GoRouter.of(context).pop();
    } catch (error, stackTrace) {
      state = state.copyWith(isLoading: false);
      print('check catch error $error');

      // myToast(msg: 'Something Went Wrong', gravity: ToastGravity.CENTER);
      Fluttertoast.showToast(
          msg: 'You Already Have Leave Request',
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
}

final leaveCreateProvider =
    StateNotifierProvider<LeaveCreateNotifier, LeaveCreateState>((ref) {
  final person = ref.watch(personProvider);
  print('company id ${person!.data!.companyId}');
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return LeaveCreateNotifier(person);
}, dependencies: [personProvider]);
