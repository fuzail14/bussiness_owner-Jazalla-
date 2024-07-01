import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../../Constants/Person/person.dart';
import '../../../../../../Constants/Person/person_controller.dart';
import '../../../../../../Repo/General Information Repository/Employee Information Repo/employee_information_repository.dart';
import '../State/manage_salary_main_state.dart';

class ManageSalaryMainNotifier extends StateNotifier<ManageSalaryMainState> {
  final Person? person;
  final employeeInformationRepository = EmployeeInformationRepository();

  ManageSalaryMainNotifier(this.person) : super(ManageSalaryMainState()) {
    if (person!.data!.type == userTypeCompany) {
      getEmployeeInfoViewApi(
          userId: person!.data!.companyId!,
          type: person!.data!.type,
          bearerToken: person!.Bearer);
    } else {
      getEmployeeInfoViewApi(
          userId: person!.data!.employee!.id!,
          type: person!.data!.type,
          bearerToken: person!.Bearer);
    }
  }

  final TextEditingController searchController = TextEditingController();

  Future<void> getEmployeeInfoViewApi(
      {required userId, required type, required bearerToken}) async {
    setResponseStatus(Status.loading);
    print('come here');
    print(userId);
    try {
      final value =
          await employeeInformationRepository.getEmployeeInformationApi(
        Id: userId,
        type: type,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        employeesInfo: value.employeeinformation,
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

final manageSalaryProvider = StateNotifierProvider.autoDispose<
    ManageSalaryMainNotifier, ManageSalaryMainState>((ref) {
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ManageSalaryMainNotifier(person);
}, dependencies: [personProvider]);
