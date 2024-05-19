import 'dart:developer';
import 'package:bussines_owner/Module/Apprisal/Model/EmployeeAppraisal.dart';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';

class AppraisalManagmentRepository {
  final networkServices = NetworkServices();

  Future<EmployeeAppraisal> getAppraisalApi(
      {required bearerToken, required employeeId, required type}) async {
    var response = await networkServices.getReq(
        "${Api.getEmployeeAppraisals}/$employeeId/$type",
        bearerToken: bearerToken);
    log(response.toString());

    return EmployeeAppraisal.fromJson(response);
  }
}
