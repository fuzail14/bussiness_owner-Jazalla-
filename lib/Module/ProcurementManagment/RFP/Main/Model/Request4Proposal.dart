class Request4Proposal {
  Request4Proposal({
    required this.success,
    required this.requestForProposal,
  });
  late final bool success;
  late final List<RequestForProposal> requestForProposal;

  Request4Proposal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    requestForProposal = List.from(json['RequestForProposal'])
        .map((e) => RequestForProposal.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['RequestForProposal'] =
        requestForProposal.map((e) => e.toJson()).toList();
    return data;
  }
}

class RequestForProposal {
  RequestForProposal({
    required this.id,
    required this.serviceId,
    required this.buyerId,
    required this.serviceProviderId,
    required this.userId,
    required this.requestFrom,
    required this.title,
    required this.paymentMode,
    required this.details,
    required this.startDate,
    required this.proposedDuration,
    required this.proposedDurationUnit,
    this.otherDurationunit,
    required this.location,
    required this.address,
    required this.templateId,
    required this.status,
  });
  int? id;

  int? serviceId;
  int? buyerId;
  int? serviceProviderId;
  int? userId;
  String? requestFrom;
  String? title;

  String? paymentMode;

  String? details;
  String? startDate;
  int? proposedDuration;
  String? proposedDurationUnit;
  String? otherDurationunit;
  String? location;
  String? address;
  int? templateId;

  String? status;

  RequestForProposal.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    serviceId = json['service_id'];
    buyerId = json['buyer_id'];
    serviceProviderId = json['service_provider_id'];
    userId = json['user_id'];
    requestFrom = json['request_from'];
    title = json['title'];

    paymentMode = json['payment_mode'];

    details = json['details'];
    startDate = json['start_date'];
    proposedDuration = json['proposed_duration'];
    proposedDurationUnit = json['proposed_duration_unit'];
    otherDurationunit = null;
    location = json['location'];
    address = json['address'];
    templateId = json['template_id'];

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;

    data['service_id'] = serviceId;
    data['buyer_id'] = buyerId;
    data['service_provider_id'] = serviceProviderId;
    data['user_id'] = userId;
    data['request_from'] = requestFrom;
    data['title'] = title;

    data['payment_mode'] = paymentMode;
    data['details'] = details;
    data['start_date'] = startDate;
    data['proposed_duration'] = proposedDuration;
    data['proposed_duration_unit'] = proposedDurationUnit;
    data['other_durationunit'] = otherDurationunit;
    data['location'] = location;
    data['address'] = address;
    data['template_id'] = templateId;
    data['status'] = status;

    return data;
  }
}
