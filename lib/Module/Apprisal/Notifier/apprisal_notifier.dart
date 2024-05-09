import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Repo/Appraisals%20Repository/appraisal_managment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/Approval Managment Repository/approval_managment_repository.dart';
import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';
import '../State/apprisal_state.dart';

class ApprisalNotifier extends StateNotifier<ApprisalState> {
  final Person? person;
  final appraisalManagmentRepository = AppraisalManagmentRepository();

  ApprisalNotifier(this.person) : super(ApprisalState()) {
    employeeAppraisalApi(
        employeeId: person!.employee!.id!, bearerToken: person!.Bearer);
  }

  final TextEditingController searchController = TextEditingController();

  Future<void> employeeAppraisalApi(
      {required employeeId, required bearerToken}) async {
    setResponseStatus(Status.loading);
    print('come here');
    print(employeeId);
    try {
      final value = await appraisalManagmentRepository.getAppraisalApi(
        employeeId: employeeId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        appraisals: value.appraisals,
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

// final ApprisalProvider = StateNotifierProvider.autoDispose<
//     ApprisalNotifier, ApprisalState>((ref) {
//   return ApprisalNotifier();
// });

final apprisalProvider =
    StateNotifierProvider<ApprisalNotifier, ApprisalState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ApprisalNotifier(person);
}, dependencies: [personProvider]);
