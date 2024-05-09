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
import '../State/holidays_state.dart';

class HolidaysNotifier extends StateNotifier<HolidaysState> {
  final Person? person;
  final holidaysManagmentRepository = HolidaysManagmentRepository();

  HolidaysNotifier(this.person) : super(HolidaysState()) {
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

// final HolidaysProvider = StateNotifierProvider.autoDispose<
//     HolidaysNotifier, HolidaysState>((ref) {
//   return HolidaysNotifier();
// });

final holidaysProvider =
    StateNotifierProvider<HolidaysNotifier, HolidaysState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return HolidaysNotifier(person);
}, dependencies: [personProvider]);
