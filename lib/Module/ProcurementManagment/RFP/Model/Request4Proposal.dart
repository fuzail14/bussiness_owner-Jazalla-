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
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['RequestForProposal'] =
        requestForProposal.map((e) => e.toJson()).toList();
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;

    _data['service_id'] = serviceId;
    _data['buyer_id'] = buyerId;
    _data['service_provider_id'] = serviceProviderId;
    _data['user_id'] = userId;
    _data['request_from'] = requestFrom;
    _data['title'] = title;

    _data['payment_mode'] = paymentMode;
    _data['details'] = details;
    _data['start_date'] = startDate;
    _data['proposed_duration'] = proposedDuration;
    _data['proposed_duration_unit'] = proposedDurationUnit;
    _data['other_durationunit'] = otherDurationunit;
    _data['location'] = location;
    _data['address'] = address;
    _data['template_id'] = templateId;
    _data['status'] = status;

    return _data;
  }
}
