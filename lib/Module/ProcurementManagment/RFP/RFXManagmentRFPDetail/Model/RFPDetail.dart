import '../../../../../Constants/Global/Model/Buyer.dart';

class RequestForProposalDetail {
  RequestForProposalDetail({
    required this.success,
    required this.rfpDetail,
  });
  late final bool success;
  late final List<RfpDetail> rfpDetail;

  RequestForProposalDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    rfpDetail =
        List.from(json['rfpDetail']).map((e) => RfpDetail.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['rfpDetail'] = rfpDetail.map((e) => e.toJson()).toList();
    return data;
  }
}

class RfpDetail {
  RfpDetail({
    required this.id,
    required this.serviceId,
    required this.buyerId,
    required this.serviceProviderId,
    required this.userId,
    required this.requestFrom,
    required this.title,
    required this.paymentMode,
    required this.advancePayment,
    required this.paymentDistribution,
    required this.details,
    required this.startDate,
    required this.proposedDuration,
    required this.proposedDurationUnit,
    required this.otherDurationunit,
    required this.location,
    required this.address,
    required this.templateId,
    required this.attachment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.buyer,
  });
  int? id;

  int? serviceId;
  int? buyerId;
  int? serviceProviderId;
  int? userId;
  String? requestFrom;
  String? title;

  String? paymentMode;
  String? advancePayment;
  String? paymentDistribution;
  String? details;
  String? startDate;
  int? proposedDuration;
  String? proposedDurationUnit;
  String? otherDurationunit;
  String? location;
  String? address;
  int? templateId;
  String? attachment;
  String? status;
  String? createdAt;
  String? updatedAt;
  Buyer? buyer;

  RfpDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    serviceId = json['service_id'];
    buyerId = json['buyer_id'];
    serviceProviderId = json['service_provider_id'];
    userId = json['user_id'];
    requestFrom = json['request_from'];
    title = json['title'];

    paymentMode = json['payment_mode'];
    advancePayment = json['advance_payment'];
    paymentDistribution = json['payment_distribution'];
    details = json['details'];
    startDate = json['start_date'];
    proposedDuration = json['proposed_duration'];
    proposedDurationUnit = json['proposed_duration_unit'];
    otherDurationunit = json['other_durationunit'];
    location = json['location'];
    address = json['address'];
    templateId = json['template_id'];
    attachment = json['attachment'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    buyer = Buyer.fromJson(json['buyer']);
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
    data['advance_payment'] = advancePayment;
    data['payment_distribution'] = paymentDistribution;
    data['details'] = details;
    data['start_date'] = startDate;
    data['proposed_duration'] = proposedDuration;
    data['proposed_duration_unit'] = proposedDurationUnit;
    data['other_durationunit'] = otherDurationunit;
    data['location'] = location;
    data['address'] = address;
    data['template_id'] = templateId;
    data['attachment'] = attachment;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['buyer'] = buyer!.toJson();
    return data;
  }
}
