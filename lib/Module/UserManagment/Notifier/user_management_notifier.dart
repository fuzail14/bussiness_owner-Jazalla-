import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/Approval Managment Repository/approval_managment_repository.dart';
import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';
import '../State/user_management_state.dart';

class UserManagementNotifier extends StateNotifier<UserManagementState> {
  final Person? person;
  final approvalManagmentRepository = ApprovalManagmentRepository();

  UserManagementNotifier(this.person) : super(UserManagementState()) {
    request4InformationViewApi(
        userId: person!.data!.id!, bearerToken: person!.Bearer);
  }

  final TextEditingController searchController = TextEditingController();
  var departmentList = [
    'Accounting Department',
    'Executive Offices',
    'HR Department',
    'Project Department',
    'Procurement Department',
    'Sales Department',
    'Services Department'
  ];
  var functionList = [
    'Accounting Management',
    'Executive Management',
    'HR Management',
  ];

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

  void updateDepartment(String department) {
    // Reset the function if the department is not 'Accounting Department'
    String newFunction = department == 'Accounting Department'
        ? state.function
        : 'Accounting Management';
    state = state.copyWith(department: department, function: newFunction);
  }

  void updateFunction(String function) {
    state = state.copyWith(function: function);
  }
}

// final UserManagementProvider = StateNotifierProvider.autoDispose<
//     UserManagementNotifier, UserManagementState>((ref) {
//   return UserManagementNotifier();
// });

final userManagementProvider =
    StateNotifierProvider<UserManagementNotifier, UserManagementState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return UserManagementNotifier(person);
}, dependencies: [personProvider]);
