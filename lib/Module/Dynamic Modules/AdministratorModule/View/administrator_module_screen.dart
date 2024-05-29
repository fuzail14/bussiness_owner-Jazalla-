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

class AdministratorModuleScreen extends ConsumerWidget {
  const AdministratorModuleScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.read(personProvider);

    print('marketplace');
    print(person!.data!.lastName!);
    print(person.data!.mobileNo!);

    return CustomGlassCardScreen(
      mainTitle: 'Administrator',
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
            GoRouter.of(context)
                .pushNamed(serviceManagerModuleScreen, extra: person);
          },
        ),
        15.ph,
        CardMakretPlace(
          svgPath: 'assets/images/administrator_module_icon4.svg',
          headingText: 'HR Management',
          subHeadingText:
              'It serves as a comprehensive directory, showcasing company profiles.mon',
          onTap: () {
            GoRouter.of(context)
                .pushNamed(hrManagerModuleScreen, extra: person);
          },
        ),
        15.ph,
        CardMakretPlace(
          svgPath: 'assets/images/administrator_module_icon5.svg',
          headingText: 'Accounting Management',
          subHeadingText:
              'It serves as a comprehensive directory, showcasing company profiles.mon',
          onTap: () {
            GoRouter.of(context)
                .pushNamed(accountingManagerModuleScreen, extra: person);
          },
        ),
        15.ph,
        CardMakretPlace(
          svgPath: 'assets/images/administrator_module_icon6.svg',
          headingText: 'Project Management',
          subHeadingText:
              'It serves as a comprehensive directory, showcasing company profiles.mon',
          onTap: () {
            GoRouter.of(context)
                .pushNamed(projectManagerModuleScreen, extra: person);
          },
        ),
      ],
    );
  }
}
