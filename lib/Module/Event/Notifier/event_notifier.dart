import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Repo/Events%20Repository/events_managment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../State/event_state.dart';

class EventNotifier extends StateNotifier<EventState> {
  final Person? person;
  final eventsRepository = EventsRepository();

  EventNotifier(this.person) : super(EventState()) {
    if (person!.data!.type == userTypeCompany) {
      getEvents(
          employeeId: person!.data!.companyId,
          type: person!.data!.type,
          bearerToken: person!.Bearer);
    } else {
      getEvents(
          employeeId: person!.data!.employee!.id!,
          type: person!.data!.type,
          bearerToken: person!.Bearer);
    }
  }

  final TextEditingController searchController = TextEditingController();

  Future<void> getEvents(
      {required employeeId, required type, required bearerToken}) async {
    setResponseStatus(Status.loading);

    try {
      final value = await eventsRepository.getEmployeeEventApi(
        employeeId: employeeId,
        type: type,
        bearerToken: bearerToken,
      );
      state = state.copyWith(
        event: value.employeeevent,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }
}

// final EventProvider = StateNotifierProvider.autoDispose<
//     EventNotifier, EventState>((ref) {
//   return EventNotifier();
// });

final eventProvider =
    StateNotifierProvider.autoDispose<EventNotifier, EventState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return EventNotifier(person);
}, dependencies: [personProvider]);
