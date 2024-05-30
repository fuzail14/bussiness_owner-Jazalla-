import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../../Widgets/CustomGlassCardScreen/custom_glass_card_screen.dart';
import '../../../MarketPlace/Widget/market_place_screen_card.dart';

class AccountingManagerModuleScreen extends StatelessWidget {
  const AccountingManagerModuleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGlassCardScreen(
        showBackButton: true,
        mainTitle: 'Accounting Management',
        children: [
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon5.svg',
            headingText: 'Invoice Payable',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context)
              //     .pushNamed(tendersView, extra: person);
            },
          ),
          30.ph,
          CardMakretPlace(
            svgPath: 'assets/images/accounting_manager_module_icon3.svg',
            headingText: 'Invoice Receivable',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context).pushNamed(
              //   bussinesCommunitiesScreen,
              //   //extra: person
              // );
            },
          ),
          30.ph,
          CardMakretPlace(
            svgPath: 'assets/images/accounting_manager_module_icon2.svg',
            headingText: 'Expresses',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context).pushNamed(onlineStoreScreen, extra: person);
            },
          ),
          30.ph,
          CardMakretPlace(
            svgPath: 'assets/images/accounting_manager_module_icon4.svg',
            headingText: 'Reports',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              //GoRouter.of(context).pushNamed(generalServiceView, extra: person);
            },
          ),
        ],
      ),
    );
  }
}
