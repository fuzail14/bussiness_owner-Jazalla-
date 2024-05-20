import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Repo/SalaryPaySlip Repository/salarypayslip_repository.dart';
import '../State/salary_payslip_state.dart';

class SalaryPaySlipNotifier extends StateNotifier<SalaryPaySlipState> {
  final Person? person;
  final salaryPaySlipRepository = SalaryPaySlipRepository();

  SalaryPaySlipNotifier(this.person) : super(SalaryPaySlipState()) {
    if (person!.data!.type == 'company') {
      salaryPaySlipViewApi(
          employeeId: person!.data!.companyId!,
          bearerToken: person!.Bearer,
          type: person!.data!.type);
    } else {
      salaryPaySlipViewApi(
          employeeId: person!.data!.employee!.id!,
          bearerToken: person!.Bearer,
          type: person!.data!.type);
    }
  }

  final TextEditingController searchController = TextEditingController();

  Future<void> salaryPaySlipViewApi(
      {required employeeId, required type, required bearerToken}) async {
    setResponseStatus(Status.loading);
    print('come here');
    print(employeeId);

    try {
      final value = await salaryPaySlipRepository.getSalaryPaySlipsApi(
        employeeId: employeeId,
        type: type,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        payslips: value.payslips,
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

final salaryPaySlipProvider = StateNotifierProvider.autoDispose<
    SalaryPaySlipNotifier, SalaryPaySlipState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return SalaryPaySlipNotifier(person);
}, dependencies: [personProvider]);
