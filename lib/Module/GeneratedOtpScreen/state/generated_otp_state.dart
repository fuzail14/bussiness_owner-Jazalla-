import '../../../Data/Api Resp/api_response.dart';

class GeneratedOtpState {
  final Status responseStatus;

  GeneratedOtpState({
    this.responseStatus = Status.loading,
  });

  GeneratedOtpState copyWith({
    Status? responseStatus,
  }) {
    return GeneratedOtpState(
      responseStatus: responseStatus ?? this.responseStatus,
    );
  }
}
