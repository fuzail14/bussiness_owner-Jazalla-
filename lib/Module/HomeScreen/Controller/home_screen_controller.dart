import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:get/get.dart';

final homeScreenProvider =
    StateNotifierProvider<HomeScreenNotifier, HomeScreenState>((ref) {
  return HomeScreenNotifier();
});

class HomeScreenState {
  int currentIndex;

  HomeScreenState({this.currentIndex = 0});

  HomeScreenState copyWith({int? currentIndex}) {
    return HomeScreenState(currentIndex: currentIndex ?? this.currentIndex);
  }
}

class HomeScreenNotifier extends StateNotifier<HomeScreenState> {
  late PageController pageController;

  HomeScreenNotifier() : super(HomeScreenState()) {
    pageController = PageController(initialPage: state.currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose(); // Dispose controller when not needed
    super.dispose();
  }

  // void bottomIndexChanged(int index) {
  //   state = state.copyWith(currentIndex: index);
  //   pageController.animateToPage(index,
  //       duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  // }
  void bottomIndexChanged(int index) {
    if (state.currentIndex != index) {
      // Update the state only if the index changes
      state = state.copyWith(currentIndex: index);
      pageController.animateToPage(index,
          duration: const Duration(microseconds: 3), curve: Curves.easeInOut);
    }
  }

  void pageChanged(int index) {
    state = state.copyWith(currentIndex: index);
  }
}
