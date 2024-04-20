import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../state/generated_otp_state.dart';

class GeneratedOtpNotifier extends StateNotifier<GeneratedOtpState> {
  GeneratedOtpNotifier() : super(GeneratedOtpState());

  final TextEditingController searchController = TextEditingController();

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }
}

final generatedOtpProvider =
    StateNotifierProvider<GeneratedOtpNotifier, GeneratedOtpState>((ref) {
  return GeneratedOtpNotifier();
});
