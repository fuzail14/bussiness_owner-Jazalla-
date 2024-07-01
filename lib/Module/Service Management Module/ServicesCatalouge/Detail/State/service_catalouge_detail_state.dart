import 'package:flutter/material.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../GeneralServices/Detail/Model/ServiceDetail.dart';

class ServiceCatalougeDetailState {
  final Status responseStatus;
  final List<Servicedetail> serviceDetail;
  final PageController pageController;
  final List<String> moreDetails;
  final bool moreDetail;
  final int? selectedOptionIndex;

  ServiceCatalougeDetailState({
    this.responseStatus = Status.loading,
    this.serviceDetail = const [],
    required this.pageController,
    this.moreDetails = const [
      'Details',
      'UNSPSC',
      'Review&\nRatings',
      'Refund&\nShipping'
    ],
    this.moreDetail = false,
    this.selectedOptionIndex,
  });

  ServiceCatalougeDetailState copyWith({
    Status? responseStatus,
    List<Servicedetail>? serviceDetail,
    PageController? pageController,
    List<String>? moreDetails,
    bool? moreDetail,
    int? selectedOptionIndex,
  }) {
    return ServiceCatalougeDetailState(
      responseStatus: responseStatus ?? this.responseStatus,
      serviceDetail: serviceDetail ?? this.serviceDetail,
      pageController: pageController ?? this.pageController,
      moreDetails: moreDetails ?? this.moreDetails,
      moreDetail: moreDetail ?? this.moreDetail,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
    );
  }
}
