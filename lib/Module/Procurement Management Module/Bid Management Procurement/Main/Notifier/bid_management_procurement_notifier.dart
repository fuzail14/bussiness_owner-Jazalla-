import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Repo/Invoice Managemet/invoice_managment_repository.dart';
import '../State/bid_management_procurement_state.dart';

class BidManagementProcurementNotifier
    extends StateNotifier<BidManagementProcurementState> {
  final Person? person;
  final invoiceManagmentRepository = InvoiceManagmentRepository();

  BidManagementProcurementNotifier(this.person)
      : super(BidManagementProcurementState()) {
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

// final InvoiceManagementProvider = StateNotifierProvider.autoDispose<
//     InvoiceManagementNotifier, InvoiceManagementState>((ref) {
//   return InvoiceManagementNotifier();
// });

final bidManagementProvider = StateNotifierProvider.autoDispose<
    BidManagementProcurementNotifier, BidManagementProcurementState>((ref) {
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return BidManagementProcurementNotifier(person);
});
