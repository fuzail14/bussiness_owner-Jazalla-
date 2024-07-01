import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Constants/Font/fonts.dart';
import '../Widget/spend_analytic_custom_card.dart';

class SpendAnalyticsProcurementPage extends StatelessWidget {
  const SpendAnalyticsProcurementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: MyAppBar(
          title: 'Spend Analytics',
          showBackButton: true,
          bellOnTap: () {
            GoRouter.of(context).pushNamed(notificationsScreen);
          },
        ),
        //backgroundColor: Colors.red,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              25.ph,
              Text('Spend Analytics',
                  style: FontManagment()
                      .montserrat18HeadingEmployeeCenterAllModules),
              20.ph,
              Row(
                children: [
                  CardSpendAnalytic(
                    onTap: () {
                      GoRouter.of(context).pushNamed(
                        employeeInformationView,
                      );
                    },
                    iconPath: 'assets/images/spend_analytic_icon1.png',
                    headingText: 'Total Sales',
                    subHeadingText: '1234',
                    fotterIconPath: 'assets/images/triangle_up.png',
                    fotterText: '%10',
                    fotterTextColor: const Color(0xff2AC670),
                  ),
                  CardSpendAnalytic(
                    onTap: () {
                      GoRouter.of(context).pushNamed(
                        awardView,
                      );
                    },
                    iconPath: 'assets/images/spend_analytic_icon2.png',
                    headingText: 'Total Supplier',
                    subHeadingText: '1234',
                    fotterIconPath: 'assets/images/triangle_down.png',
                    fotterText: '%10',
                    fotterTextColor: const Color(0xffFF6252),
                  ),
                ],
              ),
              20.ph,
              Row(
                children: [
                  CardSpendAnalytic(
                    onTap: () {
                      GoRouter.of(context).pushNamed(
                        employeeInformationView,
                      );
                    },
                    iconPath: 'assets/images/spend_analytic_icon3.png',
                    headingText: 'Total Purchase Order',
                    subHeadingText: '1234',
                    fotterIconPath: 'assets/images/triangle_up.png',
                    fotterText: '%10',
                    fotterTextColor: const Color(0xff2AC670),
                  ),
                  CardSpendAnalytic(
                    onTap: () {
                      GoRouter.of(context).pushNamed(
                        awardView,
                      );
                    },
                    iconPath: 'assets/images/spend_analytic_icon4.png',
                    headingText: 'Total Contracts',
                    subHeadingText: '1234',
                    fotterIconPath: 'assets/images/triangle_down.png',
                    fotterText: '%10',
                    fotterTextColor: const Color(0xffFF6252),
                  ),
                ],
              ),
              20.ph,
              Row(
                children: [
                  CardSpendAnalytic(
                    onTap: () {
                      GoRouter.of(context).pushNamed(
                        employeeInformationView,
                      );
                    },
                    iconPath: 'assets/images/spend_analytic_icon5.png',
                    headingText: 'No. of Paid Invoice',
                    subHeadingText: '1234',
                    fotterIconPath: 'assets/images/triangle_up.png',
                    fotterText: '%10',
                    fotterTextColor: const Color(0xff2AC670),
                  ),
                  CardSpendAnalytic(
                    onTap: () {
                      GoRouter.of(context).pushNamed(
                        awardView,
                      );
                    },
                    iconPath: 'assets/images/spend_analytic_icon6.png',
                    headingText: 'Total Local Content',
                    subHeadingText: '1234',
                    fotterIconPath: 'assets/images/triangle_down.png',
                    fotterText: '%10',
                    fotterTextColor: const Color(0xffFF6252),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
