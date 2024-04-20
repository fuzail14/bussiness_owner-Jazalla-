// Define the state class
import 'dart:io';

import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/General Service Repo/send_service_inquiry_repository.dart';

class ServiceInquiryState {
  final Status responseStatus;

  final bool isLoading;
  final File? pdfFile;

  ServiceInquiryState({
    this.pdfFile,
    this.responseStatus = Status.loading,
    this.isLoading = false,
  });

  ServiceInquiryState copyWith({
    Status? responseStatus,
    bool? isLoading,
    File? pdfFile,
  }) {
    return ServiceInquiryState(
      responseStatus: responseStatus ?? this.responseStatus,
      isLoading: isLoading ?? this.isLoading,
      pdfFile: pdfFile ?? this.pdfFile,
    );
  }
}

class ServiceInquiryNotifier extends StateNotifier<ServiceInquiryState> {
  ServiceInquiryNotifier() : super(ServiceInquiryState());
  final sendServiceInquiryRepository = SendServiceInquiryRepository();
  final key = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  void setPdfFile(File? pdfFile) {
    state = state.copyWith(pdfFile: pdfFile);
  }

  Future<void> sendInquiry() async {}

  Future<void> saveInquiry({
    required serviceId,
    required title,
    required userCompanyId,
    required userId,
    required supplierId,
    required description,
    File? pdfFile, // Make pdfFile nullable
    required BuildContext context,
  }) async {
    state = state.copyWith(isLoading: true); // Start loading

    Map<String, String> data = {
      "service_id": serviceId.toString(),
      "title": title.toString(),
      "user_id": userId.toString(),
      "buyer_id": userCompanyId.toString(),
      "network_id": supplierId.toString(),
      "request_type": 'service',
      "request_for": 'soi',
      "details": description,
      "status": '1',
    };
    print(data);

    try {
      await sendServiceInquiryRepository.sendServiceInquiry(data,
          pdfFile: pdfFile);
      state = state.copyWith(isLoading: false);
      Fluttertoast.showToast(
          msg: 'Data posted successfully', gravity: ToastGravity.CENTER);
      descriptionController.clear();
      GoRouter.of(context).pop();
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
}

final serviceinquiryProvider = StateNotifierProvider.autoDispose<
    ServiceInquiryNotifier, ServiceInquiryState>((ref) {
  return ServiceInquiryNotifier();
});
