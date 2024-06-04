import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../Constants/Font/fonts.dart';
import '../Widget/general_information_custom_card.dart';

class GeneralInformationPage extends StatelessWidget {
  const GeneralInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: MyAppBar(
          title: 'Employee Center',
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
              Text('General Information',
                  style: FontManagment()
                      .montserrat18HeadingEmployeeCenterAllModules),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    employeeInformationView,
                  );
                },
                iconPath: 'assets/images/general_info_icon1.png',
                headingText: 'Employee Information',
              ),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    awardView,
                  );
                },
                iconPath: 'assets/images/general_info_icon2.png',
                headingText: 'Award',
              ),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    transferView,
                  );
                },
                iconPath: 'assets/images/general_info_icon3.png',
                headingText: 'Transfer',
              ),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    registrationView,
                  );
                },
                iconPath: 'assets/images/general_info_icon4.png',
                headingText: 'Registration',
              ),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    tripView,
                  );
                },
                iconPath: 'assets/images/general_info_icon5.png',
                headingText: 'Trip',
              ),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    promotionView,
                  );
                },
                iconPath: 'assets/images/general_info_icon6.png',
                headingText: 'Promotion',
              ),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    complaintsView,
                  );
                },
                iconPath: 'assets/images/general_info_icon7.png',
                headingText: 'Complaints',
              ),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    warningView,
                  );
                },
                iconPath: 'assets/images/general_info_icon8.png',
                headingText: 'Warning',
              ),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    terminationView,
                  );
                },
                iconPath: 'assets/images/general_info_icon9.png',
                headingText: 'Termination',
              ),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    announcementView,
                  );
                },
                iconPath: 'assets/images/general_info_icon10.png',
                headingText: 'Announcement',
              ),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    holidaysScreen,
                  );
                },
                iconPath: 'assets/images/general_info_icon11.png',
                headingText: 'Holidays',
              ),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    employeesAssetView,
                  );
                },
                iconPath: 'assets/images/general_info_icon12.png',
                headingText: 'Employee Asset',
              ),
              20.ph,
              CardGeneralInformation(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    companyPolicyScreen,
                  );
                },
                iconPath: 'assets/images/general_info_icon13.png',
                headingText: 'Company Policy',
              ),
              40.ph,
            ],
          ),
        ));
  }
}
