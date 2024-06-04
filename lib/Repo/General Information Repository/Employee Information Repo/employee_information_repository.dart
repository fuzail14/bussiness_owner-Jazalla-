import 'dart:developer';
import '../../../../Constants/api_routes.dart';
import '../../../../Services/Network Services/network_services.dart';
import '../../../Module/Employee Information/Detail/EmployeeInformationDetail/Model/ManageEmployeeInfoDetail.dart';
import '../../../Module/Employee Information/Main/Model/ManageEmployeeInformation.dart';

class EmployeeInformationRepository {
  final networkServices = NetworkServices();

  Future<ManageEmployeeInformation> getEmployeeInformationApi({
    required bearerToken,
    required Id,
    required type,
  }) async {
    var response = await networkServices.getReq(
        "${Api.getEmployeeInformation}/$Id/$type",
        bearerToken: bearerToken);
    log(response.toString());

    return ManageEmployeeInformation.fromJson(response);
  }

  Future<ManageEmployeeInfoDetail> getEmployeeInformationDetailApi({
    required bearerToken,
    required Id,
  }) async {
    var response = await networkServices.getReq(
        "${Api.getEmployeeInformationDetail}/$Id",
        bearerToken: bearerToken);
    log(response.toString());

    return ManageEmployeeInfoDetail.fromJson(response);
  }
}
