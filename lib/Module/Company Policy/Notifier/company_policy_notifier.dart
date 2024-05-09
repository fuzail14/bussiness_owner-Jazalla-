import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Repo/Company%20Policy%20Repository/company_policy_managment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Repo/Approval Managment Repository/approval_managment_repository.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../State/company_policy_state.dart';

class CompanyPolicyNotifier extends StateNotifier<CompanyPolicyState> {
  final Person? person;
  final companyPoliciesRepository = CompanyPoliciesRepository();

  CompanyPolicyNotifier(this.person) : super(CompanyPolicyState()) {
    companyPoliciesApi(
        companyId: person!.data!.companyId!, bearerToken: person!.Bearer);
  }

  final TextEditingController searchController = TextEditingController();

  Future<void> companyPoliciesApi(
      {required companyId, required bearerToken}) async {
    setResponseStatus(Status.loading);

    try {
      final value = await companyPoliciesRepository.getCompanyPoliciesApi(
        companyId: companyId,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        companypolicies: value.companypolicies,
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

// final CompanyPolicyProvider = StateNotifierProvider.autoDispose<
//     CompanyPolicyNotifier, CompanyPolicyState>((ref) {
//   return CompanyPolicyNotifier();
// });

final companyPolicyProvider =
    StateNotifierProvider<CompanyPolicyNotifier, CompanyPolicyState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return CompanyPolicyNotifier(person);
}, dependencies: [personProvider]);
