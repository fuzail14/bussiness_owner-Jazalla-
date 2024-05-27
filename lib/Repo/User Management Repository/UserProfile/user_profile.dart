import 'dart:developer';
import 'package:image_picker/image_picker.dart';

import '../../../Constants/api_routes.dart';
import '../../../Module/Profile/Model/UserProfile.dart';
import '../../../Services/Network Services/network_services.dart';

class UserProfileRepository {
  final networkServices = NetworkServices();

  Future<UserProfile> getUserProfileApi(
      {required bearerToken, required userId}) async {
    var response = await networkServices.getReq("${Api.userProfile}/$userId",
        bearerToken: bearerToken);
    log(response.toString());

    return UserProfile.fromJson(response);
  }

  Future<dynamic> sendAvatar(Map<String, String> data,
      {XFile? avatarFile}) async {
    var response = await networkServices.postFormReq(Api.updateUserAvatar, data,
        imageFile: avatarFile);
    return response;
  }

  Future<dynamic> updatePassword(
    Map<String, String> data,
  ) async {
    var response =
        await networkServices.postFormReq(Api.updatepasswordApi, data);
    return response;
  }
}
