import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Providers/argument_provider.dart';
import '../../../../Repo/Bussines Communities Repository/bussines_community_detail_repository.dart';
import '../Model/BussinesCommunityDetail.dart';

class BussinesCommunityDetailState {
  final Status responseStatus;
  final List<Detail> companyDetail;

  BussinesCommunityDetailState({
    this.responseStatus = Status.loading,
    List<Detail>? companyDetail,
  }) : companyDetail = companyDetail ?? [];

  BussinesCommunityDetailState copyWith({
    Status? responseStatus,
    List<Detail>? companyDetail,
  }) {
    return BussinesCommunityDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      companyDetail: companyDetail ?? this.companyDetail,
    );
  }
}

class BussinesCommunityPageController
    extends StateNotifier<BussinesCommunityDetailState> {
  final BussinessCommunityDetailRepository bussinesCommunityDetailRepo;

  BussinesCommunityPageController({
    required this.bussinesCommunityDetailRepo,
    required int companyId,
    required String bearerToken,
  }) : super(BussinesCommunityDetailState()) {
    BussinesCommunityDetailViewApi(
        companyId: companyId, bearerToken: bearerToken);
  }
  GoogleMapController? mapController;
  LatLng center = const LatLng(26.300552, 50.172009);

  Future<void> BussinesCommunityDetailViewApi(
      {required int companyId, required String bearerToken}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await bussinesCommunityDetailRepo.bussinesCommunitiyDetailViewApi(
              companyId: companyId, bearerToken: bearerToken);
      state = state.copyWith(
        companyDetail: value.detail,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);

      log(e.toString());
      log(stackTrace.toString());
      myToast(msg: e);
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> launchMapsUrl(double lat, double lon) async {
    final Uri mapsUrl =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lon');
    if (await canLaunchUrl(mapsUrl)) {
      await launchUrl(mapsUrl);
    } else {
      throw 'Could not launch $mapsUrl';
    }
  }
}

final bussinesCommunityPageProvider = StateNotifierProvider<
    BussinesCommunityPageController, BussinesCommunityDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final companyId = args['companyId'] as int;
  final bearerToken = args['bearerToken'] as String;
  return BussinesCommunityPageController(
    bussinesCommunityDetailRepo: BussinessCommunityDetailRepository(),
    companyId: companyId,
    bearerToken: bearerToken,
  );
}, dependencies: [routeArgsProvider]);
