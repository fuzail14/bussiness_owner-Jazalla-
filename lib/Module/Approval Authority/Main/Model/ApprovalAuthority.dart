class Approvalauthority {
  Approvalauthority({
    required this.success,
    required this.approvalauthorities,
  });
  late final bool success;
  late final List<Approvalauthorities> approvalauthorities;

  Approvalauthority.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    approvalauthorities = List.from(json['approvalauthorities'])
        .map((e) => Approvalauthorities.fromJson(e))
        .toList();
  }
}

class Approvalauthorities {
  Approvalauthorities({
    required this.id,
    required this.companyId,
    required this.moduleId,
    required this.moduleFunctionId,
    required this.moduleActionId,
    required this.userId,
    required this.amount,
    required this.condOperator,
    required this.firstApprover,
    required this.finalApprover,
    required this.status,
    required this.createdBy,
    required this.module,
    required this.submodule,
    required this.user,
    required this.subaction,
    required this.initiator,
  });
  int? id;
  int? companyId;
  int? moduleId;
  int? moduleFunctionId;
  int? moduleActionId;
  int? userId;
  String? amount;
  String? condOperator;
  FirstApprover? firstApprover;
  FinalApprover? finalApprover;
  String? status;
  int? createdBy;

  Module? module;
  Submodule? submodule;
  User? user;
  Subaction? subaction;
  Initiator? initiator;

  Approvalauthorities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    moduleId = json['module_id'];
    moduleFunctionId = json['module_function_id'];
    moduleActionId = json['module_action_id'];
    userId = json['user_id'];
    amount = json['amount'];
    condOperator = json['cond_operator'];
    firstApprover = FirstApprover.fromJson(json['first_approver']);
    finalApprover = FinalApprover.fromJson(json['final_approver']);
    status = json['status'];
    createdBy = json['created_by'];

    module = Module.fromJson(json['module']);
    submodule = Submodule.fromJson(json['submodule']);
    user = User.fromJson(json['user']);
    subaction = Subaction.fromJson(json['subaction']);
    initiator = Initiator.fromJson(json['initiator']);
  }
}

class FirstApprover {
  FirstApprover({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  FirstApprover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class FinalApprover {
  FinalApprover({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  FinalApprover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Module {
  Module({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  Module.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Submodule {
  Submodule({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  Submodule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class User {
  User({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Subaction {
  Subaction({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  Subaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Initiator {
  Initiator({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  Initiator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
