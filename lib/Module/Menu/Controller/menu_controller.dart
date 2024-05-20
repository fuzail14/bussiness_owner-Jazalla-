import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';

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
  final Person person;
  MenuController(this.person) : super(MenuState(menuItems: [])) {
    loadMenuItems();
  }

  void loadMenuItems() {
    List<MenuItem> items = [];

    // Common items for all types

    // Add specific items based on the person's type
    if (person.data!.type == 'employee') {
      items.addAll([
        MenuItem(
          title: 'Settings',
          iconPath: 'assets/images/menu11.svg',
          trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        ),
        MenuItem(
          title: 'Logout',
          iconPath: 'assets/images/menu10.svg',
          trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        ),
      ]);
      state = MenuState(menuItems: items);
    } else if (person.data!.type == 'projectManager') {
      // Show 'Order Placement', 'Settings', and 'Logout' for project managers
      items.insert(
          0,
          MenuItem(
            title: 'Order Placement',
            iconPath: 'assets/images/menu3.svg',
            trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
          ));
      state = MenuState(menuItems: items);
    } else if (person.data!.type == 'company') {
      items.addAll([
        MenuItem(
          title: 'Order Placement',
          iconPath: 'assets/images/menu3.svg',
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
      state = MenuState(menuItems: items);
    } else if (person.data!.type == userTypeProcurementManager) {
      items.addAll([
        MenuItem(
          title: 'Order Placement',
          iconPath: 'assets/images/menu3.svg',
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
      state = MenuState(menuItems: items);
    }
  }

  // void loadMenuItems() {

  //   state = MenuState(menuItems: [
  //     // MenuItem(
  //     //   title: 'Dashboard',
  //     //   iconPath: 'assets/images/menu1.svg',
  //     //   trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
  //     // ),
  //     // MenuItem(
  //     //   title: 'Marketplace',
  //     //   iconPath: 'assets/images/menu2.svg',
  //     //   trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
  //     //   //onTap: () {},
  //     // ),
  //     MenuItem(
  //       title: 'Order Placement',
  //       iconPath: 'assets/images/menu3.svg',
  //       trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
  //       //onTap: () {},
  //     ),
  //     // MenuItem(
  //     //   title: 'Sales Management',
  //     //   iconPath: 'assets/images/menu4.svg',
  //     //   trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
  //     //   // onTap: () {},
  //     // ),
  //     // MenuItem(
  //     //   title: 'Services Management',
  //     //   iconPath: 'assets/images/menu5.svg',
  //     //   trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
  //     //   //onTap: () {},
  //     // ),
  //     MenuItem(
  //       title: 'Invoice and Billing',
  //       iconPath: 'assets/images/menu7.svg',
  //       trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
  //       // onTap: () {},
  //     ),
  //     MenuItem(
  //       title: 'User Management',
  //       iconPath: 'assets/images/menu8.svg',
  //       trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
  //       // onTap: () {},
  //     ),
  //     MenuItem(
  //       title: 'Approvals and Workflows',
  //       iconPath: 'assets/images/menu7.svg',
  //       trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
  //       // onTap: () {},
  //     ),
  //     MenuItem(
  //       title: 'Settings',
  //       iconPath: 'assets/images/menu11.svg',
  //       trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
  //       // onTap: () {},
  //     ),
  //     MenuItem(
  //       title: 'Logout',
  //       iconPath: 'assets/images/menu10.svg',
  //       trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
  //       // onTap: () {},
  //     ),
  //   ]);
  // }
}

final menuControllerProvider =
    StateNotifierProvider.autoDispose<MenuController, MenuState>((ref) {
  final person = ref.read(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return MenuController(person);
}, dependencies: [personProvider]);

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
