import '../../../../Data/Api Resp/api_response.dart';
import '../Model/AddApprovalAuthorityUser.dart';
import '../Model/AddApproverUser.dart';
import '../Model/AddModule.dart';
import '../Model/AddModuleAction.dart';
import '../Model/AddSubModule.dart';

class ApprovalAuthorityCreateState {
  final Status responseStatus;
  final List<Moduleforadd> moduleforadd;
  final String? selectedmodule;
  final int? selectedmoduleId;
  List<Submoduleforadd> submoduleforadd;
  List<Approvalauthorityuser> approvalauthorityuser;
  Submoduleforadd? selectedSubmodule;
  Approvalauthorityuser? selectedApprovalauthorityuser;
  Moduleactionforadd? selectedmoduleactionforadd;
  List<Moduleactionforadd> moduleactionforadd;

  final List<Approveruser> approveruser;
  final List<Approveruser> firstApproverUsers;
  final List<Approveruser> finalApproverUsers;
  final Approveruser? selectedFirstApprover;
  final Approveruser? selectedFinalApprover;
  final String? selectedCondition;
  final String? selectedConditionOperator;

  final Map<String, String> conditionMap;

  final int? selectedSubModuleId;
  final int? selectedUserId;
  final int? selectedActionId;
  final int? selectedFirstApproverId;
  final int? selectedFinalApproverId;

  bool isLoading;

  ApprovalAuthorityCreateState(
      {this.responseStatus = Status.loading,
      this.moduleforadd = const [],
      List<Submoduleforadd>? submoduleforadd,
      List<Approvalauthorityuser>? approvalauthorityuser,
      this.selectedSubmodule,
      this.selectedmodule,
      this.selectedmoduleId,
      this.selectedApprovalauthorityuser,
      this.selectedmoduleactionforadd,
      List<Moduleactionforadd>? moduleactionforadd,
      this.approveruser = const [],
      this.firstApproverUsers = const [],
      this.finalApproverUsers = const [],
      this.selectedFirstApprover,
      this.selectedFinalApprover,
      this.selectedCondition,
      this.conditionMap = const {
        'Greater Than': '>',
        'Less Than': '<',
        'Greater Than or equal to': '>=',
        'Less Than or equal to': '<=',
        'Equal to': '==',
        'Not Equal to': '!=',
      },
      this.selectedSubModuleId,
      this.selectedUserId,
      this.selectedActionId,
      this.selectedFirstApproverId,
      this.selectedFinalApproverId,
      this.isLoading = false,
      this.selectedConditionOperator})
      : submoduleforadd = submoduleforadd ?? [],
        approvalauthorityuser = approvalauthorityuser ?? [],
        moduleactionforadd = moduleactionforadd ?? [];

  ApprovalAuthorityCreateState copyWith(
      {Status? responseStatus,
      List<Moduleforadd>? moduleforadd,
      List<Submoduleforadd>? submoduleforadd,
      List<Approvalauthorityuser>? approvalauthorityuser,
      Submoduleforadd? selectedSubmodule,
      String? selectedmodule,
      int? selectedmoduleId,
      String? selectedCondition,
      Approvalauthorityuser? selectedApprovalauthorityuser,
      List<Moduleactionforadd>? moduleactionforadd,
      Moduleactionforadd? selectedmoduleactionforadd,
      List<Approveruser>? approveruser,
      List<Approveruser>? firstApproverUsers,
      List<Approveruser>? finalApproverUsers,
      Approveruser? selectedFirstApprover,
      Approveruser? selectedFinalApprover,
      int? selectedSubModuleId,
      int? selectedUserId,
      int? selectedActionId,
      int? selectedFirstApproverId,
      int? selectedFinalApproverId,
      bool? isLoading,
      String? selectedConditionOperator}) {
    return ApprovalAuthorityCreateState(
        responseStatus: responseStatus ?? this.responseStatus,
        moduleforadd: moduleforadd ?? this.moduleforadd,
        submoduleforadd: submoduleforadd ?? this.submoduleforadd,
        approvalauthorityuser:
            approvalauthorityuser ?? this.approvalauthorityuser,
        selectedSubmodule: selectedSubmodule ?? this.selectedSubmodule,
        selectedApprovalauthorityuser:
            selectedApprovalauthorityuser ?? this.selectedApprovalauthorityuser,
        selectedmodule: selectedmodule ?? this.selectedmodule,
        selectedmoduleactionforadd:
            selectedmoduleactionforadd ?? this.selectedmoduleactionforadd,
        moduleactionforadd: moduleactionforadd ?? this.moduleactionforadd,
        selectedCondition: selectedCondition ?? this.selectedCondition,
        conditionMap: conditionMap,
        approveruser: approveruser ?? this.approveruser,
        firstApproverUsers: firstApproverUsers ?? this.firstApproverUsers,
        finalApproverUsers: finalApproverUsers ?? this.finalApproverUsers,
        selectedFirstApprover:
            selectedFirstApprover ?? this.selectedFirstApprover,
        selectedFinalApprover:
            selectedFinalApprover ?? this.selectedFinalApprover,
        selectedmoduleId: selectedmoduleId ?? this.selectedmoduleId,
        selectedSubModuleId: selectedSubModuleId ?? this.selectedSubModuleId,
        selectedUserId: selectedUserId ?? this.selectedUserId,
        selectedActionId: selectedActionId ?? this.selectedActionId,
        selectedFirstApproverId:
            selectedFirstApproverId ?? this.selectedFirstApproverId,
        selectedFinalApproverId:
            selectedFinalApproverId ?? this.selectedFinalApproverId,
        isLoading: isLoading ?? this.isLoading,
        selectedConditionOperator:
            selectedConditionOperator ?? this.selectedConditionOperator);
  }
}
