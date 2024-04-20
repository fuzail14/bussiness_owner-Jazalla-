import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:get/get.dart';

final mainHomeScreenProvider =
    StateNotifierProvider<MainHomeScreenNotifier, MainHomeScreenState>((ref) {
  return MainHomeScreenNotifier();
});

class MainHomeScreenState {
  int currentPage;

  MainHomeScreenState({this.currentPage = 0});

  MainHomeScreenState copyWith({int? currentPage}) {
    return MainHomeScreenState(currentPage: currentPage ?? this.currentPage);
  }
}

class MainHomeScreenNotifier extends StateNotifier<MainHomeScreenState> {
  late PageController pageController;

  MainHomeScreenNotifier() : super(MainHomeScreenState()) {
    pageController = PageController(initialPage: 0, viewportFraction: 1.1);

    // Listen to page changes
    pageController.addListener(_updatePageIndex);
  }

  @override
  void dispose() {
    pageController.removeListener(_updatePageIndex); // Clean up listener
    pageController.dispose();
    super.dispose();
  }

  void cardIndexChanged(int index) {
    state = state.copyWith(currentPage: index);
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  void _updatePageIndex() {
    final int currentIndex = pageController.page!.round();
    if (currentIndex != state.currentPage) {
      state = state.copyWith(currentPage: currentIndex);
    }
  }

  List glassCardList = [
    {
      'title': 'Attendees',
      'widget_icon1': 'assets/images/check_in_icon.svg',
      'widget_title1': 'Check In',
      'widget_icon2': 'assets/images/check_out_icon.svg',
      'widget_title2': 'Check Out',
    },
    {
      'title': 'Leave Management',
      'widget_icon1': 'assets/images/vacation_balance_icon.svg',
      'widget_title1': 'Vacation Balance',
      'widget_icon2': 'assets/images/leave_request_icon.svg',
      'widget_title2': 'Leave Request',
    },
    {
      'title': 'General Information',
      'widget_icon1': 'assets/images/profile_icon.svg',
      'widget_title1': 'Profile',
      'widget_icon2': 'assets/images/company_icon.svg',
      'widget_title2': 'Company',
    }
  ];
}
