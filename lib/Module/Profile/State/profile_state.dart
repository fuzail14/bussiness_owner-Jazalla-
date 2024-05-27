import 'package:image_picker/image_picker.dart';

import '../../../Data/Api Resp/api_response.dart';
import '../../BussinesForSale/Detail/Model/SaleBussinesDetail.dart';
import '../Model/UserProfile.dart';

class ProfileState {
  final Status responseStatus;
  final List<Profile> profileDetail;
  final bool isHidden;
  final String? avatarPath;
  final bool isLoading;
  final XFile? pickedFile;
  final bool updateButton;

  ProfileState(
      {this.responseStatus = Status.loading,
      this.profileDetail = const [],
      this.isHidden = true,
      this.avatarPath,
      this.isLoading = false,
      this.updateButton = false,
      this.pickedFile});

  ProfileState copyWith(
      {Status? responseStatus,
      List<Profile>? profileDetail,
      bool? isHidden,
      String? avatarPath,
      bool? isLoading,
      bool? updateButton,
      XFile? pickedFile}) {
    return ProfileState(
        responseStatus: responseStatus ?? this.responseStatus,
        profileDetail: profileDetail ?? this.profileDetail,
        isHidden: isHidden ?? this.isHidden,
        avatarPath: avatarPath ?? this.avatarPath,
        isLoading: isLoading ?? this.isLoading,
        updateButton: updateButton ?? this.updateButton,
        pickedFile: pickedFile ?? this.pickedFile);
  }
}
