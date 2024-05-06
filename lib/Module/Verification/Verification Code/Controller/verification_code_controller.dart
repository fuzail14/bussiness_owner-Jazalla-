import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';

class VerificationCodeState {
  final bool isLoading;
  final String otpCode;
  final String verificationId;

  VerificationCodeState({
    this.isLoading = false,
    this.otpCode = '',
    this.verificationId = '',
  });

  VerificationCodeState copyWith({
    bool? isLoading,
    String? otpCode,
    String? verificationId,
  }) {
    return VerificationCodeState(
      isLoading: isLoading ?? this.isLoading,
      otpCode: otpCode ?? this.otpCode,
      verificationId: verificationId ?? this.verificationId,
    );
  }
}

class VerificationCodeController extends StateNotifier<VerificationCodeState> {
  VerificationCodeController() : super(VerificationCodeState());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  String? verificatioCode;
  final otpCodeController = TextEditingController();
  void updateOtpCode(String otpCode) {
    state = state.copyWith(otpCode: otpCode);
  }

  Future<void> verifyUserOtp(
      BuildContext context, String smsCode, String verificationId) async {
    state = state.copyWith(isLoading: true);

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      print(credential);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      log(userCredential.user!.phoneNumber.toString().trim());
      myToast(
          gravity: ToastGravity.CENTER,
          msg: 'Otp Verified.',
          backgroundColor: const Color.fromARGB(255, 90, 172, 138));
      context.go(
        passwordScreen,
      );

      // Navigate to password screen or other logic
      // Example: ref.read(routerProvider.notifier).state = '/passwordScreen';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'session-expired') {
        myToast(
            msg: 'The SMS code has expired. Please request to resend the OTP.',
            isNegative: true);
        // Here, add logic to resend the OTP to the user's phone number
      } else {
        myToast(
            msg: e.message ?? 'An unknown error occurred', isNegative: true);
      }
    } catch (e) {
      log(e.toString());
      myToast(
          msg: 'An error occurred while verifying OTP: $e', isNegative: true);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  // You can add other methods here if needed
}

final verificationCodeProvider = StateNotifierProvider.autoDispose<
    VerificationCodeController, VerificationCodeState>((ref) {
  return VerificationCodeController();
});
