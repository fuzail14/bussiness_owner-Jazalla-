import 'dart:ui';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../Controller/menu_controller.dart';
import 'dart:math' as math;

class Menu extends ConsumerWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItems = ref.watch(menuControllerProvider).menuItems;
    final person = ref.read(personProvider);
    return Scaffold(
      appBar: MyAppBar(
        title: 'Menu',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.ph,
          Padding(
            padding: const EdgeInsets.only(left: 20.0).r,
            child: Text(
              'Menu',
              style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xff000000),
              ),
            ),
          ),
          10.ph,
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return _buildExpansionTile(context, ref, item, index, person);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile(
      BuildContext context, WidgetRef ref, MenuItem item, int index, person) {
    final int? expandedIndex = ref.watch(expandedStateProvider);
    bool isExpanded = expandedIndex == index;
    Color iconColor = isExpanded
        ? Colors.white
        : Color(0xff1A1A1A); // Color based on expansion

    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20).r,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],

        //borderRadius: BorderRadius.circular(12),
        gradient: isExpanded
            ? const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff1F3996), Color(0xff4EBBD3)],
              )
            : null, // No gradient when not expanded
      ),
      child: CustomExpansionTile(
        title: item.title,
        iconPath: item.iconPath,
        iconColor: iconColor,
        isExpanded: isExpanded,
        onTap: () {
          ref.read(expandedStateProvider.notifier).toggle(index);
          if (item.title == 'Logout') {
            MySharedPreferences.deleteUserData();
            context.pushReplacementNamed(checkPhoneNumber);
          } else if (item.title == 'Order Placement') {
            context.pushNamed(orderPlacementScreen, extra: person);
            // context.pushNamed(procuremenetRFQScreen, extra: person);
          }
        }, // Pass the dynamic color
        children: _buildChildrenForItem(context, item, person),
      ),
    );
  }

  List<Widget> _buildChildrenForItem(
      BuildContext context, MenuItem item, person) {
    // Decide which children to build based on the item title or any other attribute
    List<Widget> children = [];
    // if (item.title == 'Order Placement') {
    //   children.addAll([
    //     // _buildListItem(context, 'RFI / SOI Management', () {
    //     //   context.pushNamed(procuremenetSoiScreen, extra: person);
    //     // }),
    //     _buildListItem(context, 'RFQ Management', () {
    //       context.pushNamed(procuremenetRFQScreen, extra: person);
    //     }),
    //     _buildListItem(context, 'RFP Management', () {
    //       context.pushNamed(procurementRFPScreen, extra: person);
    //     }),
    //   ]);
    // }
    // else if (item.title == 'Sales Management') {
    //   children.addAll([
    //     _buildListItem(context, 'RFI Management', () {
    //       context.pushNamed(salesManagmentRFIScreen, extra: person);
    //     }),
    //     _buildListItem(context, 'RFQ Management', () {
    //       context.pushNamed(salesManagmentRFQScreen, extra: person);
    //     }),
    //   ]);
    // }
    // else if (item.title == 'Services Management') {
    //   children.addAll([
    //     _buildListItem(context, 'RFI Management', () {
    //       context.pushNamed(serviceManagmentRFIScreen, extra: person);
    //     }),
    //     _buildListItem(context, 'RFP Management', () {
    //       context.pushNamed(serviceManagmentRFPScreen, extra: person);
    //     }),
    //   ]);
    // }

    return children;
  }

  Widget _buildListItem(
      BuildContext context, String title, VoidCallback onTap) {
    return Container(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 3).r,
      color: whiteColor,
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xff1A1A1A),
              ),
            ),
            onTap: onTap,
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final String iconPath; // Path to the SVG asset
  final List<Widget> children;
  final bool isExpanded;
  final VoidCallback? onTap;
  final Color? iconColor; // Optional color for the icon

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.children,
    this.isExpanded = false,
    this.onTap,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dynamic text color based on expansion state
    Color textColor = isExpanded ? Colors.white : Color(0xff1A1A1A);

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Leading icon with conditional color
                SvgPicture.asset(iconPath,
                    color: iconColor ?? Color(0xff203C98)),
                20.pw,
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(color: textColor), // Dynamic color
                  ),
                ),
                Icon(isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: textColor),
              ],
            ),
          ),
          if (isExpanded) ...children,
        ],
      ),
    );
  }
}
