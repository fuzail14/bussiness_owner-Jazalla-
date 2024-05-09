import 'dart:developer';
import 'package:bussines_owner/Module/Holidays/Model/EmployeeHoliday.dart';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';

class HolidaysManagmentRepository {
  final networkServices = NetworkServices();

  Future<EmployeeHoliday> getCompanyHolidaysApi(
      {required bearerToken, required companyId}) async {
    var response = await networkServices.getReq(
        "${Api.getEmployeeHolidays}/$companyId",
        bearerToken: bearerToken);
    log(response.toString());

    return EmployeeHoliday.fromJson(response);
  }
}
