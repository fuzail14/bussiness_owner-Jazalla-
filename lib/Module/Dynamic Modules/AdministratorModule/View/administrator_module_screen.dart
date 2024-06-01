import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../Widgets/CustomGlassCardScreen/custom_glass_card_screen.dart';
import '../../../MarketPlace/Widget/market_place_screen_card.dart';

class AdministratorModuleScreen extends StatelessWidget {
  const AdministratorModuleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGlassCardScreen(
        mainTitle: 'Administrator',
        children: [
          CardMakretPlace(
            svgPath: 'assets/images/administrator_module_icon1.svg',
            headingText: 'Procurement Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(procurementManagerModuleScreen);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/administrator_module_icon2.svg',
            headingText: 'Sales Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // Get.toNamed(bussinesCommunitiesScreen,
              //     arguments: controller.arguments);
              // context.goNamed(bussinesCommunitiesScreen, extra: person);
              GoRouter.of(context).pushNamed(
                salesManagerModuleScreen,
                //extra: person
              );
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/administrator_module_icon3.svg',
            headingText: 'Services Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(serviceManagerModuleScreen);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/administrator_module_icon4.svg',
            headingText: 'HR Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(
                hrManagerModuleScreen,
              );
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/administrator_module_icon5.svg',
            headingText: 'Accounting Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(
                accountingManagerModuleScreen,
              );
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/administrator_module_icon6.svg',
            headingText: 'Project Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(
                projectManagerModuleScreen,
              );
            },
          ),
        ],
      ),
    );
  }
}
