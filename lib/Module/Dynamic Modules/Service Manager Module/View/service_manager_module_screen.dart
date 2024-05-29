import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Widgets/CustomGlassCardScreen/custom_glass_card_screen.dart';
import '../../../MarketPlace/Widget/market_place_screen_card.dart';

class ServiceManagerModuleScreen extends ConsumerWidget {
  const ServiceManagerModuleScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.read(personProvider);

    print('marketplace');
    print(person!.data!.lastName!);
    print(person.data!.mobileNo!);

    return Scaffold(
      body: CustomGlassCardScreen(
        showBackButton: true,
        mainTitle: 'Service Management',
        children: [
          Center(
            child: Text(
              'All in One Solution',
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffFFFFFF).withOpacity(0.5)),
            ),
          ),
          13.ph,
          Divider(color: const Color(0xffFFFFFF).withOpacity(0.5)),
          15.ph,
          Text(
            'Jazalla',
            style: FontManagment().poppins16WithColor(
                color: const Color(0xffFFFFFF), fontWeight: FontWeight.bold),
          ),
          20.ph,
          CardMakretPlace(
            svgPath: 'assets/images/sales_n_service_module_icon1.svg',
            headingText: 'Client Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // GoRouter.of(context)
              //     .pushNamed(tendersView, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/service_n_sale_module_icon2.svg',
            headingText: 'Services Catalogue',
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
            svgPath: 'assets/images/procurement_module_icon2.svg',
            headingText: 'Bid Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              //GoRouter.of(context).pushNamed(onlineStoreScreen, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon3.svg',
            headingText: 'Proposal Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              //GoRouter.of(context).pushNamed(generalServiceView, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/procurement_module_icon4.svg',
            headingText: 'Contract Management',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              //GoRouter.of(context).pushNamed(bussinesForSale, extra: person);
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
