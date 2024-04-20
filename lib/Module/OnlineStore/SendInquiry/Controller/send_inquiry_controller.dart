// Define the state class
import 'dart:io';

import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/Online Store Repository/send_inquiry_repository.dart';

class InquiryState {
  final Status responseStatus;

  final bool isLoading;
  final File? pdfFile;

  InquiryState({
    this.pdfFile,
    this.responseStatus = Status.loading,
    this.isLoading = false,
  });

  InquiryState copyWith({
    Status? responseStatus,
    bool? isLoading,
    File? pdfFile,
  }) {
    return InquiryState(
      responseStatus: responseStatus ?? this.responseStatus,
      isLoading: isLoading ?? this.isLoading,
      pdfFile: pdfFile ?? this.pdfFile,
    );
  }
}

class InquiryNotifier extends StateNotifier<InquiryState> {
  InquiryNotifier() : super(InquiryState());
  final sendInquiryRepository = SendInquiryRepository();
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

  Future<void> saveInquiry({
    required productId,
    required productTitle,
    required userId,
    required userCompanyId,
    required companyId,
    required description,
    File? pdfFile, // Make pdfFile nullable
    required BuildContext context,
  }) async {
    state = state.copyWith(isLoading: true); // Start loading

    Map<String, String> data = {
      "product_id": productId.toString(),
      "title": productTitle.toString(),
      "user_id": userId.toString(),
      "buyer_id": userCompanyId.toString(),
      "network_id": companyId.toString(),
      "request_type": 'product',
      "details": description,
      "status": '1',
    };

    print(data);
    try {
      await sendInquiryRepository.sendInquiry(data, pdfFile: pdfFile);
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

final inquiryProvider =
    StateNotifierProvider.autoDispose<InquiryNotifier, InquiryState>((ref) {
  return InquiryNotifier();
});
