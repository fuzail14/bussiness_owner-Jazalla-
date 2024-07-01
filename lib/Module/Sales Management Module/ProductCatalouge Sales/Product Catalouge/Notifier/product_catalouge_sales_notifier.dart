import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Repo/Online Store Repository/online_store_repository.dart';
import '../State/product_catalouge_sales_state.dart';

final productCatalougeSalesProvider = StateNotifierProvider.autoDispose<
    OnlineStoreController, ProductCatalougeSalesState>((ref) {
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return OnlineStoreController(person: person);
});

class OnlineStoreController extends StateNotifier<ProductCatalougeSalesState> {
  final Person person;
  final onlineStoreRepo = OnlineStoreRepository();

  OnlineStoreController({
    required this.person,
  }) : super(ProductCatalougeSalesState()) {
    _initialize();
  }

  void _initialize() {
    Future.delayed(const Duration(milliseconds: 300), () {
      onlineStoreViewApi(bearerToken: person.Bearer!);
    });
  }

  Future<void> onlineStoreViewApi({required String bearerToken}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await onlineStoreRepo.onlineStoreViewApi(bearerToken: bearerToken);
      state = state.copyWith(
        productsApiList: value.products,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }
}
