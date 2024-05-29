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
import '../../MarketPlace/Widget/market_place_screen_card.dart';
import '../Notifier/employee_center_notifier.dart';
import '../Widget/employee_center_custom_card.dart';
import 'package:badges/badges.dart' as badges;

class EmployeeCenterPage extends ConsumerWidget {
  const EmployeeCenterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.read(personProvider);
    final notifier = ref.read(employeeCenterProvider.notifier);

    final state = ref.read(employeeCenterProvider);

    print(person!.data!.id!);
    print('employee id ${person.data!.employee!.id}');
    print('company id ${person.data!.companyId}');

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        // appBar: MyAppBar(
        //   title: 'Employee Center',
        //   showBackButton: false,
        //   bellOnTap: () {
        //     GoRouter.of(context).pushNamed(notificationsScreen);
        //   },
        // ),
        //backgroundColor: Colors.red,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 63, right: 0).r,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff2751A1), Color(0xff4BB3CF)])),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Employee Center',
                          style: FontManagment().poppins18,
                        ),
                      ),
                      Positioned(
                        right: 24,
                        child: InkWell(
                          onTap: () {
                            GoRouter.of(context).pushNamed(notificationsScreen);
                          },
                          child: badges.Badge(
                              badgeContent: Text('3',
                                  style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xffFFFFFF))),
                              position: badges.BadgePosition.topEnd(
                                  top: -10, end: -12),
                              showBadge: true,
                              ignorePointer: false,
                              child: SvgPicture.asset(
                                'assets/images/bellicon.svg',
                              )),
                        ),
                      ),
                    ],
                  ),
                  35.ph,
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)).r,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        width: 327.w,
                        // height: 643,
                        padding: const EdgeInsets.only(
                                left: 17, top: 22, right: 20, bottom: 42)
                            .r,

                        margin: const EdgeInsets.only(
                                left: 24, top: 0, right: 24, bottom: 30)
                            .r,

                        decoration: BoxDecoration(
                            color: const Color(0xffF6F6F6).withOpacity(0.15),
                            border: Border.all(
                                width: 1,
                                color:
                                    const Color(0xffF6F6F6).withOpacity(0.5)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40)).r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Employee Management',
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xffFFFFFF)
                                        .withOpacity(0.5)),
                              ),
                            ),
                            13.ph,
                            Divider(
                                color:
                                    const Color(0xffFFFFFF).withOpacity(0.5)),
                            15.ph,
                            Text(
                              'Jazalla',
                              style: FontManagment().poppins16WithColor(
                                  color: const Color(0xffFFFFFF),
                                  fontWeight: FontWeight.bold),
                            ),
                            20.ph,
                            CardMakretPlace(
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    attendanceManagmentScreen,
                                    extra: person);
                              },
                              svgPath:
                                  'assets/images/employee_center_card_icon.svg',
                              headingText: 'Attendance Management',
                              subHeadingText:
                                  'It serves as a comprehensive directory, showcasing company profiles.mon',
                              // svgColor:
                              //     const Color(0xff00888D).withOpacity(0.8),
                            ),
                            15.ph,
                            CardMakretPlace(
                              svgPath:
                                  'assets/images/employee_center_card_icon2.svg',
                              // svgColor:
                              //     const Color(0xff00888D).withOpacity(0.8),
                              headingText: 'Leave Management',
                              subHeadingText:
                                  'It serves as a comprehensive directory, showcasing company profiles.mon',
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    leaveManagmentScreen,
                                    extra: person);
                                // GoRouter.of(context)
                                //     .pushNamed(onlineStoreScreen, extra: person);
                              },
                            ),
                            15.ph,
                            CardMakretPlace(
                              svgPath:
                                  'assets/images/employee_center_card_icon3.svg',
                              headingText: 'Salary Payslip',
                              subHeadingText:
                                  'It serves as a comprehensive directory, showcasing company profiles.mon',
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    salaryPaySlipScreen,
                                    extra: person);
                              },
                            ),
                            15.ph,
                            CardMakretPlace(
                              svgPath:
                                  'assets/images/employee_center_card_icon5.svg',
                              // svgColor:
                              //     const Color(0xff00888D).withOpacity(0.8),
                              headingText: 'Appraisal',
                              subHeadingText:
                                  'It serves as a comprehensive directory, showcasing company profiles.mon',
                              onTap: () {
                                GoRouter.of(context)
                                    .pushNamed(apprisalScreen, extra: person);
                              },
                            ),
                            15.ph,
                            CardMakretPlace(
                              svgPath:
                                  'assets/images/employee_center_card_icon5.svg',
                              headingText: 'General Information',
                              subHeadingText:
                                  'It serves as a comprehensive directory, showcasing company profiles.mon',
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    generalInformationPage,
                                    extra: person);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));

    // body: Container(
    //   width: width,
    //   // padding: EdgeInsets.only(left: 35, right: 35).r,
    //   margin: const EdgeInsets.only(left: 35, right: 35).r,
    //   // color: Colors.red,

    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       30.ph,
    //       GestureDetector(
    //         onTap: () {
    //           GoRouter.of(context)
    //               .pushNamed(attendanceManagmentScreen, extra: person);
    //         },
    //         child: Container(
    //           width: 345.w,

    //           padding: const EdgeInsets.only(
    //                   left: 0, right: 0, bottom: 38, top: 37)
    //               .r,

    //           // margin: const EdgeInsets.only(
    //           //         left: 35, right: 0, bottom: 0, top: 0)
    //           //     .r,

    //           //margin: EdgeInsets.only(left: 10),

    //           // decoration: BoxDecoration(
    //           //   borderRadius: BorderRadius.circular(16).r,
    //           //   color: whiteColor,
    //           //   boxShadow: [
    //           //     BoxShadow(
    //           //       color: Colors.grey.withOpacity(0.2),
    //           //       spreadRadius: 0,
    //           //       blurRadius: 2,
    //           //       offset: Offset(0, 3), // changes position of shadow
    //           //     ),
    //           //   ],
    //           // ),
    //           decoration: BoxDecoration(
    //             color: whiteColor,
    //             border: Border.all(
    //                 color: const Color(0xff449FC6).withOpacity(0.6)),
    //             borderRadius: BorderRadius.circular(8).r,
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Colors.grey.withOpacity(0.2),
    //                 offset: const Offset(
    //                   1.0,
    //                   3.0,
    //                 ),
    //                 blurRadius: 10.0,
    //                 spreadRadius: 1.0,
    //               ),
    //             ],
    //           ),
    //           child: Column(
    //             children: [
    //               //12.ph,
    //               Container(
    //                 height: 60.22.h,
    //                 width: 60.22.w,
    //                 // decoration: const BoxDecoration(
    //                 //   shape: BoxShape.circle,
    //                 //   // color: Color(0xffF9F9F9),
    //                 //   gradient: LinearGradient(
    //                 //     stops: [0.01, 0.5],
    //                 //     // begin: Alignment.bottomRight,
    //                 //     // end: Alignment.bottomLeft,

    //                 //     begin: Alignment
    //                 //         .bottomCenter, // Begin gradient from top right
    //                 //     end: Alignment.topCenter,
    //                 //     colors: <Color>[
    //                 //       Color(0xff1F3996),
    //                 //       Color(0xffFFFFFF),
    //                 //     ],
    //                 //   ),

    //                 //   //borderRadius: BorderRadius.circular(8.0).r,
    //                 // ),
    //                 decoration: BoxDecoration(
    //                   shape: BoxShape.circle,
    //                   border: Border.all(
    //                     color: const Color(0xff1F3996),
    //                   ),
    //                   // color: Color(0xffF9F9F9),
    //                   // gradient: LinearGradient(
    //                   //   stops: [0.01, 0.5],
    //                   //   // begin: Alignment.bottomRight,
    //                   //   // end: Alignment.bottomLeft,

    //                   //   begin:
    //                   //       Alignment.bottomCenter, // Begin gradient from top right
    //                   //   end: Alignment.topCenter,
    //                   //   colors: <Color>[
    //                   //     Color(0xff1F3996),
    //                   //     Color(0xffFFFFFF),
    //                   //   ],
    //                   // ),

    //                   //borderRadius: BorderRadius.circular(8.0).r,
    //                 ),
    //                 child: SvgPicture.asset(
    //                   'assets/images/employee_center_card_icon.svg',
    //                   fit: BoxFit.none,
    //                 ),
    //               ),
    //               10.ph,
    //               Text(
    //                 'Attendance Management',
    //                 maxLines: 2,
    //                 overflow: TextOverflow.ellipsis,
    //                 textAlign: TextAlign.center,
    //                 style: GoogleFonts.roboto(
    //                     color: const Color(0xff1F3996),
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 14.sp),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       28.ph,
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           // 16.pw,
    //           CardEmployeeCenter(
    //             //margin: const EdgeInsets.only(left: 31).r,
    //             textColor: const Color(0xffFCAB10),
    //             svgPath: 'assets/images/employee_center_card_icon2.svg',
    //             headingText: 'Leave Management',
    //             onTap: () {
    //               GoRouter.of(context)
    //                   .pushNamed(leaveManagmentScreen, extra: person);
    //               // GoRouter.of(context)
    //               //     .pushNamed(onlineStoreScreen, extra: person);
    //             },
    //           ),
    //           //20.pw,
    //           CardEmployeeCenter(
    //             //margin: const EdgeInsets.only(right: 33).r,
    //             textColor: const Color(0xffFCAB10),
    //             svgPath: 'assets/images/employee_center_card_icon3.svg',
    //             headingText: 'Salary Payslip',
    //             onTap: () {
    //               GoRouter.of(context)
    //                   .pushNamed(salaryPaySlipScreen, extra: person);
    //             },
    //           ),
    //         ],
    //       ),
    //       28.ph,
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           CardEmployeeCenter(
    //             textColor: const Color(0xff188F71),
    //             svgPath: 'assets/images/employee_center_card_icon4.svg',
    //             headingText: 'Appraisal',
    //             onTap: () {
    //               GoRouter.of(context)
    //                   .pushNamed(apprisalScreen, extra: person);
    //             },
    //           ),
    //           //20.pw,
    //           CardEmployeeCenter(
    //             textColor: const Color(0xffFCAB10),
    //             svgPath: 'assets/images/employee_center_card_icon5.svg',
    //             headingText: 'General Information',
    //             onTap: () {
    //               GoRouter.of(context)
    //                   .pushNamed(generalInformationPage, extra: person);
    //             },
    //           ),
    //         ],
    //       ),
    //       //  20.ph,
    //     ],
    //   ),
    // ));
  }
}
