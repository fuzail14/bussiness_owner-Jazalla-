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

class AdministratorDashboard extends StatelessWidget {
  const AdministratorDashboard({super.key});

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
                graphLinesColor1: const Color(0xff147AD6),
                graphLinesColor2: const Color(0xff79D2DE),
                leftTitles: (double value, TitleMeta meta) {
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
                        color: Color(0xff147AD6), shape: BoxShape.circle),
                  ),
                  9.5.pw,
                  Text(
                    'Revenue',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 16.sp, color: const Color(0xff7C828A)),
                  ),
                  25.2.pw,
                  Container(
                    height: 8.h,
                    width: 8.4.w,
                    decoration: const BoxDecoration(
                        color: Color(0xff79D2DE), shape: BoxShape.circle),
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
          'Others',
          style: GoogleFonts.montserrat(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.bold),
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
          padding:
              const EdgeInsets.only(left: 16.8, top: 19, bottom: 20, right: 1)
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
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
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
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
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
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
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
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
              ),
              13.ph,
            ],
          ),
        ),
      ],
    );
  }
}
