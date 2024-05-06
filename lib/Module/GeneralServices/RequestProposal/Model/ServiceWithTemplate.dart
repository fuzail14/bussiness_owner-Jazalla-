class ServiceWithTemplate {
  ServiceWithTemplate({
    required this.success,
    required this.serviceDetailForProposal,
    required this.proposalTemplate,
  });
  late final bool success;
  late final ServiceDetailForProposal serviceDetailForProposal;
  late final List<ProposalTemplate> proposalTemplate;

  ServiceWithTemplate.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serviceDetailForProposal =
        ServiceDetailForProposal.fromJson(json['serviceDetailForProposal']);
    proposalTemplate = List.from(json['proposalTemplate'])
        .map((e) => ProposalTemplate.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['serviceDetailForProposal'] = serviceDetailForProposal.toJson();
    data['proposalTemplate'] = proposalTemplate.map((e) => e.toJson()).toList();
    return data;
  }
}

class ServiceDetailForProposal {
  ServiceDetailForProposal({
    required this.id,
    required this.companyId,
    required this.name,
    required this.serviceType,
    required this.paymentMode,
  });
  int? id;
  int? companyId;
  String? name;
  String? serviceType;
  String? paymentMode;

  ServiceDetailForProposal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    serviceType = json['service_type'];
    paymentMode = json['payment_mode'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['name'] = name;
    data['service_type'] = serviceType;
    data['payment_mode'] = paymentMode;
    return data;
  }
}

class ProposalTemplate {
  ProposalTemplate({
    required this.id,
    required this.companyId,
    required this.title,
    required this.requestType,
    required this.content,
    required this.status,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });
  int? id;
  int? companyId;
  String? title;
  String? requestType;
  String? content;
  String? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  ProposalTemplate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    title = json['title'];
    requestType = json['request_type'];
    content = json['content'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['title'] = title;
    data['request_type'] = requestType;
    data['content'] = content;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
