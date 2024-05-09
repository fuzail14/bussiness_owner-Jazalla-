import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Repo/Events%20Repository/events_managment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Repo/Approval Managment Repository/approval_managment_repository.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../State/event_state.dart';

class EventNotifier extends StateNotifier<EventState> {
  final Person? person;
  final eventsRepository = EventsRepository();

  EventNotifier(this.person) : super(EventState()) {
    getEvents(employeeId: person!.employee!.id!, bearerToken: person!.Bearer);
  }

  final TextEditingController searchController = TextEditingController();

  Future<void> getEvents({required employeeId, required bearerToken}) async {
    setResponseStatus(Status.loading);

    try {
      final value = await eventsRepository.getEmployeeEventApi(
        employeeId: employeeId,
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

final EventProvider = StateNotifierProvider<EventNotifier, EventState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return EventNotifier(person);
}, dependencies: [personProvider]);
