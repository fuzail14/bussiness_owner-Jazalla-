import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../Constants/constants.dart';

class CheckPhoneNumberState {
  final bool isLoading;
  String countryCode;
  String countryFlag;
  String phoneNumber;
  String verificationId;

  CheckPhoneNumberState(
      {this.isLoading = false,
      this.countryCode = '',
      this.countryFlag = '',
      this.phoneNumber = '',
      this.verificationId = ''});

  CheckPhoneNumberState copyWith(
      {bool? isLoading,
      String? countryCode,
      String? countryFlag,
      String? phoneNumber,
      String? verificationId}) {
    return CheckPhoneNumberState(
      isLoading: isLoading ?? this.isLoading,
      countryCode: countryCode ?? this.countryCode,
      countryFlag: countryFlag ?? this.countryFlag,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      verificationId: verificationId ?? this.verificationId,
    );
  }
}

class CheckPhoneNumberController extends StateNotifier<CheckPhoneNumberState> {
  CheckPhoneNumberController() : super(CheckPhoneNumberState()) {
    updateCountry("🇸🇦", "966");
  }
  final phoneNumberController = TextEditingController();

  final key = GlobalKey<FormState>();

  void verifyUserPhoneNumber(BuildContext context) async {
    setLoading(true);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: state.phoneNumber.trim(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        setLoading(false);
      },
      verificationFailed: (FirebaseAuthException e) {
        setLoading(false);
        myToast(msg: e.code.toString(), isNegative: true);
      },
      codeSent: (String verificationId, int? resendToken) {
        state.verificationId = verificationId;
        setLoading(false);
        // Navigate to verification code screen here
        context.goNamed(verificationCodeScreen);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setLoading(true);
      },
    );
  }

  void updateCountry(String flag, String code) {
    state = state.copyWith(countryFlag: flag, countryCode: code);
  }

  void updatePhoneNumber(String number) {
    state = state.copyWith(phoneNumber: number);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}

final checkPhoneNumberProvider = StateNotifierProvider.autoDispose<
    CheckPhoneNumberController, CheckPhoneNumberState>((ref) {
  return CheckPhoneNumberController();
});
