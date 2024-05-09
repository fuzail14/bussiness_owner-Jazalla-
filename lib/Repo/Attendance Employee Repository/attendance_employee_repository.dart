import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';
import '../../Module/Attendance Managment/Model/AttendanceEmployee.dart';
import '../../Module/MainHomeScreen/Main/Model/CompanyTimings.dart';

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

  Future<dynamic> clockInRequest(Map<String, String> data) async {
    var response = await networkServices.postFormReq(
      Api.clockInApi,
      data,
    );
    log('response show from repo $response');

    return response;
  }

  Future<dynamic> clockOutRequest(Map<String, String> data) async {
    var response = await networkServices.postFormReq(
      Api.clockOutApi,
      data,
    );

    return response;
  }

  // Future<CompanyTimings> getCompanyTimingsApi({required companyId}) async {
  //   var response = await networkServices.getReq(
  //     "${Api.getCompanyStartTime}/$companyId",
  //   );
  //   log(response.toString());

  //   return CompanyTimings.fromJson(response);
  // }
}
