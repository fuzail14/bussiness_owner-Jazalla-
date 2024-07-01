import 'package:bussines_owner/Module/GeneralServices/Services/Model/GeneralService.dart';

import '../../../../../Data/Api Resp/api_response.dart';

class ServiceCatalougeState {
  final Status responseStatus;
  final List<Services> servicesList;

  ServiceCatalougeState(
      {this.responseStatus = Status.loading, this.servicesList = const []});

  ServiceCatalougeState copyWith(
      {Status? responseStatus, List<Services>? servicesList}) {
    return ServiceCatalougeState(
      responseStatus: responseStatus ?? this.responseStatus,
      servicesList: servicesList ?? this.servicesList,
    );
  }
}
