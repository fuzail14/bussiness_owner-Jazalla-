import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Repo/Holidays%20Repository/holidays_managment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Repo/Approval Managment Repository/approval_managment_repository.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../State/employees_asset_state.dart';

class EmployeesAssetNotifier extends StateNotifier<EmployeesAssetState> {
  final Person? person;
  final holidaysManagmentRepository = HolidaysManagmentRepository();

  EmployeesAssetNotifier(this.person) : super(EmployeesAssetState()) {
    getCompanyHolidays(
        companyId: person!.data!.companyId!, bearerToken: person!.Bearer);
  }

  final TextEditingController searchController = TextEditingController();

  Future<void> getCompanyHolidays(
      {required companyId, required bearerToken}) async {
    setResponseStatus(Status.loading);

    try {
      final value = await holidaysManagmentRepository.getCompanyHolidaysApi(
        companyId: companyId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        holidays: value.holidays,
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

final employeesAssetProvider = StateNotifierProvider.autoDispose<
    EmployeesAssetNotifier, EmployeesAssetState>((ref) {
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return EmployeesAssetNotifier(person);
}, dependencies: [personProvider]);
