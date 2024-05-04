import 'dart:ui';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/constants.dart';

import 'package:fl_chart/fl_chart.dart';

import '../Procurement Manager Dashboard/procurement_manager_dashboard.dart';
import '../Widget/Charts/bar_chart.dart';
import '../Widget/main_home_screen_widget.dart';

class AccountingManagerDashboard extends StatelessWidget {
  const AccountingManagerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dashboard',
          style: GoogleFonts.montserrat(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.bold),
        ),
        10.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dashBoardFirstGrid(
              icon: 'assets/images/service_manager_first_grid_icon1.png',
              title: 'Total Customer',
              subTitle: '150',
            ),
            // 19.pw,
            dashBoardFirstGrid(
              icon: 'assets/images/service_manager_first_grid_icon2.png',
              title: 'Total Suppliers',
              subTitle: 'SR 45M',
            ),
          ],
        ),
        30.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dashBoardFirstGrid(
              icon: 'assets/images/service_manager_first_grid_icon3.png',
              title: 'Service Provider',
              subTitle: '0',
            ),
            // 19.pw,
            dashBoardFirstGrid(
              icon: 'assets/images/service_manager_first_grid_icon4.png',
              title: 'Issued Invoices',
              subTitle: '150',
            ),
          ],
        ),
        30.ph,
        dashBoardFirstGrid(
          icon: 'assets/images/service_manager_first_grid_icon5.png',
          title: 'Received Invoices',
          subTitle: '50',
        ),
        15.ph,
        Text(
          'Income & Expense',
          style: GoogleFonts.montserrat(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.bold),
        ),
        10.ph,
        Container(
          //height: 353.h,
          width: 331.w,

          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12).r,
          ),
          padding: const EdgeInsets.only(
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
              BarChartSample2(
                title: "Annual Sales",
                subtitle: "Comparison by Month",
                graphLinesColor1: const Color(0xff3EC9D6),
                graphLinesColor2: const Color(0xffFF3A6E),
                leftTitles: (double value, TitleMeta meta) {
                  var style = FontManagment().montserrat12;
                  String text;
                  if (value == 0) {
                    text = '0';
                  } else if (value == 5) {
                    text = '1';
                  } else if (value == 10) {
                    text = '3';
                  } else if (value == 15) {
                    text = '4';
                  } else if (value == 20) {
                    text = '5';
                  } else {
                    return Container();
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(text, style: style),
                  );
                },
                bottomTitles: (double value, TitleMeta meta) {
                  final titles = <String>[
                    'JAN',
                    'FEB',
                    'MAR',
                    'APR',
                    'MAY',
                    'JUN'
                  ];

                  final Widget text = Text(titles[value.toInt()],
                      style: FontManagment().montserrat12);

                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 16, //margin top
                    child: text,
                  );
                },
              ),
              const Divider(),
              20.ph,
              Row(
                children: [
                  Container(
                    height: 8.h,
                    width: 8.4.w,
                    decoration: const BoxDecoration(
                        color: Color(0xff3EC9D6), shape: BoxShape.circle),
                  ),
                  9.5.pw,
                  Text(
                    'Income',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 16.sp, color: const Color(0xff7C828A)),
                  ),
                  25.2.pw,
                  Container(
                    height: 8.h,
                    width: 8.4.w,
                    decoration: const BoxDecoration(
                        color: Color(0xffFF3A6E), shape: BoxShape.circle),
                  ),
                  9.5.pw,
                  Text(
                    'Expense',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 16.sp, color: const Color(0xff7C828A)),
                  ),
                ],
              )
            ],
          ),
        ),
        15.ph,
        Text(
          'Recent Invoice',
          style: GoogleFonts.montserrat(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.bold),
        ),
        10.ph,
        Container(
          // height: 408.h,
          padding: EdgeInsets.only(left: 17, top: 17, bottom: 24, right: 14),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(11).r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'List Recent Invoice',
                  style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff202046)),
                ),
              ),
              15.ph,
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5).r,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(
                        1.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.only(left: 25, top: 15, bottom: 15, right: 23).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Fuzail Fuzail',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff161616)),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Payable',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff161616)),
                            )
                          ],
                        ),
                      ],
                    ),
                    15.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Date',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Jan 5, 2022',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff161616)),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Due Date',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Jan 5, 2024',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff161616)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              20.ph,
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5).r,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(
                        1.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.only(left: 25, top: 15, bottom: 15, right: 23).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Fuzail Fuzail',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff161616)),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Payable',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff161616)),
                            )
                          ],
                        ),
                      ],
                    ),
                    15.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Date',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Jan 5, 2022',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff161616)),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Due Date',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Jan 5, 2024',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff161616)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              20.ph,
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5).r,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(
                        1.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.only(left: 25, top: 15, bottom: 15, right: 23).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Fuzail Fuzail',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff161616)),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Payable',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff161616)),
                            )
                          ],
                        ),
                      ],
                    ),
                    15.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Date',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Jan 5, 2022',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff161616)),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Due Date',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Jan 5, 2024',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff161616)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              20.ph,
            ],
          ),
        ),
      ],
    );
  }
}
