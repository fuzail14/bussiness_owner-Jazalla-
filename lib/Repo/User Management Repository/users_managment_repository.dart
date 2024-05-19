import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';
import '../../Module/UserManagment/Model/AllCompanyUsers.dart';

class UsersManagmentRepository {
  final networkServices = NetworkServices();

  Future<AllCompanyUsers> getUsersApi(
      {required bearerToken, required companyId}) async {
    var response = await networkServices.getReq(
        "${Api.getAllCompanyUsers}/$companyId",
        bearerToken: bearerToken);
    log(response.toString());

    return AllCompanyUsers.fromJson(response);
  }
}
