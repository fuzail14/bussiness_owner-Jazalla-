import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MenuItem {
  // final String title;
  // final SvgPicture icon;
  // final SvgPicture trailingIcon;

  final String title;
  final String iconPath; // Changed from SvgPicture to String
  final SvgPicture trailingIcon;
  Color iconColor;
  //final VoidCallback onTap;

  MenuItem({
    // required this.title,
    // required this.icon,
    // required this.trailingIcon,
    // // required this.onTap,
    required this.title,
    required this.iconPath, // Now expects a path to the SVG
    required this.trailingIcon,
    this.iconColor = Colors.black,
  });
}

class MenuState {
  final List<MenuItem> menuItems;

  MenuState({required this.menuItems});
}

class MenuController extends StateNotifier<MenuState> {
  MenuController() : super(MenuState(menuItems: [])) {
    loadMenuItems();
  }

  void loadMenuItems() {
    state = MenuState(menuItems: [
      MenuItem(
        title: 'Dashboard',
        iconPath: 'assets/images/menu1.svg',
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
      ),
      MenuItem(
        title: 'Marketplace',
        iconPath: 'assets/images/menu2.svg',
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        //onTap: () {},
      ),
      MenuItem(
        title: 'Procurement Management',
        iconPath: 'assets/images/menu3.svg',
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        //onTap: () {},
      ),
      MenuItem(
        title: 'Sales Management',
        iconPath: 'assets/images/menu4.svg',
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
      MenuItem(
        title: 'Services Management',
        iconPath: 'assets/images/menu5.svg',
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        //onTap: () {},
      ),
      MenuItem(
        title: 'Order Placement',
        iconPath: 'assets/images/menu6.svg',
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        //onTap: () {},
      ),
      MenuItem(
        title: 'Invoice and Billing',
        iconPath: 'assets/images/menu7.svg',
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
      MenuItem(
        title: 'User Management',
        iconPath: 'assets/images/menu8.svg',
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
      MenuItem(
        title: 'Approvals and Workflows',
        iconPath: 'assets/images/menu7.svg',
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
      MenuItem(
        title: 'Settings',
        iconPath: 'assets/images/menu11.svg',
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
      MenuItem(
        title: 'Logout',
        iconPath: 'assets/images/menu10.svg',
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
    ]);
  }
}

final menuControllerProvider =
    StateNotifierProvider.autoDispose<MenuController, MenuState>((ref) {
  return MenuController();
});

// final expandedStateProvider =
//     StateNotifierProvider<ExpandedStateNotifier, List<bool>>((ref) {
//   // Assuming you have a fixed number of menu items; adjust accordingly
//   int menuItemsCount = ref.watch(menuControllerProvider).menuItems.length;
//   return ExpandedStateNotifier(List.filled(menuItemsCount, false));
// });

// class ExpandedStateNotifier extends StateNotifier<List<bool>> {
//   ExpandedStateNotifier(List<bool> state) : super(state);

//   void toggle(int index) {
//     state = [
//       for (int i = 0; i < state.length; i++) i == index ? !state[i] : state[i],
//     ];
//   }
// }

final expandedStateProvider =
    StateNotifierProvider.autoDispose<ExpandedStateNotifier, int?>((ref) {
  return ExpandedStateNotifier();
});

class ExpandedStateNotifier extends StateNotifier<int?> {
  ExpandedStateNotifier() : super(null); // Initially, no tile is expanded.

  void toggle(int index) {
    // If the current state equals the index, collapse it by setting to null.
    // Otherwise, expand the new index.
    state = state == index ? null : index;
  }
}
