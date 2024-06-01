import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../../Widgets/CustomGlassCardScreen/custom_glass_card_screen.dart';
import '../../../MarketPlace/Widget/market_place_screen_card.dart';

class HrManagerModuleScreen extends StatelessWidget {
  const HrManagerModuleScreen({super.key});
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: CustomGlassCardScreen(
        showBackButton: true,
        heightofGlass: 600,
        mainTitle: 'HR Management',
        children: [
          CardMakretPlace(
            svgPath: 'assets/images/hr_manager_module_icon7.svg',
            headingText: 'Employee Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context)
              //     .pushNamed(tendersView, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/hr_manager_module_icon5.svg',
            headingText: 'Payroll Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // Get.toNamed(bussinesCommunitiesScreen,
              //     arguments: controller.arguments);
              // context.goNamed(bussinesCommunitiesScreen, extra: person);
              // GoRouter.of(context).pushNamed(
              //   bussinesCommunitiesScreen,
              //   //extra: person
              // );
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/hr_manager_module_icon8.svg',
            headingText: 'Leave & Attendance',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              //GoRouter.of(context).pushNamed(onlineStoreScreen, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/hr_manager_module_icon4.svg',
            headingText: 'Performance Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context).pushNamed(generalServiceView, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/hr_manager_module_icon2.svg',
            headingText: 'Training Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context).pushNamed(bussinesForSale, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/hr_manager_module_icon6.svg',
            headingText: 'Event & Meeting',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context)
              //     .pushNamed(investMentOpportunityView, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/hr_manager_module_icon3.svg',
            headingText: 'HR Administration',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context)
              //     .pushNamed(investMentOpportunityView, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/hr_manager_module_icon1.svg',
            headingText: 'HR System Setting',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context)
              //     .pushNamed(investMentOpportunityView, extra: person);
            },
          ),
        ],
      ),
    );
  }
}
