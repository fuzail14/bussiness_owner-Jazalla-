import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Providers/argument_provider.dart';
import '../../../../Repo/General Service Repo/service_detail_repository.dart';
import '../Model/ServiceDetail.dart';

final servicePageProvider =
    StateNotifierProvider<ServicePageController, ServiceState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final serviceId = args['serviceId'] as int;
  final bearerToken = args['bearerToken'] as String;
  return ServicePageController(
    serviceId: serviceId,
    bearerToken: bearerToken,
  );
}, dependencies: [routeArgsProvider]);

class ServiceState {
  final Status responseStatus;
  final List<Servicedetail> serviceDetail;
  final PageController pageController;
  final List<String> moreDetails;
  final bool moreDetail;
  final int? selectedOptionIndex;

  ServiceState({
    this.responseStatus = Status.loading,
    this.serviceDetail = const [],
    required this.pageController,
    this.moreDetails = const [
      'Details',
      'UNSPSC',
      'Review&\nRatings',
      'Refund&\nShipping'
    ],
    this.moreDetail = false,
    this.selectedOptionIndex,
  });

  ServiceState copyWith({
    Status? responseStatus,
    List<Servicedetail>? serviceDetail,
    PageController? pageController,
    List<String>? moreDetails,
    bool? moreDetail,
    int? selectedOptionIndex,
  }) {
    return ServiceState(
      responseStatus: responseStatus ?? this.responseStatus,
      serviceDetail: serviceDetail ?? this.serviceDetail,
      pageController: pageController ?? this.pageController,
      moreDetails: moreDetails ?? this.moreDetails,
      moreDetail: moreDetail ?? this.moreDetail,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
    );
  }
}

class ServicePageController extends StateNotifier<ServiceState> {
  final serviceDetailRepository = ServiceDetailRepository();
  final int serviceId;
  final String bearerToken;

  ServicePageController({
    required this.serviceId,
    required this.bearerToken,
  }) : super(ServiceState(pageController: PageController())) {
    _loadServiceDetails();
  }

  Future<void> _loadServiceDetails() async {
    setResponseStatus(Status.loading);
    try {
      final value = await serviceDetailRepository.serviceDetailViewApi(
        serviceId: serviceId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        serviceDetail: value.servicedetail,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());
    }
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  void moreDetailBuild(int val) {
    state = state.copyWith(
      selectedOptionIndex: val,
      moreDetail: true,
    );
  }
}
