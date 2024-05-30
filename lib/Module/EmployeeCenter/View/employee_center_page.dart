import 'dart:ui';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../Widgets/CustomGlassCardScreen/custom_glass_card_screen.dart';
import '../../MarketPlace/Widget/market_place_screen_card.dart';

class EmployeeCenterPage extends StatelessWidget {
  const EmployeeCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        body: CustomGlassCardScreen(
          mainTitle: 'Employee Center',
          titleofGlass: 'Employee Management',
          children: [
            CardMakretPlace(
              onTap: () {
                GoRouter.of(context).pushNamed(attendanceManagmentScreen);
              },
              svgPath: 'assets/images/employee_center_card_icon.svg',
              headingText: 'Attendance Management',
              subHeadingText:
                  'It serves as a comprehensive directory, showcasing company profiles.mon',
              // svgColor:
              //     const Color(0xff00888D).withOpacity(0.8),
            ),
            15.ph,
            CardMakretPlace(
              svgPath: 'assets/images/employee_center_card_icon2.svg',
              // svgColor:
              //     const Color(0xff00888D).withOpacity(0.8),
              headingText: 'Leave Management',
              subHeadingText:
                  'It serves as a comprehensive directory, showcasing company profiles.mon',
              onTap: () {
                GoRouter.of(context).pushNamed(
                  leaveManagmentScreen,
                );
                // GoRouter.of(context)
                //     .pushNamed(onlineStoreScreen, extra: person);
              },
            ),
            15.ph,
            CardMakretPlace(
              svgPath: 'assets/images/employee_center_card_icon3.svg',
              headingText: 'Salary Payslip',
              subHeadingText:
                  'It serves as a comprehensive directory, showcasing company profiles.mon',
              onTap: () {
                GoRouter.of(context).pushNamed(
                  salaryPaySlipScreen,
                );
              },
            ),
            15.ph,
            CardMakretPlace(
              svgPath: 'assets/images/employee_center_card_icon5.svg',
              // svgColor:
              //     const Color(0xff00888D).withOpacity(0.8),
              headingText: 'Appraisal',
              subHeadingText:
                  'It serves as a comprehensive directory, showcasing company profiles.mon',
              onTap: () {
                GoRouter.of(context).pushNamed(
                  apprisalScreen,
                );
              },
            ),
            15.ph,
            CardMakretPlace(
              svgPath: 'assets/images/employee_center_card_icon5.svg',
              headingText: 'General Information',
              subHeadingText:
                  'It serves as a comprehensive directory, showcasing company profiles.mon',
              onTap: () {
                GoRouter.of(context).pushNamed(
                  generalInformationPage,
                );
              },
            ),
          ],
        ));
  }
}
