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
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
        ).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu',
              style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff000000)),
            ),
            10.ph,
            Container(
              height: 574.h,
              color: Color(0xffE1E3E6).withOpacity(0.5),
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return ListTile(
                    leading: item.icon,
                    title: Text(
                      item.title,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1A1A1A)),
                    ),
                    trailing: item.trailingIcon,
                    onTap: () {
                      if (item.title == 'Procurement Management') {
                        _showDialog(context, ref, person);
                      } else if (item.title == 'Sales Management') {
                        _salesManagmentshowDialog(context, ref, person);
                      } else if (item.title == 'Services Management') {
                        _serviceManagmentshowDialog(context, ref, person);
                      } else if (item.title == 'Logout') {
                        MySharedPreferences.deleteUserData();
                        context.pushReplacementNamed(checkPhoneNumber);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, WidgetRef ref, person) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Procurement Management',
                  style: GoogleFonts.quicksand(
                      fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20.0),
                _dialogButton(
                  context: context,
                  title: 'RFI / SOI Management',
                  onTap: () {
                    Navigator.of(context).pop();
                    context.pushNamed(procuremenetSoiScreen, extra: person);
                  },
                ),
                _dialogButton(
                  context: context,
                  title: 'RFQ Management',
                  onTap: () {
                    Navigator.of(context).pop();
                    context.pushNamed(procuremenetRFQScreen, extra: person);
                  },
                ),
                _dialogButton(
                  context: context,
                  title: 'RFP Management',
                  onTap: () {
                    Navigator.of(context).pop();
                    context.pushNamed(procurementRFPScreen, extra: person);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _salesManagmentshowDialog(BuildContext context, WidgetRef ref, person) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sales Management',
                  style: GoogleFonts.quicksand(
                      fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20.0),
                _dialogButton(
                  context: context,
                  title: 'RFI / SOI Management',
                  onTap: () {
                    Navigator.of(context).pop();
                    context.pushNamed(salesManagmentRFIScreen, extra: person);
                  },
                ),
                _dialogButton(
                  context: context,
                  title: 'RFQ Management',
                  onTap: () {
                    Navigator.of(context).pop();
                    context.pushNamed(salesManagmentRFQScreen, extra: person);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _serviceManagmentshowDialog(
      BuildContext context, WidgetRef ref, person) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Service Management',
                  style: GoogleFonts.quicksand(
                      fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20.0),
                _dialogButton(
                  context: context,
                  title: 'RFI / SOI Management',
                  onTap: () {
                    Navigator.of(context).pop();
                    context.pushNamed(serviceManagmentRFIScreen, extra: person);
                  },
                ),
                _dialogButton(
                  context: context,
                  title: 'RFP Management',
                  onTap: () {
                    Navigator.of(context).pop();
                    context.pushNamed(serviceManagmentRFPScreen, extra: person);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _dialogButton(
      {required BuildContext context,
      required String title,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 20, right: 20).r,
        width: 362.w,
        height: 51.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12).r,
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.quicksand(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff7A7A7A)),
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xff7A7A7A),
            ),
          ],
        ),
      ),
    );
  }
}
