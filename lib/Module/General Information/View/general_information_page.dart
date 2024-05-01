import 'dart:ui';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/Font/fonts.dart';
import '../../../Constants/Person/person_controller.dart';
import '../Notifier/general_information_notifier.dart';
import '../Widget/general_information_custom_card.dart';

class GeneralInformationPage extends ConsumerWidget {
  const GeneralInformationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.read(personProvider);
    final notifier = ref.read(generalInformationProvider.notifier);

    final state = ref.read(generalInformationProvider);

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: MyAppBar(
          title: 'Employee Center',
          showBackButton: true,
        ),
        //backgroundColor: Colors.red,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              25.ph,
              Text('General Information',
                  style: FontManagment()
                      .montserrat18HeadingEmployeeCenterAllModules),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context)
                      .pushNamed(companyPolicyScreen, extra: person);
                },
                upperIconsvgPath:
                    'assets/images/general_info_card_upper_icon.svg',
                centerIconsvgPath:
                    'assets/images/general_info_company_policy.png',
                headingText: 'Company Policy',
                subHeadingText:
                    'Discover valuable insights into your organizations practices by exploring the Company Policy section.',
                lowerIconsvgPath:
                    'assets/images/general_info_card_lower_icon.svg',
              ),
              30.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(eventScreen, extra: person);
                },
                upperIconsvgPath:
                    'assets/images/general_info_card_upper_icon.svg',
                centerIconsvgPath: 'assets/images/general_info_event.png',
                headingText: 'Events',
                subHeadingText:
                    'Gain valuable insights and stay consistently informed about upcoming events within your company.',
                lowerIconsvgPath:
                    'assets/images/general_info_card_lower_icon.svg',
              ),
              30.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(holidaysScreen, extra: person);
                },
                upperIconsvgPath:
                    'assets/images/general_info_card_upper_icon.svg',
                centerIconsvgPath: 'assets/images/general_info_holiday.png',
                headingText: 'Holidays',
                subHeadingText:
                    'Stay informed about your companys upcoming holidays and planned for time-off .',
                lowerIconsvgPath:
                    'assets/images/general_info_card_lower_icon.svg',
              ),
              40.ph,
            ],
          ),
        ));
  }
}
