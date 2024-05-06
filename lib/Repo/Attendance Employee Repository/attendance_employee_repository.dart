import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';
import '../../Module/Attendance Managment/Model/AttendanceEmployee.dart';

class AttendanceEmployeeRepository {
  final networkServices = NetworkServices();

  Future<AttendanceEmployee> getAttendanceEmployeeApi(
      {required bearerToken, required employeeId}) async {
    var response = await networkServices.getReq(
        "${Api.getEmployeeAttendance}/$employeeId",
        bearerToken: bearerToken);
    log(response.toString());

    return AttendanceEmployee.fromJson(response);
  }
}
