import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/SalesManagment/RFI/DetailRepo/sales_managment_rfi_detail_repository.dart';
import '../Model/SalesManagmentRFIDetail.dart';

class SalesManagmentRFIDetailState {
  final Status responseStatus;
  final List<SalesManagmentRfiDetail> salesManagmentRFIDetail;
  final bool isLoading;
  final File? pdfFile;

  SalesManagmentRFIDetailState({
    this.responseStatus = Status.loading,
    this.salesManagmentRFIDetail = const [],
    this.isLoading = false,
    this.pdfFile,
  });

  SalesManagmentRFIDetailState copyWith({
    Status? responseStatus,
    List<SalesManagmentRfiDetail>? salesManagmentRFIDetail,
    bool? isLoading,
    File? pdfFile,
  }) {
    return SalesManagmentRFIDetailState(
        responseStatus: responseStatus ?? this.responseStatus,
        salesManagmentRFIDetail:
            salesManagmentRFIDetail ?? this.salesManagmentRFIDetail,
        isLoading: isLoading ?? this.isLoading,
        pdfFile: pdfFile ?? this.pdfFile);
  }
}

class SalesManagmentRFIDetailNotifier
    extends StateNotifier<SalesManagmentRFIDetailState> {
  int rfiId;
  Person person;
  SalesManagmentRFIDetailNotifier({
    required this.rfiId,
    required this.person,
  }) : super(SalesManagmentRFIDetailState()) {
    rfiDetailViewApi(rfiId: rfiId);
  }

  final salesManagmentRFIDetailRepository = SalesManagmentRFIDetailRepository();
  TextEditingController descriptionController = TextEditingController();

  Future<void> rfiDetailViewApi({required int rfiId}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await salesManagmentRFIDetailRepository.rfiDetailApi(rfiId: rfiId);
      state = state.copyWith(
        salesManagmentRFIDetail: value.salesManagmentRfiDetail,
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

final salesManagmentRFIDetailProvider = StateNotifierProvider.autoDispose<
    SalesManagmentRFIDetailNotifier, SalesManagmentRFIDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final rfiId = args['rfiId'] as int;
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }

  return SalesManagmentRFIDetailNotifier(rfiId: rfiId, person: person);
}, dependencies: [routeArgsProvider, personProvider]);
