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
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Providers/argument_provider.dart';
import '../../../../Repo/General Service Repo/request_proposal_repository.dart';
import '../../../GeneralServices/RequestProposal/Model/ServiceWithTemplate.dart';

enum RadioCheck { yes, no }

class TenderResponseState {
  final Status responseStatus;
  String selectedValue;
  String paymentValue;
  String shippingModeValue;
  String locationAddressValue;
  int? selectedTemplateId;
  String proposedDurationValue;
  RadioCheck? radioCheckValue;

  final bool isLoading;
  final File? pdfFile;
  final ServiceDetailForProposal? serviceDetailForProposal;
  final List<ProposalTemplate> proposalTemplate;

  int currentQuantity;

  TenderResponseState({
    this.pdfFile,
    this.responseStatus = Status.loading,
    this.isLoading = false,
    this.selectedValue = '',
    this.paymentValue = 'Payment on delivery (Net 0)',
    this.shippingModeValue = 'EXW (Ex Works)',
    this.locationAddressValue = 'Primary Address',
    this.selectedTemplateId,
    this.serviceDetailForProposal,
    this.proposalTemplate = const [],
    this.currentQuantity = 0,
    this.proposedDurationValue = 'Hour/s',
    this.radioCheckValue,
  });

  TenderResponseState copyWith(
      {Status? responseStatus,
      bool? isLoading,
      File? pdfFile,
      String? selectedValue,
      String? paymentValue,
      String? shippingModeValue,
      String? locationAddressValue,
      int? selectedTemplateId,
      ServiceDetailForProposal? serviceDetailForProposal,
      List<ProposalTemplate>? proposalTemplate,
      int? currentQuantity,
      String? proposedDurationValue,
      RadioCheck? radioCheckValue}) {
    return TenderResponseState(
        responseStatus: responseStatus ?? this.responseStatus,
        isLoading: isLoading ?? this.isLoading,
        pdfFile: pdfFile ?? this.pdfFile,
        selectedValue: selectedValue ?? this.selectedValue,
        serviceDetailForProposal:
            serviceDetailForProposal ?? this.serviceDetailForProposal,
        proposalTemplate: proposalTemplate ?? this.proposalTemplate,
        currentQuantity: currentQuantity ?? this.currentQuantity,
        paymentValue: paymentValue ?? this.paymentValue,
        shippingModeValue: shippingModeValue ?? this.shippingModeValue,
        locationAddressValue: locationAddressValue ?? this.locationAddressValue,
        selectedTemplateId: selectedTemplateId ?? this.selectedTemplateId,
        proposedDurationValue:
            proposedDurationValue ?? this.proposedDurationValue,
        radioCheckValue: radioCheckValue ?? this.radioCheckValue);
  }
}

class TenderResponseNotifier extends StateNotifier<TenderResponseState> {
  final int tenderId;
  final int tenderCompanyId;

  final int userId;
  final int userCompanyId;
  final requestProposalRepository = RequestProposalRepository();

  TenderResponseNotifier({
    required this.tenderId,
    required this.tenderCompanyId,
    required this.userId,
    required this.userCompanyId,
  }) : super(TenderResponseState()) {
    _initialize();
  }

  void _initialize() {
    Future.delayed(const Duration(milliseconds: 600), () {
      serviceDetailWithTemaplateApi(serviceId: tenderId);
    });
  }

  final key = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController proposedDurationController = TextEditingController();
  TextEditingController otherproposedDurationUnitController =
      TextEditingController();

  String countryName = 'Saudi Arabia';
  String stateName = '';
  String cityName = '';
  TextEditingController districtController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController buildingNoController = TextEditingController();
  TextEditingController unitNoController = TextEditingController();

  final items = ['Item1', 'Item2', 'Item3'];

  final paymentMode = [
    'Payment on delivery (Net 0)',
    'Payment on delivery (Net 30)',
    'Payment on delivery (Net 60)'
  ];

  final shippingAddress = ['Primary Address', 'Alternate Address'];

  final proposedDurationItems = ['Hour/s', 'Day/s', 'Month/s', 'Others'];

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  void updateRadioValue(val) {
    state = state.copyWith(radioCheckValue: val);
  }

