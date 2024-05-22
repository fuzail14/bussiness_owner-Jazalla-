import '../../../Data/Api Resp/api_response.dart';
import '../../BussinesForSale/Detail/Model/SaleBussinesDetail.dart';

class ProfileState {
  final Status responseStatus;
  final List<Business> profileDetail;
  final bool isHidden;

  ProfileState(
      {this.responseStatus = Status.loading,
      this.profileDetail = const [],
      this.isHidden = true});

  ProfileState copyWith(
      {Status? responseStatus, List<Business>? profileDetail, bool? isHidden}) {
    return ProfileState(
        responseStatus: responseStatus ?? this.responseStatus,
        profileDetail: profileDetail ?? this.profileDetail,
        isHidden: isHidden ?? this.isHidden);
  }
}
