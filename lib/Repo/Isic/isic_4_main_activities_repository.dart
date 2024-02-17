// import 'dart:developer';
// import '../../Constants/api_routes.dart';
// import '../../Global/GlobalModels/isic4mainactivities.dart';
// import '../../Services/Network Services/network_services.dart';

// class Isic4MainActivitiesRepository {
//   final networkServices = NetworkServices();

//   Future<Isic4MainActivity> isic4MainActivityApi({
//     required bearerToken,
//   }) async {
//     var response = await networkServices.getReq(Api.getIsic4MainActivities,
//         bearerToken: bearerToken);
//     log(response.toString());

//     return Isic4MainActivity.fromJson(response);
//   }
// }
