import 'dart:developer';
import 'package:bussines_owner/Module/Company%20Policy/Model/CompanyPolicy.dart';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';

class CompanyPoliciesRepository {
  final networkServices = NetworkServices();

  Future<CompanyPolicy> getCompanyPoliciesApi(
      {required bearerToken, required companyId}) async {
    var response = await networkServices.getReq(
        "${Api.getCompanyPolicies}/$companyId",
        bearerToken: bearerToken);
    log(response.toString());

    return CompanyPolicy.fromJson(response);
  }
}
