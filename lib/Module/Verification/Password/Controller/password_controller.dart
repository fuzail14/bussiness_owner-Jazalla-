import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../Constants/Person/person.dart';
import '../../../../Repo/Verification Repository/verification_repository.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import 'package:go_router/go_router.dart';

class PasswordState {
  final bool isLoading;
  final String phoneNum;

  final bool isHidden;

  PasswordState({
    this.isLoading = false,
    this.phoneNum = '',
    this.isHidden = true,
  });

  PasswordState copyWith({
    bool? isLoading,
    String? phoneNum,
    bool? isHidden,
  }) {
    return PasswordState(
      isLoading: isLoading ?? this.isLoading,
      phoneNum: phoneNum ?? this.phoneNum,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}

class PasswordController extends StateNotifier<PasswordState> {
  PasswordController() : super(PasswordState());

  final passwordController = TextEditingController();
  var phoneNumController = TextEditingController();
  final _repository = LoginRepository();

  Future<void> loginApi(
      String mobileNo, String password, BuildContext context) async {
    setLoading(true);

    Map<String, String> data = {
      "mobile_no": mobileNo.trim(),
      "password": password
    };

    _repository.loginApi(data).then((value) async {
      setLoading(true);

      if (kDebugMode) {
        print('value $value');
        final person = Person.fromJson(value);

        log(person.toString());
        MySharedPreferences.setUserData(person: person);

        Person person2 = await MySharedPreferences.getUserData();

        print(person2);
        print(person2.data!.companyId);

        context.goNamed(homescreen, extra: person2);

        // Get.offAllNamed(homescreen, arguments: person2);

        // Get.snackbar('Login', person.data!.name.toString());

        setLoading(false);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Fluttertoast.showToast(
          msg: 'Something Went Wrong', gravity: ToastGravity.CENTER);
      if (kDebugMode) {
        print(error.toString());
        print(stackTrace.toString());
        Fluttertoast.showToast(
            msg: error.toString(), gravity: ToastGravity.CENTER);
      }
    });
  }

  void togglePasswordView() {
    state = state.copyWith(isHidden: !state.isHidden);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }
}

final passwordProvider =
    StateNotifierProvider.autoDispose<PasswordController, PasswordState>((ref) {
  return PasswordController();
});
// checkPhoneNumberProvider
// verificationCodeProvider
