import 'dart:developer';
import 'package:bussines_owner/Module/Event/Model/EmployeeEvenyt.dart';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';

class EventsRepository {
  final networkServices = NetworkServices();

  Future<EmployeeEvent> getEmployeeEventApi(
      {required bearerToken, required employeeId, required type}) async {
    var response = await networkServices.getReq(
        "${Api.getEmployeeEvents}/$employeeId/$type",
        bearerToken: bearerToken);
    log(response.toString());

    return EmployeeEvent.fromJson(response);
  }
}
