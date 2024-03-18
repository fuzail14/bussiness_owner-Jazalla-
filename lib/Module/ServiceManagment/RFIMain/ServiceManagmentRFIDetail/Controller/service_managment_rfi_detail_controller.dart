import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/Procurement Managment/RFI/DetailRepo/rfx_managment_rfi_detail_repository.dart';
import '../../../../ProcurementManagment/RFI/RfxManagmentRFIDetail/Model/RFIDetail.dart';

class ServiceManagmentRFIDetailState {
  final Status responseStatus;
  final List<RequestForInformationDetail> serviceManagmentRFIDetail;
  final bool isLoading;
  final File? pdfFile;
  ServiceManagmentRFIDetailState(
      {this.responseStatus = Status.loading,
      this.serviceManagmentRFIDetail = const [],
      this.isLoading = false,
      this.pdfFile});

  ServiceManagmentRFIDetailState copyWith(
      {Status? responseStatus,
      List<RequestForInformationDetail>? serviceManagmentRFIDetail,
      bool? isLoading,
      File? pdfFile}) {
    return ServiceManagmentRFIDetailState(
        responseStatus: responseStatus ?? this.responseStatus,
        serviceManagmentRFIDetail:
            serviceManagmentRFIDetail ?? this.serviceManagmentRFIDetail,
        isLoading: isLoading ?? this.isLoading,
        pdfFile: pdfFile ?? this.pdfFile);
  }
}

class ServiceManagmentRFIDetailNotifier
    extends StateNotifier<ServiceManagmentRFIDetailState> {
  ServiceManagmentRFIDetailNotifier({
    required int rfiId,
  }) : super(ServiceManagmentRFIDetailState()) {
    rfiDetailViewApi(rfiId: rfiId);
  }

  final rFXManagmentRFIDetailRepository = RFXManagmentRFIDetailRepository();
  TextEditingController descriptionController = TextEditingController();
  Future<void> rfiDetailViewApi({required int rfiId}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await rFXManagmentRFIDetailRepository.rfiDetailApi(rfiId: rfiId);
      state = state.copyWith(
        serviceManagmentRFIDetail: value.requestForInformationDetail,
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

  void setPdfFile(File? pdfFile) {
    state = state.copyWith(pdfFile: pdfFile);
  }
}

final serviceManagmentRFIDetailProvider = StateNotifierProvider<
    ServiceManagmentRFIDetailNotifier, ServiceManagmentRFIDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final rfiId = args['rfiId'] as int;

  return ServiceManagmentRFIDetailNotifier(
    rfiId: rfiId,
  );
}, dependencies: [routeArgsProvider]);
