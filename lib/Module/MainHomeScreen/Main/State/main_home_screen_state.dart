import '../../../../Data/Api Resp/api_response.dart';

class MainHomeScreenState {
  int currentPage;
  final bool isLoading;
  String? companytime;
  final Status responseStatus;

  MainHomeScreenState({
    this.currentPage = 0,
    this.isLoading = false,
    this.companytime,
    this.responseStatus = Status.loading,
  });

  MainHomeScreenState copyWith(
      {int? currentPage,
      bool? isLoading,
      String? companytime,
      Status? responseStatus}) {
    return MainHomeScreenState(
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
      companytime: companytime ?? this.companytime,
      responseStatus: responseStatus ?? this.responseStatus,
    );
  }
}
