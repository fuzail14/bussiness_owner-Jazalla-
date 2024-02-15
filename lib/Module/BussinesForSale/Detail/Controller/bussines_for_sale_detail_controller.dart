import 'dart:async';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Providers/argument_provider.dart';
import '../../../../Repo/Bussines For Sale Repo/bussines_sale_detail_repository.dart';
import '../Model/SaleBussinesDetail.dart';

final saleBussinesPageProvider =
    StateNotifierProvider<SaleBussinesPageController, SaleBussinesState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final Id = args['Id'] as int;
  final bearerToken = args['bearerToken'] as String;
  return SaleBussinesPageController(
    Id: Id,
    bearerToken: bearerToken,
  );
}, dependencies: [routeArgsProvider]);

class SaleBussinesState {
  final Status responseStatus;
  final List<Business> saleBussinesDetail;
  //final PageController pageController;
  // final List<String> moreDetails;
  // final bool moreDetail;
  // final int? selectedOptionIndex;

  SaleBussinesState({
    this.responseStatus = Status.loading,
    this.saleBussinesDetail = const [],
    //required this.pageController,
    // this.moreDetails = const [
    //   'Details',
    //   'UNSPSC',
    //   'Review&\nRatings',
    //   'Refund&\nShipping'
    // ],
    // this.moreDetail = false,
    // this.selectedOptionIndex,
  });

  SaleBussinesState copyWith({
    Status? responseStatus,
    List<Business>? saleBussinesDetail,
    // PageController? pageController,
    // List<String>? moreDetails,
    // bool? moreDetail,
    // int? selectedOptionIndex,
  }) {
    return SaleBussinesState(
      responseStatus: responseStatus ?? this.responseStatus,
      saleBussinesDetail: saleBussinesDetail ?? this.saleBussinesDetail,
      // pageController: pageController ?? this.pageController,
      // moreDetails: moreDetails ?? this.moreDetails,
      // moreDetail: moreDetail ?? this.moreDetail,
      // selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
    );
  }
}

class SaleBussinesPageController extends StateNotifier<SaleBussinesState> {
  final sussinessSaleDetailRepository = BussinessSaleDetailRepository();
  final int Id;
  final String bearerToken;

  SaleBussinesPageController({
    required this.Id,
    required this.bearerToken,
  }) : super(SaleBussinesState()) {
    _loadServiceDetails();
  }

  Future<void> _loadServiceDetails() async {
    setResponseStatus(Status.loading);
    try {
      final value =
          await sussinessSaleDetailRepository.bussinesSaleDetailViewApi(
        Id: Id,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        saleBussinesDetail: value.business,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }
}
