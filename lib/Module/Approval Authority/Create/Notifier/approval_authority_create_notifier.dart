import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Repo/Approval Authority Repository/approval_authority_repository.dart';
import '../../../../Repo/Approval Managment Repository/approval_managment_repository.dart';
import '../Model/AddApprovalAuthorityUser.dart';
import '../Model/AddApproverUser.dart';
import '../Model/AddModule.dart';
import '../Model/AddModuleAction.dart';
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

  var conditionList = [
    'Greater Than',
    'Less Than',
    'Greater Than or equal to',
    'Less Than or equal to',
    'Equal to',
    'Not Equal to',
  ];

  Future<void> moduleViewApi() async {
    setResponseStatus(Status.loading);

    try {
      final value = await approvalAuthorityRepository
          .getModuleForAddApprovalAuthorityApi();
      // state = state.copyWith(
      //   moduleforadd: value.moduleforadd,
      //   responseStatus: Status.completed,
      //   selectedSubmodule: null,
      // );

      state = state.copyWith(
        moduleforadd: value.moduleforadd,
        responseStatus: Status.completed,
        // selectedSubmodule: null,
        // submoduleforadd: [],
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
      //   responseS
      //tatus: Status.completed,
      // );
      print('sub module list ${state.submoduleforadd}');

      // state = state.copyWith(
      //   selectedSubmodule: value.submoduleforadd.isNotEmpty
      //       ? value.submoduleforadd.first
      //       : null,
      // );
      state = state.copyWith(
          submoduleforadd: value.submoduleforadd,
          responseStatus: Status.completed);
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  void clearSubModule() {
    // state.submoduleforadd.clear();
    // state.selectedSubmodule = null;

    state = state.copyWith(submoduleforadd: [], selectedSubmodule: null);

    print('sub module list');
    print(state.submoduleforadd);
    print(state.selectedSubmodule);
    print(state.selectedSubmodule.runtimeType);
  }

  void setSelectedmoduleNameAndId(Moduleforadd module) {
    state.submoduleforadd.clear();
    state.selectedSubmodule = null;

    state = state.copyWith(
      selectedmodule: module.name,
      selectedmoduleId: module.id,
      submoduleforadd: state.submoduleforadd,
      selectedSubmodule: state.selectedSubmodule,
    );
    print('module Id ${state.selectedmoduleId}');
    print('sub module list');
    print(state.submoduleforadd);
    print(state.selectedSubmodule);
    print(state.selectedSubmodule.runtimeType);
  }

  void setSelectedSubModuleId(Submoduleforadd submodule) {
    state = state.copyWith(selectedSubModuleId: submodule.id);
    print('sub module Id ${state.selectedSubModuleId}');
  }

  void setSelectedUserId(Approvalauthorityuser approvalauthorityuser) {
    state = state.copyWith(selectedUserId: approvalauthorityuser.id);
    print('User Id ${state.selectedUserId}');
  }

  void setSelectedActionId(Moduleactionforadd moduleactionforadd) {
    state = state.copyWith(selectedActionId: moduleactionforadd.id);
    print('Action Id ${state.selectedActionId}');
  }

  Future<void> userViewApi({required companyId, required type}) async {
    state = state.copyWith(
        approvalauthorityuser: [],
        selectedApprovalauthorityuser: null,
        responseStatus: Status.loading);
    String? modifytype;
    if (type == 'Procurement Management') {
      modifytype = 'buyer';
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

    try {
      final value =
          await approvalAuthorityRepository.getUserForAddApprovalAuthorityApi(
              companyId: companyId, type: modifytype);
      state = state.copyWith(
        approvalauthorityuser: value.approvalauthorityuser,
        selectedApprovalauthorityuser: value.approvalauthorityuser.isNotEmpty
            ? value.approvalauthorityuser.first
            : null,
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
        moduleactionforadd: [],
        selectedmoduleactionforadd: null,
        responseStatus: Status.loading);

    try {
      final value = await approvalAuthorityRepository
          .getActionForAddApprovalAuthorityApi(subModuleId: moduleFunctionId);
      // state = state.copyWith(
      //   submoduleforadd: value.submoduleforadd,
      //   selectedSubmodule: null,
      //   responseStatus: Status.completed,
      // );
      state = state.copyWith(
          moduleactionforadd: value.moduleactionforadd,
          selectedmoduleactionforadd: value.moduleactionforadd.isNotEmpty
              ? value.moduleactionforadd.first
              : null,
          responseStatus: Status.completed);
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  Future<void> firstNFinalApproverViewApi({required companyId}) async {
    state = state.copyWith(
        // moduleactionforadd: [],
        // selectedmoduleactionforadd: null,
        responseStatus: Status.loading);

    try {
      final value = await approvalAuthorityRepository
          .getfirstNFinalApproverViewApiApi(companyId: companyId);

      state = state.copyWith(
        approveruser: value.approveruser,
        firstApproverUsers: value.approveruser,
        finalApproverUsers: value.approveruser,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  void updateFirstApprover(Approveruser? newValue) {
    final updatedFinalApproverUsers =
        state.approveruser.where((user) => user != newValue).toList();
    state = state.copyWith(
      selectedFirstApprover: newValue,
      selectedFirstApproverId: newValue!.id,
      finalApproverUsers: updatedFinalApproverUsers,
    );
    print('FirstApprover Id ${state.selectedFirstApproverId}');
  }

  void updateFinalApprover(Approveruser? newValue) {
    final updatedFirstApproverUsers =
        state.approveruser.where((user) => user != newValue).toList();
    state = state.copyWith(
      selectedFinalApprover: newValue,
      selectedFinalApproverId: newValue!.id,
      firstApproverUsers: updatedFirstApproverUsers,
    );
    print('Final ApproverId Id ${state.selectedFinalApproverId}');
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  void setSelectedSubmodule(Submoduleforadd? submodule) {
    state = state.copyWith(
      selectedSubmodule: submodule,
    );
  }

  void setSelectedApprovalauthorityuser(
      Approvalauthorityuser? approvalauthorityuser) {
    state = state.copyWith(
      selectedApprovalauthorityuser: approvalauthorityuser,
    );
  }

  void setSelectedModuleaction(Moduleactionforadd? moduleactionforadd) {
    state = state.copyWith(
      selectedmoduleactionforadd: moduleactionforadd,
    );
  }

  void setSelectedCondition(String newValue) {
    state = state.copyWith(
        selectedCondition: newValue,
        selectedConditionOperator: state.conditionMap[newValue]);
    print('condition operator ${state.selectedCondition}');
    print('condition operator value ${state.selectedConditionOperator}');
  }

  Future<void> saveApprovalAuthority({
    required companyId,
    required moduleId,
    required moduleFunctionId,
    required moduleActionId,
    required userId,
    required amount,
    required condOperator,
    required firstApproverId,
    required finalApproverId,
    required createdBy,
    required BuildContext context,
  }) async {
    state = state.copyWith(isLoading: true); // Start loading

    Map<String, String> data = {
      "company_id": companyId.toString(),
      "module_id": moduleId.toString(),
      "module_function_id": moduleFunctionId.toString(),
      "module_action_id": moduleActionId.toString(),
      "user_id": userId.toString(),
      "amount": amount.toString(),
      "cond_operator": condOperator,
      "first_approver": firstApproverId.toString(),
      "final_approver": finalApproverId.toString(),
      "status": '1',
      'created_by': createdBy.toString()
    };

    print(data);
    try {
      await approvalAuthorityRepository.sendApprovalAuthority(data);
      state = state.copyWith(isLoading: false);
      Fluttertoast.showToast(
          msg: 'Data posted successfully', gravity: ToastGravity.CENTER);

      GoRouter.of(context).pop();
    } catch (error, stackTrace) {
      state = state.copyWith(isLoading: false);
      myToast(msg: 'Something Went Wrong', gravity: ToastGravity.CENTER);

      print(error.toString());
      print(stackTrace.toString());
      Fluttertoast.showToast(
          msg: error.toString(), gravity: ToastGravity.CENTER);
    }
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
