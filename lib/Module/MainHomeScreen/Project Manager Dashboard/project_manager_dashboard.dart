import 'dart:ui';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProjectManagerDashboard extends StatelessWidget {
  const ProjectManagerDashboard({super.key});

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
            firstGrid(
                firstColor: Color(0xff351E99),
                title: 'Total Project',
                subTitle: '2 Project',
                imgPath: 'assets/images/projectmanager_firstgrid_img1.png',
                thirdText: '10%',
                thirdTextColor: Color(0xff00B3A7),
                fourText: 'completed'),
            firstGrid(
                firstColor: Color(0xffCB0101),
                title: 'Total Task',
                subTitle: '7 Tasks',
                imgPath: 'assets/images/projectmanager_firstgrid_img2.png',
                thirdText: '10%',
                thirdTextColor: Color(0xff00B3A7),
                fourText: 'completed'),
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            firstGrid(
                firstColor: Color(0xff00B3A7),
                title: 'Total Expenses',
                subTitle: '50M',
                imgPath: 'assets/images/projectmanager_firstgrid_img3.png',
                thirdText: '7%',
                thirdTextColor: Color(0xff00B3A7),
                fourText: 'Expenses'),
            firstGrid(
                firstColor: Color(0xffDE6D02),
                title: 'Total Project Value',
                subTitle: '14368 SR',
                imgPath: 'assets/images/projectmanager_firstgrid_img4.png',
                thirdText: '10%',
                thirdTextColor: Color(0xff00B3A7),
                fourText: 'completed'),
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            firstGrid(
                firstColor: Color(0xff351E99),
                title: 'Total Content Value',
                subTitle: 'SR 45M',
                imgPath: 'assets/images/projectmanager_firstgrid_img1.png',
                thirdText: '10%',
                thirdTextColor: Color(0xff00B3A7),
                fourText: 'Completed'),
            firstGrid(
                firstColor: Color(0xff351E99),
                title: 'Local Content %',
                subTitle: 'SR 60M',
                imgPath: 'assets/images/projectmanager_firstgrid_img1.png',
                thirdText: '10%',
                thirdTextColor: Color(0xff00B3A7),
                fourText: 'completed'),
          ],
        ),
        15.ph,
        Text(
          'Local Content Status',
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
              Text(
                'Local Content Status',
                style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff202046)),
              ),
              15.ph,
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5).r,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: const Offset(
                        1.0,
                        10.0,
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
                              'Project Title',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Paint Asian House',
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
                              'Submitted LC',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              '23425 SR',
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
                              'Project Title',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Paint Asian House',
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
                              'Submitted LC',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              '23425 SR',
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
                    Text(
                      'Submitted LC',
                      style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                    Text(
                      '23425 SR',
                      style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff161616)),
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
                      color: Colors.grey.withOpacity(0.4),
                      offset: const Offset(
                        1.0,
                        10.0,
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
                              'Project Title',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Paint Asian House',
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
                              'Submitted LC',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              '23425 SR',
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
                              'Project Title',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              'Paint Asian House',
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
                              'Submitted LC',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              '23425 SR',
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
                    Text(
                      'Submitted LC',
                      style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                    Text(
                      '23425 SR',
                      style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff161616)),
                    ),
                  ],
                ),
              ),
              20.ph,
            ],
          ),
        ),
        20.ph,
        Text(
          'Task OverView',
          style: GoogleFonts.montserrat(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.bold),
        ),
        20.ph,
        Container(
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
                'Total Completed task in last 7 days',
                style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: const Color(0xff7C828A),
                    fontWeight: FontWeight.w500),
              ),
              LineChartSample2(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget firstGrid({
  required Color firstColor,
  required String title,
  required String subTitle,
  required String imgPath,
  required String thirdText,
  required Color thirdTextColor,
  required String fourText,
}) {
  return Container(
    height: 124.h,
    width: 156.47.w,
    padding: EdgeInsets.only(left: 0, top: 13, bottom: 0, right: 0).r,
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(8).r,
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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            Container(
              width: 3.w,
              height: 16.h,
              color: firstColor,
            ),
            11.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 102.w,
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff727A90)),
                    )),
                4.ph,
                Text(
                  subTitle,
                  style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff0C0D0F)),
                )
              ],
            ),
            Image.asset(
              imgPath,
              height: 32.h,
              width: 32.h,
            )
          ],
        ),
        11.ph,
        const Divider(
          color: Color(0xffB7B7B7),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11).r,
          child: Row(
            children: [
              Text(
                thirdText,
                style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: thirdTextColor),
              ),
              4.1.pw,
              Text(
                fourText,
                style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff727A90)),
              )
            ],
          ),
        )
      ],
    ),
  );
}

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [Color(0xff5274CB), Color(0xffFFFFFF)];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.3,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 0,
              left: 0,
              top: 0,
              bottom: 0,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
        // SizedBox(
        //   width: 60,
        //   height: 34,
        //   child: TextButton(
        //     onPressed: () {
        //       setState(() {
        //         showAvg = !showAvg;
        //       });
        //     },
        //     child: Text(
        //       'avg',
        //       style: TextStyle(
        //         fontSize: 12,
        //         color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        fontSize: 8,
        color: const Color(0xff4D4D4D));
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('MON', style: style);
        break;
      case 2:
        text = Text('TUE', style: style);
        break;
      case 3:
        text = Text('WED', style: style);
        break;
      case 4:
        text = Text('THU', style: style);
        break;
      case 5:
        text = Text('FRI', style: style);
        break;
      case 6:
        text = Text('SAT', style: style);
        break;
      case 7:
        text = Text('SUN', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: const Color(0xff4D4D4D));
    String text;
    switch (value.toInt()) {
      case 1:
        text = '0';
        break;
      case 2:
        text = '1';
        break;
      case 3:
        text = '2';
        break;
      case 4:
        text = '3';
        break;
      case 5:
        text = '4';
        break;
      case 6:
        text = '5';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,

        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Color(0xffC1C1C1).withOpacity(0.5),
            strokeWidth: 1,
          );
        },
        // getDrawingVerticalLine: (value) {
        //   return const FlLine(
        //     color: Colors.red,
        //     strokeWidth: 1,
        //   );
        // },
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
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: Colors.red),
      ),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 4),
            FlSpot(2.0, 1.5),
            FlSpot(3.9, 4),
            FlSpot(6.8, 1.5),
            FlSpot(8, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.5))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
