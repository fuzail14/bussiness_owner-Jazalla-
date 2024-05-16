import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Repo/Approval Authority Repository/approval_authority_repository.dart';
import '../../../../Repo/Approval Managment Repository/approval_managment_repository.dart';
import '../Model/AddSubModule.dart';
import '../State/approval_authority_create_state.dart';

class ApprovalAuthorityCreateNotifier
    extends StateNotifier<ApprovalAuthorityCreateState> {
  final Person? person;
  final approvalAuthorityRepository = ApprovalAuthorityRepository();

  ApprovalAuthorityCreateNotifier(this.person)
      : super(ApprovalAuthorityCreateState()) {
    moduleViewApi();
  }

  final TextEditingController searchController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController totalPriceAmountController = TextEditingController();

  var responseDurationTimeUnitLists = [
    'Casual ApprovalAuthority',
    'Medical ApprovalAuthority'
  ];

  Future<void> moduleViewApi() async {
    setResponseStatus(Status.loading);

    try {
      final value = await approvalAuthorityRepository
          .getModuleForAddApprovalAuthorityApi();
      state = state.copyWith(
        moduleforadd: value.moduleforadd,
        responseStatus: Status.completed,
        selectedSubmodule: null,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  Future<void> submoduleViewApi({required moduleId}) async {
    state = state.copyWith(
        submoduleforadd: [],
        selectedSubmodule: null,
        responseStatus: Status.loading);

    try {
      final value = await approvalAuthorityRepository
          .getSubModuleForAddApprovalAuthorityApi(moduleId: moduleId);
      // state = state.copyWith(
      //   submoduleforadd: value.submoduleforadd,
      //   selectedSubmodule: null,
      //   responseStatus: Status.completed,
      // );
      state = state.copyWith(
          submoduleforadd: value.submoduleforadd,
          selectedSubmodule: value.submoduleforadd.isNotEmpty
              ? value.submoduleforadd.first
              : null,
          responseStatus: Status.completed);
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  void setSelectedmoduleName(String? module) {
    state = state.copyWith(
      selectedmodule: module,
    );
  }

  Future<void> userViewApi({required companyId, required type}) async {
    String? modifytype;
    if (type == 'Procurement Management') {
      modifytype = 'Procurement manager';
    }
    if (type == 'Sales Management') {
      modifytype = 'Sales manager';
    }
    if (type == 'Service Management') {
      modifytype = 'Service manager';
    }
    if (type == 'Accounting Management') {
      modifytype = 'Accounting manager';
    }
    if (type == 'HR Management') {
      modifytype = 'HR manager';
    }
    if (type == 'Project Management') {
      modifytype = 'Project manager';
    }

    setResponseStatus(Status.loading);

    try {
      final value =
          await approvalAuthorityRepository.getUserForAddApprovalAuthorityApi(
              companyId: companyId, type: modifytype);
      state = state.copyWith(
        approvalauthorityuser: value.approvalauthorityuser,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  Future<void> actionViewApi({required moduleFunctionId}) async {
    state = state.copyWith(
        submoduleforadd: [],
        selectedSubmodule: null,
        responseStatus: Status.loading);

    try {
      final value = await approvalAuthorityRepository
          .getSubModuleForAddApprovalAuthorityApi(moduleId: moduleFunctionId);
      // state = state.copyWith(
      //   submoduleforadd: value.submoduleforadd,
      //   selectedSubmodule: null,
      //   responseStatus: Status.completed,
      // );
      state = state.copyWith(
          submoduleforadd: value.submoduleforadd,
          selectedSubmodule: value.submoduleforadd.isNotEmpty
              ? value.submoduleforadd.first
              : null,
          responseStatus: Status.completed);
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

  void setSelectedSubmodule(Submoduleforadd? submodule) {
    state = state.copyWith(
      selectedSubmodule: submodule,
    );
  }
}

final approvalAuthorityCreateProvider = StateNotifierProvider.autoDispose<
    ApprovalAuthorityCreateNotifier, ApprovalAuthorityCreateState>((ref) {
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ApprovalAuthorityCreateNotifier(person);
}, dependencies: [personProvider]);
