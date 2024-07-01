import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../OnlineStore/Detail/Model/ProductDetail.dart';
import 'package:flutter/material.dart';

class ProductCatalougeDetailSalesState {
  final Status responseStatus;
  final List<Productdetail> productDetail;
  final PageController pageController;
  final bool moreDetail;
  final int? selectedOptionIndex;

  ProductCatalougeDetailSalesState({
    this.responseStatus = Status.loading,
    this.productDetail = const [],
    required this.pageController,
    this.moreDetail = false,
    this.selectedOptionIndex,
  });
  ProductCatalougeDetailSalesState copyWith({
    Status? responseStatus,
    List<Productdetail>? productDetail,
    PageController? pageController,
    bool? moreDetail,
    int? selectedOptionIndex,
  }) {
    return ProductCatalougeDetailSalesState(
      responseStatus: responseStatus ?? this.responseStatus,
      productDetail: productDetail ?? this.productDetail,
      pageController: pageController ?? this.pageController,
      moreDetail: moreDetail ?? this.moreDetail,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
    );
  }
}
