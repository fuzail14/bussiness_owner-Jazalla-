// Define the state class
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Providers/argument_provider.dart';

class SendRFQResponseState {
  final Status responseStatus;

  final bool isLoading;
  final File? pdfFile;

  SendRFQResponseState({
    this.pdfFile,
    this.responseStatus = Status.loading,
    this.isLoading = false,
  });

  SendRFQResponseState copyWith({
    Status? responseStatus,
    bool? isLoading,
    File? pdfFile,
    int? currentQuantity,
  }) {
    return SendRFQResponseState(
      responseStatus: responseStatus ?? this.responseStatus,
      isLoading: isLoading ?? this.isLoading,
      pdfFile: pdfFile ?? this.pdfFile,
    );
  }
}

class SendRFQResponseNotifier extends StateNotifier<SendRFQResponseState> {
  // final int productId;
  // final int userId;
  // final int userCompanyId;

  //final requestQuoteRepository = RequestQuoteRepository();

  SendRFQResponseNotifier(
      //{
      // required this.productId,
      // required this.userId,
      // required this.userCompanyId,

      //}
      )
      : super(SendRFQResponseState()) {
    // _initialize();
  }
  final TextEditingController quantityController =
      TextEditingController(text: '5');

  final TextEditingController priceController =
      TextEditingController(text: '5000');
  final TextEditingController shippingController =
      TextEditingController(text: '0.00');

  @override
  void dispose() {
    quantityController.dispose();
    priceController.dispose();
    shippingController.dispose();

    super.dispose();
  }

  void setPdfFile(File? pdfFile) {
    state = state.copyWith(pdfFile: pdfFile);
  }
}

final sendRFQResponseProvider = StateNotifierProvider.autoDispose<
    SendRFQResponseNotifier, SendRFQResponseState>((ref) {
  final args = ref.watch(routeArgsProvider);
  // final productId = args['productId'] as int;
  // final userId = args['userId'] as int;
  // final userCompanyId = args['userCompanyId'] as int;

  return SendRFQResponseNotifier(
      // productId: productId,
      // userId: userId,
      // userCompanyId: userCompanyId,

      );
}, dependencies: [routeArgsProvider]);
