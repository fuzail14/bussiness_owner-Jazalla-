import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MenuItem {
  final String title;
  final SvgPicture icon;
  final SvgPicture trailingIcon;

  //final VoidCallback onTap;

  MenuItem({
    required this.title,
    required this.icon,
    required this.trailingIcon,
    // required this.onTap,
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
        icon: SvgPicture.asset('assets/images/menu1.svg'),
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
      MenuItem(
        title: 'Marketplace',
        icon: SvgPicture.asset('assets/images/menu2.svg'),
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        //onTap: () {},
      ),
      MenuItem(
        title: 'Procurement Management',
        icon: SvgPicture.asset('assets/images/menu3.svg'),
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        //onTap: () {},
      ),
      MenuItem(
        title: 'Sales Management',
        icon: SvgPicture.asset('assets/images/menu4.svg'),
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
      MenuItem(
        title: 'Services Management',
        icon: SvgPicture.asset('assets/images/menu5.svg'),
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        //onTap: () {},
      ),
      MenuItem(
        title: 'Order Placement',
        icon: SvgPicture.asset('assets/images/menu6.svg'),
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        //onTap: () {},
      ),
      MenuItem(
        title: 'Invoice and Billing',
        icon: SvgPicture.asset('assets/images/menu7.svg'),
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
      MenuItem(
        title: 'User Management',
        icon: SvgPicture.asset('assets/images/menu8.svg'),
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
      MenuItem(
        title: 'Approvals and Workflows',
        icon: SvgPicture.asset('assets/images/menu7.svg'),
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
      MenuItem(
        title: 'Settings',
        icon: SvgPicture.asset('assets/images/menu11.svg'),
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
      MenuItem(
        title: 'Logout',
        icon: SvgPicture.asset('assets/images/menu10.svg'),
        trailingIcon: SvgPicture.asset('assets/images/forward_arrow.svg'),
        // onTap: () {},
      ),
    ]);
  }
}

final menuControllerProvider =
    StateNotifierProvider<MenuController, MenuState>((ref) {
  return MenuController();
});
