import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';
import '../../Module/SalaryPaySlip/Main/Model/SalaryPaySlip.dart';

class SalaryPaySlipRepository {
  final networkServices = NetworkServices();

  Future<SalaryPaySlip> getSalaryPaySlipsApi(
      {required bearerToken, required employeeId, required type}) async {
    var response = await networkServices.getReq(
        "${Api.getSalaryPaySlips}/$employeeId/$type",
        bearerToken: bearerToken);
    log(response.toString());

    return SalaryPaySlip.fromJson(response);
  }
}