  Future<void> serviceDetailWithTemaplateApi({required int serviceId}) async {
    state = state.copyWith(responseStatus: Status.loading);

    try {
      final value =
          await requestProposalRepository.serviceDetailWithTemplateViewApi(
        serviceId: serviceId,
      );
      // int minQty = int.tryParse(value.serviceDetailForProposal.minQty!) ?? 0;

      state = state.copyWith(
        serviceDetailForProposal: value.serviceDetailForProposal,
        proposalTemplate: value.proposalTemplate,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      state = state.copyWith(responseStatus: Status.error);
      log(e.toString());
      log(stackTrace.toString());
      // Consider how to display errors in your UI
    }
  }

  void updateQuantity(int newQuantity) {
    state = state.copyWith(currentQuantity: newQuantity);
  }

  void setPdfFile(File? pdfFile) {
    state = state.copyWith(pdfFile: pdfFile);
  }

  Future<void> sendProposal({
    required serviceId,
    required userId,
    required userCompanyId,
    required companyId,
    required title,
    required description,
    required startDate,
    required proposedDurationTime,
    required proposedDurationUnit,
    required otherProposedDurationUnit,
    required paymentMode,
    required templateId,
    required location,
    File? pdfFile,
    required BuildContext context,
    String? countryName,
    String? stateName,
    String? cityName,
    String? district,
    String? streetName,
    String? zipCode,
    String? buildingNo,
    String? unitNo,
  }) async {
    String shippingAddressDbName;

    state = state.copyWith(isLoading: true);

    if (location == 'Alternate Address') {
      shippingAddressDbName = 'others';
      location = shippingAddressDbName;
    }

    Map<String, String?> shippingAddressMap = {
      "country": countryName,
      "state": stateName,
      "city": cityName,
      "district": district,
      "street_name": streetName,
      "zip_code": zipCode,
      "building_no": buildingNo,
      "unit_no": unitNo,
    };
    String shippingAddressJson = jsonEncode(shippingAddressMap);

    Map<String, String> data = {
      "service_id": serviceId.toString(),
      "user_id": userId.toString(),
      "buyer_id": userCompanyId.toString(),
      "service_provider_id": companyId.toString(),
      "title": title,
      "details": description,
      "payment_mode": paymentMode,
      'proposed_duration': proposedDurationTime,
      'proposed_duration_unit': proposedDurationUnit,
      'other_durationunit': otherProposedDurationUnit,
      "template_id": templateId.toString(),
      "location": location,
      'address': shippingAddressJson,
      "start_date": startDate,
      "status": '1',
    };
    print('data  $data');

    try {
      await requestProposalRepository.sendProposal(data, pdfFile: pdfFile);
      state = state.copyWith(isLoading: false);

      myToast(msg: 'Data posted successfully', gravity: ToastGravity.CENTER);
      descriptionController.clear();
      GoRouter.of(context).pop();
    } catch (error, stackTrace) {
      state = state.copyWith(isLoading: false);
      myToast(msg: 'Something Went Wrong', gravity: ToastGravity.CENTER);
      if (kDebugMode) {
        print(error.toString());
        print(stackTrace.toString());
      }
    }
  }

  void updateTemplateValue(int newValue) {
    state = state.copyWith(selectedTemplateId: newValue);
  }

  void updatePaymentModeValue(String newValue) {
    // state.paymentValue = newValue;
    state = state.copyWith(paymentValue: newValue);
  }

  void updateShippingModeValue(String newValue) {
    //state.shippingModeValue = newValue;
    state = state.copyWith(shippingModeValue: newValue);
  }

  void updateProposedDurationValue(String newValue) {
    //state.shippingModeValue = newValue;
    state = state.copyWith(proposedDurationValue: newValue);
  }

  void updatelocationAddressValue(String newValue) {
    //state.shippingModeValue = newValue;
    state = state.copyWith(locationAddressValue: newValue);
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

  Future<void> saveInquiry({
    required productId,
    required userId,
    required companyId,
    required description,
    File? pdfFile, // Make pdfFile nullable
    required BuildContext context,
  }) async {
    state = state.copyWith(isLoading: true); // Start loading

    Map<String, String> data = {
      "product_id": productId.toString(),
      "user_id": userId.toString(),
      "buyer_id": companyId.toString(),
      "request_type": 'product',
      "details": description,
      "status": '1',
    };

    // try {
    //   await sendInquiryRepository.sendInquiry(data, pdfFile: pdfFile);
    //   state = state.copyWith(isLoading: false);
    //   Fluttertoast.showToast(
    //       msg: 'Data posted successfully', gravity: ToastGravity.CENTER);
    //   descriptionController.clear();
    //   GoRouter.of(context).pop();
    // } catch (error, stackTrace) {
    //   state = state.copyWith(isLoading: false);
    //   myToast(msg: 'Something Went Wrong', gravity: ToastGravity.CENTER);
    //   if (kDebugMode) {
    //     print(error.toString());
    //     print(stackTrace.toString());
    //     Fluttertoast.showToast(
    //         msg: error.toString(), gravity: ToastGravity.CENTER);
    //   }
    // }
  }
}

// final requestQuoteProvider =
//     StateNotifierProvider.autoDispose<RequestQuoteNotifier, RequestQuoteState>(
//         (ref) {
//   return RequestQuoteNotifier();
// });

final tenderResponseProvider = StateNotifierProvider.autoDispose<
    TenderResponseNotifier, TenderResponseState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final tenderId = args['tenderId'] as int;
  final tenderCompanyId = args['tenderCompanyId'] as int;

  final userId = args['userId'] as int;
  final userCompanyId = args['userCompanyId'] as int;

  return TenderResponseNotifier(
    tenderId: tenderId,
    tenderCompanyId: tenderCompanyId,
    userId: userId,
    userCompanyId: userCompanyId,
  );
}, dependencies: [routeArgsProvider]);
