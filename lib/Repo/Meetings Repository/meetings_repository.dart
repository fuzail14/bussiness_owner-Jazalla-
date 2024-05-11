import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';
import '../../Module/MainHomeScreen/Employee Dashboard/Model/EmployeeMeeting.dart';

class MeetingRepository {
  final networkServices = NetworkServices();

  Future<EmployeeMeeting> getEmployeeMeetingApi(
      {required bearerToken, required employeeId}) async {
    var response = await networkServices.getReq(
        "${Api.getEmployeeMeetings}/$employeeId",
        bearerToken: bearerToken);
    log(response.toString());

    return EmployeeMeeting.fromJson(response);
  }
}
