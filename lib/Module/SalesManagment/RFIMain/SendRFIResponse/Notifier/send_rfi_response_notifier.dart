import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/SalesManagment/RFI/DetailRepo/sales_managment_rfi_detail_repository.dart';

class SendRFIResponseState {
  final Status responseStatus;

  final bool isLoading;
  final File? pdfFile;

  SendRFIResponseState({
    this.responseStatus = Status.loading,
    this.isLoading = false,
    this.pdfFile,
  });

  SendRFIResponseState copyWith({
    Status? responseStatus,
    bool? isLoading,
    File? pdfFile,
  }) {
    return SendRFIResponseState(
        responseStatus: responseStatus ?? this.responseStatus,
        isLoading: isLoading ?? this.isLoading,
        pdfFile: pdfFile ?? this.pdfFile);
  }
}

class SendRFIResponseNotifier extends StateNotifier<SendRFIResponseState> {
  SendRFIResponseNotifier() : super(SendRFIResponseState()) {}

  TextEditingController descriptionController = TextEditingController();

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  void setPdfFile(File? pdfFile) {
    state = state.copyWith(pdfFile: pdfFile);
  }
}

final sendRFIResponseProvider = StateNotifierProvider.autoDispose<
    SendRFIResponseNotifier, SendRFIResponseState>((ref) {
  return SendRFIResponseNotifier();
}, dependencies: [routeArgsProvider]);
