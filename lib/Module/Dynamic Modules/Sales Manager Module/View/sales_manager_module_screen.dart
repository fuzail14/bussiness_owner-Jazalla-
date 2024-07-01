import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../Widgets/CustomGlassCardScreen/custom_glass_card_screen.dart';
import '../../../MarketPlace/Widget/market_place_screen_card.dart';

class SalesManagerModuleScreen extends StatelessWidget {
  const SalesManagerModuleScreen({super.key});
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: CustomGlassCardScreen(
        showBackButton: true,
        heightofGlass: 600,
        mainTitle: 'Sales Management',
        children: [
          CardMakretPlace(
            svgPath: 'assets/images/sales_n_service_module_icon1.svg',
            headingText: 'Client Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(supplierManagementTabPage);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/sales_n_service_module_icon2.svg',
            headingText: 'Products Catalogue',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(productCatalougeSalesScreen);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon2.svg',
            headingText: 'Bid Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(bidManagementSalesView);
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
            headingText: 'Order Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(orderManagementSalesView);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon5.svg',
            headingText: 'Invoice Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(invoiceManagementSalesView);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/sales_n_service_module_icon7.svg',
            headingText: 'Inventory Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(inventoryManagementSalesView);
            },
          ),
        ],
      ),
    );
  }
}
