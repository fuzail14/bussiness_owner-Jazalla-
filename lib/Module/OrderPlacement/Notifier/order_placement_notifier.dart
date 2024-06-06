import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Constants/Person/person_controller.dart';
import '../../../../../Repo/Procurement Managment/RFI/rfi_repository.dart';

class OrderPlacementState {
  OrderPlacementState();

  OrderPlacementState copyWith() {
    return OrderPlacementState();
  }
}

class OrderPlacementStateNotifier extends StateNotifier<OrderPlacementState> {
  final request4InformationRepository = Request4InformationRepository();
  final Person person;
  OrderPlacementStateNotifier({required this.person})
      : super(OrderPlacementState());
}

final orderPlacementProvider = StateNotifierProvider.autoDispose<
    OrderPlacementStateNotifier, OrderPlacementState>((ref) {
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return OrderPlacementStateNotifier(person: person);
}, dependencies: [personProvider]);
