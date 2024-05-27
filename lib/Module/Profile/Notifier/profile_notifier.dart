import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bussines_owner/Constants/Person/person_controller.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Providers/argument_provider.dart';
import '../../../../Repo/Bussines For Sale Repo/bussines_sale_detail_repository.dart';
import '../../../Constants/Person/person.dart';
import '../../../Repo/User Management Repository/UserProfile/user_profile.dart';
import '../State/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';

final profilePageProvider =
    StateNotifierProvider<ProfilePageController, ProfileState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final person = ref.read(personProvider);

  final Id = args['Id'] as int;
  final bearerToken = args['bearerToken'] as String;

  return ProfilePageController(
      Id: Id, bearerToken: bearerToken, person: person);
}, dependencies: [routeArgsProvider]);

class ProfilePageController extends StateNotifier<ProfileState> {
  final userProfileRepository = UserProfileRepository();
  final int Id;
  final String bearerToken;
  Person? person;
  final ImagePicker _picker = ImagePicker();

  ProfilePageController(
      {required this.Id, required this.bearerToken, required this.person})
      : super(ProfileState()) {
    _loadUserDetail(userId: Id);
  }

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final key = GlobalKey<FormState>();

  Future<void> _loadUserDetail({required userId}) async {
    setResponseStatus(Status.loading);
    try {
      final value = await userProfileRepository.getUserProfileApi(
        userId: Id,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        profileDetail: value.profile,
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

  void togglePasswordView() {
    state = state.copyWith(isHidden: !state.isHidden);
  }

  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        state = state.copyWith(pickedFile: pickedFile, updateButton: true);
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> updateAvatar({
    required userId,
    XFile? avatarFile,
    required BuildContext context,
  }) async {
    state = state.copyWith(isLoading: true);

    Map<String, String> data = {
      "id": userId.toString(),
    };
    print(data);

    try {
      await userProfileRepository.sendAvatar(data, avatarFile: avatarFile);
      state = state.copyWith(isLoading: false, updateButton: false);

      myToast(
          msg: 'Profile Avatar Updated successfully',
          backgroundColor: const Color(0xff203C97));
    } catch (error, stackTrace) {
      state = state.copyWith(isLoading: false);
      myToast(msg: 'Something Went Wrong', gravity: ToastGravity.CENTER);
      if (kDebugMode) {
        print(error.toString());
        print(stackTrace.toString());
        Fluttertoast.showToast(
            msg: error.toString(), gravity: ToastGravity.CENTER);
      }
    }
  }

  Future<void> updatePassword({
    required userId,
    required old_Password,
    required new_Password,
  }) async {
    state = state.copyWith(isLoading: true);

    Map<String, String> data = {
      "id": userId.toString(),
      "old_password": old_Password.toString(),
      "new_password": new_Password.toString(),
    };
    print(data);

    try {
      await userProfileRepository.updatePassword(data);
      state = state.copyWith(
        isLoading: false,
      );
      oldPassword.clear();
      newPassword.clear();
      confirmPassword.clear();

      myToast(
          msg: 'Password Updated successfully',
          backgroundColor: const Color(0xff203C97));
    } catch (error, stackTrace) {
      state = state.copyWith(isLoading: false);

      if (error.toString().contains('401')) {
        myToast(
          msg: 'Old Password Not Match',
          backgroundColor: const Color(0xffEF2E61),
        );
      }
      if (error.toString().contains('403')) {
        myToast(
          msg: 'Validation Error',
          backgroundColor: const Color(0xffEF2E61),
        );
      }
      if (kDebugMode) {
        print(error.toString());
        print(stackTrace.toString());
      }
    }
  }
}
