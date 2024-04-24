import '../../../Data/Api Resp/api_response.dart';

class GeneralInformationState {
  final Status responseStatus;

  GeneralInformationState({
    this.responseStatus = Status.loading,
  });

  GeneralInformationState copyWith({
    Status? responseStatus,
  }) {
    return GeneralInformationState(
      responseStatus: responseStatus ?? this.responseStatus,
    );
  }
}
