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
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['serviceDetailForProposal'] = serviceDetailForProposal.toJson();
    _data['proposalTemplate'] =
        proposalTemplate.map((e) => e.toJson()).toList();
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['name'] = name;
    _data['service_type'] = serviceType;
    _data['payment_mode'] = paymentMode;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['title'] = title;
    _data['request_type'] = requestType;
    _data['content'] = content;
    _data['status'] = status;
    _data['created_by'] = createdBy;
    _data['updated_by'] = updatedBy;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
