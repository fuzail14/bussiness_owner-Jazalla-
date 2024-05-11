import 'dart:developer';
import '../../../Constants/api_routes.dart';
import '../../../Services/Network Services/network_services.dart';
import '../../Module/MainHomeScreen/Employee Dashboard/Model/EmployeeAnnouncement.dart';

class AnnouncementsRepository {
  final networkServices = NetworkServices();

  Future<EmployeeAnnouncment> getEmployeeAnnouncementApi(
      {required bearerToken, required employeeId}) async {
    var response = await networkServices.getReq(
        "${Api.getEmployeeAnnouncment}/$employeeId",
        bearerToken: bearerToken);
    log(response.toString());

    return EmployeeAnnouncment.fromJson(response);
  }
}
