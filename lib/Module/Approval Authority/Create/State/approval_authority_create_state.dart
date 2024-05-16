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
  final List<Submoduleforadd> submoduleforadd;
  final List<Approvalauthorityuser> approvalauthorityuser;
  Submoduleforadd? selectedSubmodule;
  final List<Moduleactionforadd> moduleactionforadd;
  final List<Approveruser> approveruser;
  ApprovalAuthorityCreateState({
    this.responseStatus = Status.loading,
    this.moduleforadd = const [],
    this.submoduleforadd = const [],
    this.approvalauthorityuser = const [],
    this.selectedSubmodule,
    this.selectedmodule,
    this.moduleactionforadd = const [],
    this.approveruser = const [],
  });

  ApprovalAuthorityCreateState copyWith(
      {Status? responseStatus,
      List<Moduleforadd>? moduleforadd,
      List<Submoduleforadd>? submoduleforadd,
      List<Approvalauthorityuser>? approvalauthorityuser,
      Submoduleforadd? selectedSubmodule,
      String? selectedmodule,
      List<Moduleactionforadd>? moduleactionforadd,
      List<Approveruser>? approveruser}) {
    return ApprovalAuthorityCreateState(
      responseStatus: responseStatus ?? this.responseStatus,
      moduleforadd: moduleforadd ?? this.moduleforadd,
      submoduleforadd: submoduleforadd ?? this.submoduleforadd,
      approvalauthorityuser:
          approvalauthorityuser ?? this.approvalauthorityuser,
      selectedSubmodule: selectedSubmodule ?? this.selectedSubmodule,
      selectedmodule: selectedmodule ?? this.selectedmodule,
      moduleactionforadd: moduleactionforadd ?? this.moduleactionforadd,
      approveruser: approveruser ?? this.approveruser,
    );
  }
}
