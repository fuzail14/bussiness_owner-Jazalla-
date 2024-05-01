import 'dart:ui';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/constants.dart';

import 'package:fl_chart/fl_chart.dart';

import '../Widget/main_home_screen_widget.dart';

class BarChartSample2 extends StatefulWidget {
  const BarChartSample2({super.key});

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
          color: const Color(0xff147AD6),
          width: 8.w,
        ),
        BarChartRodData(
          toY: y2,
          color: const Color(0xff79D2DE),
          width: 8.w,
        ),
      ],
    );
  }
}

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
              const BarChartSample2(),
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
