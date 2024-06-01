import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../../Widgets/CustomGlassCardScreen/custom_glass_card_screen.dart';
import '../../../MarketPlace/Widget/market_place_screen_card.dart';

class ProcurementManagerModuleScreen extends StatelessWidget {
  const ProcurementManagerModuleScreen({super.key});
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: CustomGlassCardScreen(
        showBackButton: true,
        heightofGlass: 600,
        mainTitle: 'Procurement Management',
        children: [
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon1.svg',
            headingText: 'Vendor Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context)
              //     .pushNamed(tendersView, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon2.svg',
            headingText: 'Bid Management',
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
            svgPath: 'assets/images/procurement_module_icon3.svg',
            headingText: 'Proposal Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              //GoRouter.of(context).pushNamed(onlineStoreScreen, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon4.svg',
            headingText: 'Order Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context).pushNamed(generalServiceView, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon5.svg',
            headingText: 'Contract Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context).pushNamed(bussinesForSale, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon5.svg',
            headingText: 'Invoice Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context)
              //     .pushNamed(investMentOpportunityView, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon6.svg',
            headingText: 'Inventory Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context)
              //     .pushNamed(investMentOpportunityView, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon7.svg',
            headingText: 'Spend Analytics',
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
