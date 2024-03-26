import '../../Constants/api_routes.dart';
import '../../Module/Notifications/Model/Notification.dart';
import '../../Services/Network Services/network_services.dart';

class NotificationRepository {
  final networkServices = NetworkServices();

  Future<Notification> notificationViewApi({
    required companyId,
    required bearerToken,
  }) async {
    var response = await networkServices
        .getReq("${Api.getNotifications}/$companyId", bearerToken: bearerToken);

    return Notification.fromJson(response);
  }

  Future<dynamic> markNotificationAsRead(data) async {
    var response =
        await networkServices.postFormReq(Api.markNotificationAsRead, data);
    return response;
  }
}
