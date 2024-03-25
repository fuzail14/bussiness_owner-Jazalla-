import 'dart:convert';

import 'package:http/http.dart' as Http;

import '../../api_routes.dart';
import '../../constants.dart';

Future fcmtokenrefresh(int id, String fcmtoken, String bearertoken) async {
  print('fcm api come');
  try {
    final response = await Http.post(
      Uri.parse(Api.fcmTokenRefresh),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $bearertoken"
      },
      body: jsonEncode(<String, dynamic>{
        'id': id,
        'fcmtoken': fcmtoken,
      }),
    );
    print("Fcm token refresh Api Hits Successfully !");
  } catch (e) {
    myToast(msg: e);
  }
}
