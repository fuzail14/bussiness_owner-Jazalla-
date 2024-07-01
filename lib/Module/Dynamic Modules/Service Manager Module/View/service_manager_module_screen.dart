import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/CustomGlassCardScreen/custom_glass_card_screen.dart';
import '../../../MarketPlace/Widget/market_place_screen_card.dart';
import 'package:go_router/go_router.dart';

class ServiceManagerModuleScreen extends StatelessWidget {
  const ServiceManagerModuleScreen({super.key});
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: CustomGlassCardScreen(
        showBackButton: true,
        heightofGlass: 600,
        mainTitle: 'Service Management',
        children: [
          CardMakretPlace(
            svgPath: 'assets/images/sales_n_service_module_icon1.svg',
            headingText: 'Client Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context)
                  .pushNamed(clientManagementServiceMainTabPage);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/service_n_sale_module_icon2.svg',
            headingText: 'Services Catalogue',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(
                serviceCatalougeView,
              );
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon2.svg',
            headingText: 'Bid Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(bidManagementServiceView);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon3.svg',
            headingText: 'Proposal Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(orderPlacementScreen);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon4.svg',
            headingText: 'Contract Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(contractManagementServiceView);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon5.svg',
            headingText: 'Invoice Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(invoiceManagementServiceView);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/service_n_sale_module_icon7.svg',
            headingText: 'Work Order',
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
