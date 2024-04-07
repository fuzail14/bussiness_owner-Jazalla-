// Define the state class
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Providers/argument_provider.dart';

class SendRFPResponseState {
  final Status responseStatus;

  final bool isLoading;
  final File? pdfFile;
  final String responseDurationTimeUnit;

  SendRFPResponseState(
      {this.pdfFile,
      this.responseStatus = Status.loading,
      this.isLoading = false,
      this.responseDurationTimeUnit = 'Hour/s'});

  SendRFPResponseState copyWith({
    Status? responseStatus,
    bool? isLoading,
    File? pdfFile,
    String? responseDurationTimeUnit,
  }) {
    return SendRFPResponseState(
        responseStatus: responseStatus ?? this.responseStatus,
        isLoading: isLoading ?? this.isLoading,
        pdfFile: pdfFile ?? this.pdfFile,
        responseDurationTimeUnit:
            responseDurationTimeUnit ?? this.responseDurationTimeUnit);
  }
}

class SendRFPResponseNotifier extends StateNotifier<SendRFPResponseState> {
  // final int productId;
  // final int userId;
  // final int userCompanyId;

  //final requestQuoteRepository = RequestQuoteRepository();

  SendRFPResponseNotifier(
      //{
      // required this.productId,
      // required this.userId,
      // required this.userCompanyId,

      //}
      )
      : super(SendRFPResponseState()) {
    // _initialize();
  }

  // void _initialize() {
  //   Future.delayed(const Duration(milliseconds: 600), () {
  //     productDetailWithTemaplateApi(productId: productId);
  //   });
  // }

  final key = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController totalPriceAmountController = TextEditingController();

  var responseDurationTimeUnitLists = ['Hour/s', 'Day/s', 'Week/s'];

  void setPdfFile(File? pdfFile) {
    state = state.copyWith(pdfFile: pdfFile);
  }

  void updateresponseDurationTimeUnit(String unit) {
    state = state.copyWith(responseDurationTimeUnit: unit);
  }

  Future StartDate(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        lastDate: DateTime(2080),
        context: context);
    if (picked != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future DurationTime(context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      timeController.text = pickedTime.format(context);
    }
  }
}

final sendRFPResponseProvider = StateNotifierProvider.autoDispose<
    SendRFPResponseNotifier, SendRFPResponseState>((ref) {
  final args = ref.watch(routeArgsProvider);
  // final productId = args['productId'] as int;
  // final userId = args['userId'] as int;
  // final userCompanyId = args['userCompanyId'] as int;

  return SendRFPResponseNotifier(
      // productId: productId,
      // userId: userId,
      // userCompanyId: userCompanyId,

      );
}, dependencies: [routeArgsProvider]);
