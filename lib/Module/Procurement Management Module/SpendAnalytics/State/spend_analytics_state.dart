import '../../../../Data/Api Resp/api_response.dart';

class SpendAnalyticsState {
  final Status responseStatus;

  SpendAnalyticsState({
    this.responseStatus = Status.loading,
  });

  SpendAnalyticsState copyWith({
    Status? responseStatus,
  }) {
    return SpendAnalyticsState(
      responseStatus: responseStatus ?? this.responseStatus,
    );
  }
}
