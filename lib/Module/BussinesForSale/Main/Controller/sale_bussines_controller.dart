import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/Bussines For Sale Repo/sale_bussines_repository.dart';
import '../Model/SaleBussines.dart';

final businessForSaleControllerProvider =
    StateNotifierProvider<BusinessForSaleController, BusinessForSaleState>(
        (ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return BusinessForSaleController(person);
}, dependencies: [personProvider]);

class BusinessForSaleState {
  final Status responseStatus;
  final List<Businesses> businesses;
  final List<Companies> companies;

  BusinessForSaleState(
      {this.responseStatus = Status.loading,
      this.businesses = const [],
      this.companies = const []});

  BusinessForSaleState copyWith(
      {Status? responseStatus,
      List<Businesses>? businesses,
      List<Companies>? companies}) {
    return BusinessForSaleState(
      responseStatus: responseStatus ?? this.responseStatus,
      businesses: businesses ?? this.businesses,
      companies: companies ?? this.companies,
    );
  }
}

class BusinessForSaleController extends StateNotifier<BusinessForSaleState> {
  final saleBussinesRepository = SaleBussinesRepository();
  final Person? person;

  BusinessForSaleController(this.person) : super(BusinessForSaleState()) {
    _loadBusinessesForSale();
  }
  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  Future<void> _loadBusinessesForSale() async {
    state = state.copyWith(responseStatus: Status.loading);

    try {
      final value = await saleBussinesRepository.BussinesForSaleResponse(
          bearerToken: person!.Bearer);
      state = state.copyWith(
          businesses: value.businesses, responseStatus: Status.completed);
    } catch (error) {
      state = state.copyWith(responseStatus: Status.error);
      myToast(msg: error.toString());
    }
  }

  sortFilterApi({
    String? filtertype,
  }) async {
    setResponseStatus(Status.loading);
    state.businesses.clear();
    // try {
    //   final value = await saleBussinesRepository.CompanyFilterApi(
    //     type: filtertype,
    //     bearerToken: person!.Bearer,
    //   );
    //   state = state.copyWith(
    //     businesses: value.companies,
    //     responseStatus: Status.completed,
    //   );
    // } catch (e, stackTrace) {
    //   setResponseStatus(Status.error);
    //   log(e.toString());
    //   log(stackTrace.toString());

    //   myToast(msg: e.toString());
    // }
  }
}
