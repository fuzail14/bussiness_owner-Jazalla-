import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart' as badges;
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../HomeScreen/Controller/home_screen_controller.dart';
import '../Notifier/main_home_screen_notifier.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../Widget/main_home_screen_widget.dart';

class MainHomeScreen extends ConsumerStatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends ConsumerState<MainHomeScreen> {
  // PageController _pageController =
  //     PageController(initialPage: 0, viewportFraction: 1.1);
  // int _currentPage = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController.addListener(() {
  //     int next = _pageController.page!.round();
  //     if (_currentPage != next) {
  //       setState(() {
  //         _currentPage = next;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final person = ref.read(personProvider);
    final state = ref.watch(mainHomeScreenProvider);
    final notifier = ref.watch(mainHomeScreenProvider.notifier);
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: 600.h,
            padding:
                const EdgeInsets.only(left: 24, top: 50, right: 24, bottom: 20)
                    .r,
            width: double.infinity.w,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff2751A1), Color(0xff4BB3CF)])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text('Sales Manager', style: FontManagment().poppins14),
                //     SvgPicture.asset('assets/images/notification_icon.svg')
                //   ],
                // ),
                // Text(
                //   'Ahmend Ahmed',
                //   style: FontManagment().poppins24,
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 48.h,
                          width: 48.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff4EBBD3)),
                              color: Color(0xffF5F9F9),
                              shape: BoxShape.circle),
                          margin: EdgeInsets.only(top: 0, left: 0).r,
                          child: SvgPicture.asset(
                            'assets/images/default_company_logo.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        10.pw,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              person!.data!.company!.companyName!.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w800,
                                  color: whiteColor),
                            ),
                            //5.ph,
                            SizedBox(
                              width: 150.w,
                              child: Text(
                                "Hi,${person.data!.firstName.toString() + " " + person.data!.lastName.toString()}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: whiteColor),
                              ),
                            ),
                            Text(
                              'Administrator',
                              style: GoogleFonts.mulish(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                  color: whiteColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(notificationsScreen, extra: person);
                      },
                      child: badges.Badge(
                        badgeContent: Text('3',
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFFFFFF))),
                        position:
                            badges.BadgePosition.topEnd(top: -10, end: -12),
                        showBadge: true,
                        ignorePointer: false,
                        child: Container(
                            child: SvgPicture.asset(
                          'assets/images/bellicon.svg',
                        )),
                      ),
                    ),
                  ],
                ),
                Divider(),

                10.ph,
                SizedBox(
                  // height: 400,
                  width: 427.w,
                  height: 210.h,
                  child: PageView.builder(
                      controller: notifier.pageController,
                      pageSnapping: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      itemCount: notifier.glassCardList.length,
                      onPageChanged: notifier.cardIndexChanged,
                      itemBuilder: (context, index) {
                        return FractionallySizedBox(
                          widthFactor:
                              1 / notifier.pageController.viewportFraction,
                          child: Center(
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                child: Container(
                                  //width: 427.w,
                                  //height: 280.h,
                                  padding: const EdgeInsets.only(
                                          top: 22,
                                          left: 40,
                                          right: 40,
                                          bottom: 2)
                                      .r,

                                  decoration: BoxDecoration(
                                      color: const Color(0xffF6F6F6)
                                          .withOpacity(0.15),
                                      border: Border.all(
                                          color: const Color(0xffF6F6F6)
                                              .withOpacity(0.15)),
                                      borderRadius: const BorderRadius.all(
                                              Radius.circular(15))
                                          .r),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Text('Dashboard',
                                      //     style: FontManagment().poppins14),
                                      // 10.ph,
                                      // Text('Attendees',
                                      //     style: FontManagment().poppins28),
                                      SizedBox(
                                        width: 250.w,
                                        child: Text(
                                            notifier.glassCardList[index]
                                                ['title'],
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: FontManagment().poppins28),
                                      ),

                                      //  29.ph,
                                      // Container(
                                      //   width: 53.w,
                                      //   height: 20.h,
                                      //   padding: EdgeInsets.only(left: 4).r,
                                      //   decoration: BoxDecoration(
                                      //       color: Color(0xffFFFFFF)
                                      //           .withOpacity(0.30),
                                      //       borderRadius:
                                      //           BorderRadius.circular(10).r),
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.center,
                                      //     children: [
                                      //       Text(
                                      //         'View',
                                      //         style: FontManagment()
                                      //             .poppins10White,
                                      //       ),
                                      //       2.pw,
                                      //       SvgPicture.asset(
                                      //           'assets/images/arrow_down.svg')
                                      //     ],
                                      //   ),
                                      // ),
                                      15.8.ph,
                                      const Divider(),
                                      14.8.ph,
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (notifier.glassCardList[
                                                              index]
                                                          ['widget_title1'] ==
                                                      'Check In') {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                                context) =>
                                                            CheckInDialog(
                                                              title: 'Check In',
                                                              svgPath:
                                                                  'assets/images/check_in_dialog_icon.svg',
                                                            ));
                                                  }
                                                },
                                                child: Container(
                                                  height: 60.h,
                                                  width: 110.w,
                                                  padding:
                                                      const EdgeInsets.only(
                                                              left: 0,
                                                              top: 15,
                                                              bottom: 15)
                                                          .r,
                                                  decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                                  12)
                                                              .r),
                                                  child: notifier.glassCardList[
                                                                  index][
                                                              'widget_title1'] ==
                                                          'Vacation Balance'
                                                      ? ShaderMask(
                                                          shaderCallback:
                                                              (bounds) {
                                                            return const LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                Color(
                                                                    0xFF47A8CA),
                                                                Color(
                                                                    0xFF22429A),
                                                              ],
                                                            ).createShader(
                                                                Rect.fromLTWH(
                                                                    0,
                                                                    0,
                                                                    bounds
                                                                        .width,
                                                                    bounds
                                                                        .height));
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Text(
                                                              '10 Days',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    16.0.sp,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                        )
                                                      : SvgPicture.asset(
                                                          notifier.glassCardList[
                                                                  index]
                                                              ['widget_icon1']),
                                                ),
                                              ),
                                              7.ph,
                                              Text(
                                                notifier.glassCardList[index]
                                                    ['widget_title1'],
                                                style: FontManagment()
                                                    .poppins12White,
                                              ),
                                            ],
                                          ),
                                          19.pw,
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (notifier.glassCardList[
                                                              index]
                                                          ['widget_title2'] ==
                                                      'Check Out') {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                                context) =>
                                                            CheckInDialog(
                                                              title:
                                                                  'Check Out',
                                                              svgPath:
                                                                  'assets/images/check_out_dialog_icon.svg',
                                                            ));
                                                  }
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                              left: 0,
                                                              top: 12,
                                                              bottom: 12)
                                                          .r,
                                                  height: 60.h,
                                                  width: 110.w,
                                                  decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                                  12)
                                                              .r),
                                                  child: SvgPicture.asset(
                                                      notifier.glassCardList[
                                                              index]
                                                          ['widget_icon2']),
                                                ),
                                              ),
                                              7.ph,
                                              Text(
                                                notifier.glassCardList[index]
                                                    ['widget_title2'],
                                                style: FontManagment()
                                                    .poppins12White,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                17.ph,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    notifier.glassCardList.length,
                    (index) =>
                        buildDot(index: index, context: context, state: state),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // height: 662.h,
            margin: EdgeInsets.only(top: 400, bottom: 25).r,
            padding: EdgeInsets.only(left: 24, right: 24).r,
            decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30).r,
                    topRight: Radius.circular(30).r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 8.ph,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 178).r,
                  child: const Divider(
                    color: Color(0xff080422),
                    thickness: 0.3,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Actions',
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    10.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    approvalManagmentScreen,
                                    extra: person);
                              },
                              child: badges.Badge(
                                badgeContent: Text('3',
                                    style: GoogleFonts.roboto(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFFFFFF))),
                                position: badges.BadgePosition.topEnd(
                                    top: -10, end: -10),
                                showBadge: true,
                                ignorePointer: false,
                                child: Container(
                                  width: 80.w,
                                  height: 66.h,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(12).r,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        offset: const Offset(
                                          1.0,
                                          1.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/approval_icon.png',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   width: 100.w,
                            //   height: 86.h,
                            //   decoration: BoxDecoration(
                            //     color: whiteColor,
                            //     borderRadius: BorderRadius.circular(12).r,
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.grey.withOpacity(0.1),
                            //         offset: const Offset(
                            //           1.0,
                            //           1.0,
                            //         ),
                            //         blurRadius: 10.0,
                            //         spreadRadius: 1.0,
                            //       ),
                            //     ],
                            //   ),
                            //   child: Stack(
                            //     children: [
                            //       Padding(
                            //           padding:
                            //               EdgeInsets.only(left: 7, top: 4).r,
                            //           child: Text(
                            //             '5',
                            //             style: GoogleFonts.montserrat(
                            //                 color: Color(0xffBA1717),
                            //                 fontSize: 12.sp,
                            //                 fontWeight: FontWeight.w600),
                            //           )),
                            //       Center(
                            //         child: Image.asset(
                            //           'assets/images/approval_icon.png',
                            //           fit: BoxFit.fitWidth,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),

                            7.ph,
                            Text(
                              'Approval',
                              style: FontManagment().montserrat16,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 80.w,
                              height: 66.h,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(12).r,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    offset: const Offset(
                                      1.0,
                                      1.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child:
                                  Image.asset('assets/images/message_icon.png'),
                            ),
                            7.ph,
                            Text(
                              'Messages',
                              style: FontManagment().montserrat16,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 80.w,
                              height: 66.h,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(12).r,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    offset: const Offset(
                                      1.0,
                                      1.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                  'assets/images/calendar_icon.png'),
                            ),
                            7.ph,
                            Text(
                              'Calander',
                              style: FontManagment().montserrat16,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                20.ph,
                InkWell(
                  onTap: () {
                    GoRouter.of(context).pushNamed(generatedOtpPage);
                  },
                  child: Container(
                    height: 55.h,
                    // margin: EdgeInsets.only(left: 24, right: 24, bottom: 0).r,
                    decoration: BoxDecoration(
                      //  color: Color(0xff449FC6).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(6).r,
                      border: Border.all(color: Color(0xff2D60A8)),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.3),
                      //     offset: const Offset(
                      //       1.0,
                      //       3.0,
                      //     ),
                      //     blurRadius: 10.0,
                      //     spreadRadius: 1.0,
                      //   ),
                      // ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 21.5, right: 32.4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/generate_otp.png',
                                height: 34.h,
                                width: 34.w,
                              ),
                              10.pw,
                              Text(
                                'Generate OTP',
                                style: GoogleFonts.montserrat(
                                    color: blackColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/images/forward_arrow.svg',
                            height: 11.08.h,
                            width: 7.05.w,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                20.ph,

                Text(
                  'Dashboard',
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: blackColor,
                      fontWeight: FontWeight.bold),
                ),
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dashBoardFirstGrid(
                      icon: 'assets/images/revenue_icon.png',
                      title: 'Revenue',
                      subTitle: 'SR 45M',
                    ),
                    // 19.pw,
                    dashBoardFirstGrid(
                      icon: 'assets/images/expense_icon.png',
                      title: 'Expenses',
                      subTitle: 'SR 45M',
                    ),
                  ],
                ),
                30.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dashBoardFirstGrid(
                      icon: 'assets/images/payable_icon.png',
                      title: 'Payables',
                      subTitle: 'SR 45M',
                    ),
                    // 19.pw,
                    dashBoardFirstGrid(
                      icon: 'assets/images/recieveable_icon.png',
                      title: 'Receiveables',
                      subTitle: 'SR 45M',
                    ),
                  ],
                ),

                15.ph,
                Text(
                  'Revenue & Expense Graph',
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: blackColor,
                      fontWeight: FontWeight.bold),
                ),
                10.ph,
                Container(
                  //height: 353.h,
                  width: 331.w,

                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12).r,
                  ),
                  padding: EdgeInsets.only(
                          left: 16.8, top: 19, bottom: 20, right: 15.8)
                      .r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Year - 2024',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: blackColor,
                            fontWeight: FontWeight.w600),
                      ),
                      10.ph,
                      Text(
                        'Last 6 Months',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: const Color(0xff7C828A),
                            fontWeight: FontWeight.w500),
                      ),
                      BarChartSample2(),
                      Divider(),
                      20.ph,
                      Row(
                        children: [
                          Container(
                            height: 8.h,
                            width: 8.4.w,
                            decoration: BoxDecoration(
                                color: Color(0xff147AD6),
                                shape: BoxShape.circle),
                          ),
                          9.5.pw,
                          Text(
                            'Revenue',
                            style: GoogleFonts.nunitoSans(
                                fontSize: 16.sp, color: Color(0xff7C828A)),
                          ),
                          25.2.pw,
                          Container(
                            height: 8.h,
                            width: 8.4.w,
                            decoration: BoxDecoration(
                                color: Color(0xff79D2DE),
                                shape: BoxShape.circle),
                          ),
                          9.5.pw,
                          Text(
                            'Expense',
                            style: GoogleFonts.nunitoSans(
                                fontSize: 16.sp, color: Color(0xff7C828A)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                15.ph,
                Text(
                  'Others',
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: blackColor,
                      fontWeight: FontWeight.bold),
                ),
                10.ph,
                Container(
                  // padding: const EdgeInsets.only(
                  //         left: 24, top: 15, bottom: 15, right: 0)
                  //     .r,
                  // decoration: BoxDecoration(
                  //     color: whiteColor,
                  //     borderRadius: BorderRadius.circular(12).r),
                  //height: 353.h,
                  width: 331.w,

                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12).r,
                  ),
                  padding: const EdgeInsets.only(
                          left: 16.8, top: 19, bottom: 20, right: 1)
                      .r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      othersListTile(
                        icon: 'assets/images/no_of_project_icon.png',
                        title: 'No of Projects',
                        subTitle: '85',
                      ),
                      15.ph,
                      Container(
                        height: 1.h,
                        width: double.infinity.w,
                        margin: const EdgeInsets.only(right: 25).r,
                        decoration:
                            BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                      ),
                      13.ph,
                      othersListTile(
                        icon: 'assets/images/total_project_value_icon.png',
                        title: 'Total Project Value',
                        subTitle: 'SAR 550M',
                      ),
                      15.ph,
                      Container(
                        height: 1.h,
                        width: double.infinity.w,
                        margin: const EdgeInsets.only(right: 25).r,
                        decoration:
                            BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                      ),
                      13.ph,
                      othersListTile(
                        icon: 'assets/images/local_content_value_icon.png',
                        title: 'Local Content Value',
                        subTitle: 'SAR 55M',
                      ),
                      15.ph,
                      Container(
                        height: 1.h,
                        width: double.infinity.w,
                        margin: const EdgeInsets.only(right: 25).r,
                        decoration:
                            BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                      ),
                      13.ph,
                      othersListTile(
                        icon: 'assets/images/lc_percentage_icon.png',
                        title: 'LC Percentage',
                        subTitle: '38%',
                      ),
                      15.ph,
                      Container(
                        height: 1.h,
                        width: double.infinity.w,
                        margin: const EdgeInsets.only(right: 25).r,
                        decoration:
                            BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                      ),
                      13.ph,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildDot(
      {required int index,
      required BuildContext context,
      required MainHomeScreenState state}) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          //color: _currentPage == index ? Colors.white : Colors.grey,
        ),
        child: state.currentPage == index
            ? SizedBox(
                width: 20.w,
                height: 10,
                child: SvgPicture.asset(
                  'assets/images/dot_indicator_selected.svg',
                  fit: BoxFit.contain,
                ),
              )
            : SizedBox(
                height: 10.h,
                width: 10.w,
                child: SvgPicture.asset(
                  'assets/images/dot_indicator_unselected.svg',
                  fit: BoxFit.cover,
                ),
              ));
  }
}

