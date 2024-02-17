import 'dart:developer';
import 'package:bussines_owner/Repo/Tenders%20Repo/tenders_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../Model/Tender.dart';

final tendersProvider =
    StateNotifierProvider<TendersController, TendersState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return TendersController(person: person);
}, dependencies: [personProvider]);

class TendersState {
  final Status responseStatus;
  final List<Tenders> tendersList;

  TendersState(
      {this.responseStatus = Status.loading, this.tendersList = const []});

  TendersState copyWith({Status? responseStatus, List<Tenders>? tendersList}) {
    return TendersState(
      responseStatus: responseStatus ?? this.responseStatus,
      tendersList: tendersList ?? this.tendersList,
    );
  }
}

class TendersController extends StateNotifier<TendersState> {
  final tendersRepository = TendersRepository();
  final Person person;

  TendersController({required this.person}) : super(TendersState()) {
    _loadTenders();
  }

  Future<void> _loadTenders() async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await tendersRepository.TendersResponse(bearerToken: person.Bearer);
      state = state.copyWith(
        tendersList: value.tenders,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);

      // Handle error
      log(e.toString());
      log(stackTrace.toString());
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  List<Map<String, dynamic>> businessProviders = [
    {'id': '1', 'name': 'Buyer', 'isChecked': false},
    {'id': '2', 'name': 'Supplier', 'isChecked': false},
    {'id': '3', 'name': 'Service-Provider', 'isChecked': false},
  ];
}
