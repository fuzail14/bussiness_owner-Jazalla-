import 'dart:async';
import 'dart:io';
import 'package:bussines_owner/Data/Api%20Resp/api_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/Online Store Repository/response_of_information_repository.dart';

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
  int rfiId;
  Person person;
  SendRFIResponseNotifier({
    required this.rfiId,
    required this.person,
  }) : super(SendRFIResponseState());

  TextEditingController descriptionController = TextEditingController();
  final responseOfInformationRepository = ResponseOfInformationRepository();
  final key = GlobalKey<FormState>();
  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  void setPdfFile(File? pdfFile) {
    state = state.copyWith(pdfFile: pdfFile);
  }

  Future<void> sendResponseOfInformation({
    required rfiId,
    required companyId,
    required userId,
    required response_detail,
    File? pdfFile,
    required BuildContext context,
  }) async {
    state = state.copyWith(isLoading: true);

    Map<String, String> data = {
      "request_for_information_id": rfiId.toString(),
      "company_id": companyId.toString(),
      "user_id": userId.toString(),
      "response_detail": response_detail,
      "status": '1',
    };

    print(data);

    try {
      await responseOfInformationRepository.responseOfInformation(data,
          pdfFile: pdfFile);
      state = state.copyWith(isLoading: false);
      Fluttertoast.showToast(
          msg: 'Data posted successfully', gravity: ToastGravity.CENTER);

      descriptionController.clear();
      GoRouter.of(context).pop();
    } catch (error, stackTrace) {
      state = state.copyWith(isLoading: false);

      Fluttertoast.showToast(
          msg: 'Something Went Wrong', gravity: ToastGravity.CENTER);

      if (kDebugMode) {
        print(error.toString());
        print(stackTrace.toString());
        Fluttertoast.showToast(
            msg: error.toString(), gravity: ToastGravity.CENTER);
      }
    }
  }
}

final sendRFIResponseProvider = StateNotifierProvider.autoDispose<
    SendRFIResponseNotifier, SendRFIResponseState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final rfiId = args['rfiId'] as int;
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }

  return SendRFIResponseNotifier(rfiId: rfiId, person: person);
}, dependencies: [routeArgsProvider, personProvider]);
