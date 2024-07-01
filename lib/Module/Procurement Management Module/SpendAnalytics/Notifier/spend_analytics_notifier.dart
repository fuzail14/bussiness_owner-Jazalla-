import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../State/spend_analytics_state.dart';

class SpendAnalyticsNotifier extends StateNotifier<SpendAnalyticsState> {
  SpendAnalyticsNotifier() : super(SpendAnalyticsState());

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }
}

final spendAnalyticsProvider = StateNotifierProvider.autoDispose<
    SpendAnalyticsNotifier, SpendAnalyticsState>((ref) {
  return SpendAnalyticsNotifier();
});
