import 'dart:ui';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/constants.dart';

import 'package:fl_chart/fl_chart.dart';

import '../Widget/Charts/bar_chart.dart';
import '../Widget/main_home_screen_widget.dart';

class ProcurementManagerDashboard extends StatelessWidget {
  const ProcurementManagerDashboard({super.key});

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
              icon: 'assets/images/procurement_management_first_grid_icon1.png',
              title: 'Total Purchase of this Month',
              titleTextAlign: TextAlign.center,
              subTitle: 'SR 500M',
            ),
            // 19.pw,
            dashBoardFirstGrid(
              icon: 'assets/images/procurement_management_first_grid_icon2.png',
              title: 'Total Purchase Amount',
              titleTextAlign: TextAlign.center,
              subTitle: 'SR 15500.00M',
            ),
          ],
        ),
        15.ph,
        Text(
          'Purchase Report',
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
                'Last 6 Days',
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: const Color(0xff7C828A),
                    fontWeight: FontWeight.w500),
              ),
              BarChartSample2(
                title: "Annual Sales",
                subtitle: "Comparison by Month",
                graphLinesColor1: Color(0xffEF2E61),
                graphLinesColor2: Color(0xff6FD943),
                leftTitles: (double value, TitleMeta meta) {
                  var style = FontManagment().montserrat12;
                  String text;
                  if (value == 0) {
                    text = '0';
                  } else if (value == 4) {
                    text = '1';
                  } else if (value == 8) {
                    text = '2';
                  } else if (value == 12) {
                    text = '3';
                  } else if (value == 16) {
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
                    '03 mar ',
                    '04 mar ',
                    '05 mar ',
                    '06 mar ',
                    '07 mar ',
                    '08 mar '
                  ];

                  final Widget text = Text(titles[value.toInt()],
                      style: GoogleFonts.montserrat(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff7C828A)));

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
                        color: Color(0xffEF2E61), shape: BoxShape.circle),
                  ),
                  9.5.pw,
                  Text(
                    'Purchase',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 16.sp, color: const Color(0xff7C828A)),
                  ),
                  25.2.pw,
                  Container(
                    height: 8.h,
                    width: 8.4.w,
                    decoration: const BoxDecoration(
                        color: Color(0xff6FD943), shape: BoxShape.circle),
                  ),
                  9.5.pw,
                  Text(
                    'POS',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 16.sp, color: const Color(0xff7C828A)),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