class CheckInDialog extends StatelessWidget {
  String title;
  String svgPath;
  CheckInDialog({required this.title, required this.svgPath});
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(left: 0.0, right: 0.0),
          width: 320.w,
          height: 403.h,
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  // height: 403.h,
                  padding: EdgeInsets.only(top: 18.0, right: 0, bottom: 50).r,
                  margin: EdgeInsets.only(top: 50.0, right: 8.0, bottom: 0).r,

                  decoration: BoxDecoration(
                      color: whiteColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      16.2.ph,
                      Center(
                        child: Text(
                          title,
                          style: GoogleFonts.montserrat(
                              fontSize: 18.22.sp,
                              color: Color(0xff5F5656),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      28.4.ph,
                      Padding(
                        padding: const EdgeInsets.only(left: 30).r,
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: Color(0xffAFAFAF),
                              size: 18.h,
                            ),
                            10.pw,
                            SizedBox(
                              width: 220.w,
                              child: Text(
                                'Saturday, October 22nd 2022',
                                style: GoogleFonts.montserrat(
                                    color: Color(0xff383333),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 15).r,
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer_sharp,
                              color: Color(0xffAFAFAF),
                              size: 18.h,
                            ),
                            10.pw,
                            Text(
                              '06:00 PM',
                              style: GoogleFonts.montserrat(
                                  color: Color(0xff383333),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      31.ph,
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 30.h,
                          width: 147.w,
                          margin: EdgeInsets.symmetric(horizontal: 75).r,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16).r,
                              gradient: LinearGradient(colors: [
                                Color(0xff2751A1),
                                Color(0xff4BB3CF)
                              ])),
                          child: Center(
                            child: Text(
                              'Done',
                              style: FontManagment().montserrat14White,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 10
                      .h, // This positions the top of the CircleAvatar at the top edge of the Stack.
                  left: (280.w / 2) -
                      (41.8.w /
                          2), // This centers the CircleAvatar horizontally in the Stack.
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      radius: 61.8.h /
                          2, // This sets the radius of the CircleAvatar.
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset(svgPath),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget dialogContent(BuildContext context, title) {
    return Container(
      margin: EdgeInsets.only(left: 0.0, right: 0.0),
      width: 320.w,
      height: 403.h,
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              // height: 403.h,
              padding: EdgeInsets.only(top: 18.0, right: 0, bottom: 50).r,
              margin: EdgeInsets.only(top: 50.0, right: 8.0, bottom: 0).r,

              decoration: BoxDecoration(
                  color: whiteColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 0.0,
                      offset: Offset(0.0, 0.0),
                    ),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  16.2.ph,
                  Center(
                    child: Text(
                      title!,
                      style: GoogleFonts.montserrat(
                          fontSize: 18.22.sp,
                          color: Color(0xff5F5656),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  28.4.ph,
                  Padding(
                    padding: const EdgeInsets.only(left: 30).r,
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          color: Color(0xffAFAFAF),
                          size: 18.h,
                        ),
                        10.pw,
                        SizedBox(
                          width: 220.w,
                          child: Text(
                            'Saturday, October 22nd 2022',
                            style: GoogleFonts.montserrat(
                                color: Color(0xff383333),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 15).r,
                    child: Row(
                      children: [
                        Icon(
                          Icons.timer_sharp,
                          color: Color(0xffAFAFAF),
                          size: 18.h,
                        ),
                        10.pw,
                        Text(
                          '06:00 PM',
                          style: GoogleFonts.montserrat(
                              color: Color(0xff383333),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  31.ph,
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30.h,
                      width: 147.w,
                      margin: EdgeInsets.symmetric(horizontal: 75).r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16).r,
                          gradient: LinearGradient(
                              colors: [Color(0xff2751A1), Color(0xff4BB3CF)])),
                      child: Center(
                        child: Text(
                          'Done',
                          style: FontManagment().montserrat14White,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 10
                  .h, // This positions the top of the CircleAvatar at the top edge of the Stack.
              left: (280.w / 2) -
                  (41.8.w /
                      2), // This centers the CircleAvatar horizontally in the Stack.
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  radius:
                      61.8.h / 2, // This sets the radius of the CircleAvatar.
                  backgroundColor: Colors.transparent,
                  child: SvgPicture.asset(
                    'assets/images/dialog_upper_circle.svg',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BarChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  // final double width = 6;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    // final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      //barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Padding(
        padding: const EdgeInsets.all(0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 23,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: ((group) {
                        return Colors.grey;
                      }),
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                              in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg = sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                            barRods: showingBarGroups[touchedGroupIndex]
                                .barRods
                                .map((rod) {
                              return rod.copyWith(
                                  toY: avg, color: Colors.amber);
                            }).toList(),
                          );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 48,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 48,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    var style = FontManagment().montserrat12;
    String text;
    if (value == 0) {
      text = '\$0K';
    } else if (value == 10) {
      text = '\$25K';
    } else if (value == 19) {
      text = '\$50K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN'];

    final Widget text =
        Text(titles[value.toInt()], style: FontManagment().montserrat12);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 2,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Color(0xff147AD6),
          width: 8.w,
        ),
        BarChartRodData(
          toY: y2,
          color: Color(0xff79D2DE),
          width: 8.w,
        ),
      ],
    );
  }
}
