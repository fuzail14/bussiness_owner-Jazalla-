import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Providers/argument_provider.dart';
import '../../../../../Repo/Online Store Repository/online_store_detail_repository.dart';
import '../State/product_catalouge_detail_sales_state.dart';

final productCatalougeDetailDetailProvider = StateNotifierProvider<
    ProductCatalougeDetailSalesNotifier,
    ProductCatalougeDetailSalesState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final productId = args['productId'] as int;
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return ProductCatalougeDetailSalesNotifier(
    productId: productId,
    person: person,
  );
}, dependencies: [routeArgsProvider]);

class ProductCatalougeDetailSalesNotifier
    extends StateNotifier<ProductCatalougeDetailSalesState> {
  final onineStoreDetailRepository = OnineStoreDetailRepository();
  final Person person;

  final int productId;

  List<String> moreDetails = [
    'Details',
    'UNSPSC',
    'Review&\nRatings',
    'Refund&\nShipping'
  ];

  ProductCatalougeDetailSalesNotifier(
      {required this.productId, required this.person})
      : super(ProductCatalougeDetailSalesState(
            pageController: PageController())) {
    _initialize();
  }

  var onlineStoreProvider;
  void _initialize() {
    Future.delayed(const Duration(milliseconds: 300), () {
      productDetailViewApi(productId: productId, bearerToken: person.Bearer!);
    });
  }

  Future<void> productDetailViewApi(
      {required int productId, required String bearerToken}) async {
    state = state.copyWith(responseStatus: Status.loading);

    try {
      final value = await onineStoreDetailRepository.productDetailViewApi(
          productId: productId, bearerToken: bearerToken);
      state = state.copyWith(
        productDetail: value.productdetail,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      state = state.copyWith(responseStatus: Status.error);
      log(e.toString());
      log(stackTrace.toString());
      // Consider how to display errors in your UI
    }
  }

  void moreDetailBuild(int val) {
    state = state.copyWith(
      selectedOptionIndex: val,
      moreDetail: true,
    );
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }

  // Add other methods here
}
