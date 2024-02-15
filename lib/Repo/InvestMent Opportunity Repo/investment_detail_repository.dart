import 'dart:developer';
import '../../Constants/api_routes.dart';
import '../../Module/InvestMentOpportunity/Detail/Model/InvestmentDetail.dart';
import '../../Services/Network Services/network_services.dart';

class InvestmentDetailRepository {
  final networkServices = NetworkServices();
  Future<InvestmentDetail> serviceDetailViewApi({
    required Id,
    required bearerToken,
  }) async {
    var response = await networkServices.getReq(
        "${Api.getInvestmentOpportunityDetail}/$Id",
        bearerToken: bearerToken);
    log(response.toString());
    return InvestmentDetail.fromJson(response);
  }
}
