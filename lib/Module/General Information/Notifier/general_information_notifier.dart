import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../State/general_information_state.dart';

class GeneralInformationNotifier
    extends StateNotifier<GeneralInformationState> {
  GeneralInformationNotifier() : super(GeneralInformationState());

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }
}

// final LeaveManagmentProvider = StateNotifierProvider.autoDispose<
//     LeaveManagmentNotifier, LeaveManagmentState>((ref) {
//   return LeaveManagmentNotifier();
// });

final generalInformationProvider =
    StateNotifierProvider<GeneralInformationNotifier, GeneralInformationState>(
        (ref) {
  return GeneralInformationNotifier();
});
