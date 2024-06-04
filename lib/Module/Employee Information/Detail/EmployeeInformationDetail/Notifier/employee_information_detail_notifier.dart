import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/Person/person_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../../Providers/argument_provider.dart';
import '../../../../../Constants/Person/person.dart';
import '../../../../../Repo/General Information Repository/Employee Information Repo/employee_information_repository.dart';
import '../State/employee_information_detail_state.dart';

final employeeInformationDetailProvider = StateNotifierProvider<
    EmployeeInformationDetailNotifier, EmployeeInformationDetailState>((ref) {
  final args = ref.watch(routeArgsProvider);
  final person = ref.read(personProvider);

  final id = args['Id'] as int;

  return EmployeeInformationDetailNotifier(id: id, person: person);
}, dependencies: [routeArgsProvider]);

class EmployeeInformationDetailNotifier
    extends StateNotifier<EmployeeInformationDetailState> {
  final employeeInformationRepository = EmployeeInformationRepository();
  final int id;

  Person? person;
  EmployeeInformationDetailNotifier({required this.id, required this.person})
      : super(EmployeeInformationDetailState()) {
    _loadEmployeeDetail(userId: id);
  }

  Future<void> _loadEmployeeDetail({required userId}) async {
    setResponseStatus(Status.loading);
    try {
      final value =
          await employeeInformationRepository.getEmployeeInformationDetailApi(
        Id: id,
        bearerToken: person!.Bearer,
      );
      state = state.copyWith(
        employeeinformationdetail: value.employeeinformationdetail,
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
