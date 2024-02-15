import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/BussinesCommunity/Detail/Model/BussinesCommunityDetail.dart';
import '../../Services/Network Services/network_services.dart';

class BussinessCommunityDetailRepository {
  final networkServices = NetworkServices();
  Future<BussinesCommunityDetail> bussinesCommunitiyDetailViewApi({
    required companyId,
    required bearerToken,
  }) async {
    var response = await networkServices
        .getReq("${Api.getCompanyDetail}/$companyId", bearerToken: bearerToken);
    log(response.toString());
    return BussinesCommunityDetail.fromJson(response);
  }
}
