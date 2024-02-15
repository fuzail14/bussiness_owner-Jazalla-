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
import '../../../../Repo/Online Store Repository/request_quote_repository.dart';
import '../Model/ProductWithTemplate.dart';

class RequestQuoteState {
  final Status responseStatus;
  String selectedValue;
  String paymentValue;
  String shippingModeValue;
  String shippingAddressValue;
  int? selectedTemplateId;

  final bool isLoading;
  final File? pdfFile;
  final ProductDetailForQuotation? productDetail;
  final List<QuotationTemplate> quotationTemplate;
  int currentQuantity;

  RequestQuoteState({
    this.pdfFile,
    this.responseStatus = Status.loading,
    this.isLoading = false,
    this.selectedValue = '',
    this.paymentValue = 'Payment on delivery (Net 0)',
    this.shippingModeValue = 'EXW (Ex Works)',
    this.shippingAddressValue = 'Primary Address',
    this.selectedTemplateId,
    this.productDetail,
    this.quotationTemplate = const [],
    this.currentQuantity = 0,
  });

  RequestQuoteState copyWith({
    Status? responseStatus,
    bool? isLoading,
    File? pdfFile,
    String? selectedValue,
    String? paymentValue,
    String? shippingModeValue,
    String? shippingAddressValue,
    int? selectedTemplateId,
    ProductDetailForQuotation? productDetail,
    List<QuotationTemplate>? quotationTemplate,
    int? currentQuantity,
  }) {
    return RequestQuoteState(
        responseStatus: responseStatus ?? this.responseStatus,
        isLoading: isLoading ?? this.isLoading,
        pdfFile: pdfFile ?? this.pdfFile,
        selectedValue: selectedValue ?? this.selectedValue,
        productDetail: productDetail ?? this.productDetail,
        quotationTemplate: quotationTemplate ?? this.quotationTemplate,
        currentQuantity: currentQuantity ?? this.currentQuantity,
        paymentValue: paymentValue ?? this.paymentValue,
        shippingModeValue: shippingModeValue ?? this.shippingModeValue,
        shippingAddressValue: shippingAddressValue ?? this.shippingAddressValue,
        selectedTemplateId: selectedTemplateId ?? this.selectedTemplateId);
  }
}

class RequestQuoteNotifier extends StateNotifier<RequestQuoteState> {
  final int productId;
  final int userId;
  final int userCompanyId;
  final requestQuoteRepository = RequestQuoteRepository();

  RequestQuoteNotifier({
    required this.productId,
    required this.userId,
    required this.userCompanyId,
  }) : super(RequestQuoteState()) {
    _initialize();
  }

  void _initialize() {
    Future.delayed(const Duration(milliseconds: 600), () {
      productDetailWithTemaplateApi(productId: productId);
    });
  }

  final key = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController dateController = TextEditingController();
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
  final shippingMode = ['EXW (Ex Works)', 'DAP (Delivered at Place)'];
  final shippingAddress = ['Primary Address', 'Alternate Address'];

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> productDetailWithTemaplateApi({required int productId}) async {
    state = state.copyWith(responseStatus: Status.loading);

    try {
      final value =
          await requestQuoteRepository.productDetailWithTemplateViewApi(
        productId: productId,
      );
      int minQty = int.tryParse(value.productDetailForQuotation.minQty!) ?? 0;

      state = state.copyWith(
        productDetail: value.productDetailForQuotation,
        quotationTemplate: value.quotationTemplate,
        currentQuantity: minQty,
        responseStatus: Status.completed,
      );
      quantityController.text = minQty.toString();
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

  Future<void> sendQuotation({
    required productId,
    required userId,
    required userCompanyId,
    required companyId,
    required title,
    required description,
    required quantity,
    required unit,
    required paymentMode,
    required shippingMode,
    required templateId,
    required shippingAddress,
    required deliveryDate,
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
    String shippingModeDbName;
    String shippingAddressDbName;

    state = state.copyWith(isLoading: true);

    if (shippingMode == 'DAP (Delivered at Place)') {
      shippingModeDbName = 'DAP';
      shippingMode = shippingModeDbName;
    }

    if (shippingAddress == 'Alternate Address') {
      shippingAddressDbName = 'others';
      shippingAddress = shippingAddressDbName;
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
      "product_id": productId.toString(),
      "user_id": userId.toString(),
      "buyer_id": userCompanyId.toString(),
      "supplier_id": companyId.toString(),
      "title": title,
      "details": description,
      "quantity": quantity,
      "unit": unit,
      "payment_mode": paymentMode,
      "shipping_mode": shippingMode,
      "template_id": templateId.toString(),
      "shipping_address": shippingAddress,
      'address': shippingAddressJson,
      "delivery_date": deliveryDate,
      "status": '1',
    };

    try {
      await requestQuoteRepository.sendQuote(data, pdfFile: pdfFile);
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

  void updateShippingAddressValue(String newValue) {
    //state.shippingModeValue = newValue;
    state = state.copyWith(shippingAddressValue: newValue);
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
}

// final requestQuoteProvider =
//     StateNotifierProvider.autoDispose<RequestQuoteNotifier, RequestQuoteState>(
//         (ref) {
//   return RequestQuoteNotifier();
// });

final requestQuoteProvider =
    StateNotifierProvider.autoDispose<RequestQuoteNotifier, RequestQuoteState>(
        (ref) {
  final args = ref.watch(routeArgsProvider);
  final productId = args['productId'] as int;
  final userId = args['userId'] as int;
  final userCompanyId = args['userCompanyId'] as int;

  return RequestQuoteNotifier(
    productId: productId,
    userId: userId,
    userCompanyId: userCompanyId,
  );
}, dependencies: [routeArgsProvider]);
