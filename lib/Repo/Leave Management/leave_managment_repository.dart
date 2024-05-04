import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';
import '../../Module/Leave Managment/Model/LeaveManagment.dart';
import '../../Module/LeaveCreate/Model/leave_type.dart';

class LeaveManagmentRepository {
  final networkServices = NetworkServices();

  Future<LeaveManagement> getEmployeeLeavesApi(
      {required bearerToken, required userId}) async {
    var response = await networkServices.getReq("${Api.getLeavesApi}/$userId",
        bearerToken: bearerToken);
    log(response.toString());

    return LeaveManagement.fromJson(response);
  }

  Future<LeaveTypes> getLeaveTypesApi(
      {required bearerToken, required companyId}) async {
    var response = await networkServices
        .getReq("${Api.getLeaveTypes}/$companyId", bearerToken: bearerToken);
    log(response.toString());

    return LeaveTypes.fromJson(response);
  }

  Future<dynamic> sendLeaveRequest(Map<String, String> data) async {
    var response = await networkServices.postFormReq(
      Api.leaveCreateApi,
      data,
    );
    return response;
  }
}
