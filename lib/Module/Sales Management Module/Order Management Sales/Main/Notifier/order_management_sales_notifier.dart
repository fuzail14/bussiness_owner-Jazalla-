import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Repo/Invoice Managemet/invoice_managment_repository.dart';
import '../State/order_management_sales_state.dart';

class OrderManagementSalesNotifier
    extends StateNotifier<OrderManagementSalesState> {
  final Person? person;
  final invoiceManagmentRepository = InvoiceManagmentRepository();

  OrderManagementSalesNotifier(this.person)
      : super(OrderManagementSalesState()) {
    invoiceForBuyerView(
        companyId: person!.data!.companyId!,
        companyActivity: person!.data!.company!.primaryActivity,
        bearerToken: person!.Bearer);
    print(person!.data!.company!.primaryActivity);
  }

  final TextEditingController searchController = TextEditingController();

  Future<void> invoiceForBuyerView(
      {required companyId,
      required companyActivity,
      required bearerToken}) async {
    setResponseStatus(Status.loading);
    print('come here');
    print(companyActivity);

    try {
      final value = await invoiceManagmentRepository.invoiceForBuyerApi(
        companyId: companyId,
        companyActivity: companyActivity,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        invoices: value.invoices,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }
}

final orderManagementSalesProvider = StateNotifierProvider.autoDispose<
    OrderManagementSalesNotifier, OrderManagementSalesState>((ref) {
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return OrderManagementSalesNotifier(person);
});
