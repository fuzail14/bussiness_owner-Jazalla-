import 'package:animate_do/animate_do.dart';
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
import '../../../Constants/Person/person_controller.dart';
import '../../MarketPlace/Widget/market_place_screen_card.dart';
import '../Widget/employee_center_custom_card.dart';

class EmployeeCenterPage extends ConsumerWidget {
  const EmployeeCenterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.read(personProvider);

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: MyAppBar(
          title: 'Employee Center',
        ),
        //backgroundColor: Colors.red,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20).r,
              child: Text("Employee Center",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            Container(
              //height: 490.h,
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ).r,
              padding: const EdgeInsets.only(top: 20, left: 20, bottom: 50).r,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8).r,
                  color: Color(0xffE1E3E6).withOpacity(0.3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  14.ph,
                  FadeInUp(
                    duration: const Duration(
                        milliseconds: 500), // You can adjust the duration
                    delay: Duration(milliseconds: 100),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardEmployeeCenter(
                          textColor: Color(0xffFF6D17),
                          svgPath:
                              'assets/images/employee_center_card_icon.svg',
                          headingText: 'Attendance',
                          onTap: () {
                            // Get.toNamed(bussinesCommunitiesScreen,
                            //     arguments: controller.arguments);
                            // context.goNamed(bussinesCommunitiesScreen, extra: person);
                            // GoRouter.of(context).pushNamed(
                            //     bussinesCommunitiesScreen,
                            //     extra: person);
                          },
                        ),
                        16.pw,
                        CardEmployeeCenter(
                          textColor: Color(0xffFCAB10),
                          svgPath:
                              'assets/images/employee_center_card_icon2.svg',
                          headingText: 'Leave Request',
                          onTap: () {
                            // GoRouter.of(context)
                            //     .pushNamed(onlineStoreScreen, extra: person);
                          },
                        ),
                      ],
                    ),
                  ),
                  20.ph,
                  FadeInUp(
                    duration: Duration(
                        milliseconds: 500), // You can adjust the duration
                    delay: Duration(milliseconds: 100),
                    child: Row(
                      children: [
                        CardEmployeeCenter(
                          textColor: Color(0xffFCAB10),
                          svgPath:
                              'assets/images/employee_center_card_icon3.svg',
                          headingText: 'Salary Slip',
                          onTap: () {
                            // GoRouter.of(context)
                            //     .pushNamed(bussinesForSale, extra: person);
                          },
                        ),
                        16.pw,
                        CardEmployeeCenter(
                          textColor: Color(0xff188F71),
                          svgPath:
                              'assets/images/employee_center_card_icon4.svg',
                          headingText: 'General Information',
                          onTap: () {
                            // GoRouter.of(context)
                            //     .pushNamed(tendersView, extra: person);
                          },
                        ),
                      ],
                    ),
                  ),
                  20.ph,
                  FadeInUp(
                    duration: Duration(
                        milliseconds: 500), // You can adjust the duration
                    delay: Duration(milliseconds: 100),
                    child: Row(
                      children: [
                        CardEmployeeCenter(
                          textColor: Color(0xffFCAB10),
                          svgPath:
                              'assets/images/employee_center_card_icon5.svg',
                          headingText: 'Settings',
                          onTap: () {},
                        ),
                        16.pw,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
