import 'dart:async';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Providers/argument_provider.dart';
import '../../../../Repo/Bussines For Sale Repo/bussines_sale_detail_repository.dart';
import '../State/profile_state.dart';
import 'package:flutter/material.dart';

final profilePageProvider =
    StateNotifierProvider<ProfilePageController, ProfileState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final Id = args['Id'] as int;
  final bearerToken = args['bearerToken'] as String;

  return ProfilePageController(
    Id: Id,
    bearerToken: bearerToken,
  );
}, dependencies: [routeArgsProvider]);

class ProfilePageController extends StateNotifier<ProfileState> {
  final sussinessSaleDetailRepository = BussinessSaleDetailRepository();
  final int Id;
  final String bearerToken;

  ProfilePageController({
    required this.Id,
    required this.bearerToken,
  }) : super(ProfileState()) {
    _loadServiceDetails();
  }

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Future<void> _loadServiceDetails() async {
    setResponseStatus(Status.loading);
    try {
      final value =
          await sussinessSaleDetailRepository.bussinesSaleDetailViewApi(
        Id: Id,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        profileDetail: value.business,
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
}
