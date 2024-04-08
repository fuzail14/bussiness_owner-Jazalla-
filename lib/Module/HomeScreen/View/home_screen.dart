import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Module/MarketPlace/View/market_place_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../Constants/Global/Method/global_methods.dart';
import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Constants/constants.dart';
import '../../../Services/Notification Services/notification_services.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../Approval Managment/Main/View/approval_managment_screen.dart';
import '../../EmployeeCenter/View/employee_center_page.dart';
import '../../Menu/View/menu_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    NotificationServices notificationServices = NotificationServices();
    notificationServices.requestNotification();
    notificationServices.foreGroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage();
    notificationServices.getDeviceToken().then((value) async {
      print('updated token $value');
      Person person2 = await MySharedPreferences.getUserData();

      if (person2.data!.fcmtoken != value) {
        print('token not matched');
        fcmtokenrefresh(person2.data!.id!, value!, person2.Bearer!);

        MySharedPreferences.updateUserData(fcmToken: value);
      } else {
        print('token matched');
      }
    });
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

//  _HomeScreenState({super.key});

  List<Widget> _buildScreens() {
    return [
      // CustomLineChart(),
      MainHomeScreen(),
      MarketPlaceScreen(),
      ApprovalManagmentScreen(),
      EmployeeCenterPage(),
      Menu(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        textStyle:
            GoogleFonts.ubuntu(fontSize: 10.sp, fontWeight: FontWeight.w600),
        activeColorPrimary: Color(0xff49AECD),
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.macwindow),
        title: ("MarketPlace"),
        textStyle:
            GoogleFonts.ubuntu(fontSize: 10.sp, fontWeight: FontWeight.w600),
        activeColorPrimary: Color(0xff49AECD),
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.app_badge_fill),
        title: ("Approvals"),
        textStyle:
            GoogleFonts.ubuntu(fontSize: 10.sp, fontWeight: FontWeight.w600),
        activeColorPrimary: Color(0xff49AECD),
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.waveform_circle),
        title: ("Employee Center"),
        textStyle:
            GoogleFonts.ubuntu(fontSize: 10.sp, fontWeight: FontWeight.w600),
        activeColorPrimary: Color(0xff49AECD),
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.square_grid_2x2_fill),
        title: ("Menu"),
        textStyle:
            GoogleFonts.ubuntu(fontSize: 10.sp, fontWeight: FontWeight.w600),
        activeColorPrimary: Color(0xff49AECD),
        inactiveColorPrimary: Colors.black,
      ),
      // Add more items as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    final person = ref.read(personProvider);

    print('homescreen');
    print(person!.data!.name);
    // print(person!.data!.company!.companyName);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}

class CustomLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      //resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IncomeExpenseCard(),
            Expanded(
              child: FadeInDown(
                duration: Duration(milliseconds: 600),
                delay: Duration(milliseconds: 100),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff020227),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(16),
                  child: LineChart(
                    LineChartData(
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          tooltipBgColor: Colors.blueAccent,
                          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                            return touchedBarSpots.map((barSpot) {
                              final flSpot = barSpot;
                              return LineTooltipItem(
                                '${flSpot.y}m',
                                const TextStyle(color: Colors.white),
                              );
                            }).toList();
                          },
                        ),
                        touchCallback: (FlTouchEvent, LineTouchResponse) {},
                        handleBuiltInTouches: true,
                      ),
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        horizontalInterval: 1,
                        getDrawingVerticalLine: (value) {
                          return FlLine(
                            color: Colors.white10,
                            strokeWidth: 1,
                          );
                        },
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.white10,
                            strokeWidth: 1,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: _bottomTitleWidgets,
                            reservedSize: 42,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: _leftTitleWidgets,
                            reservedSize: 42,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Color(0xff37434d), width: 1),
                      ),
                      minX: 0,
                      maxX: 11,
                      minY: 0,
                      maxY: 6,
                      lineBarsData: _linesBarData(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<LineChartBarData> _linesBarData() {
    LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(0, 1),
        FlSpot(2, 3),
        FlSpot(4, 1.5),
        FlSpot(6, 4),
        FlSpot(8, 3.2),
        FlSpot(10, 4),
      ],
      isCurved: true,
      color: Colors.purpleAccent,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
    );

    LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(0, 2.8),
        FlSpot(2, 1.9),
        FlSpot(4, 3),
        FlSpot(6, 2.5),
        FlSpot(8, 2.2),
        FlSpot(10, 2.8),
      ],
      isCurved: true,
      color: Colors.blueAccent,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
    );

    LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: [
        FlSpot(0, 2.5),
        FlSpot(2, 1),
        FlSpot(4, 2.8),
        FlSpot(6, 1.5),
        FlSpot(8, 1.7),
        FlSpot(10, 2.5),
      ],
      isCurved: true,
      color: Colors.tealAccent,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
    );

    return [lineChartBarData1, lineChartBarData2, lineChartBarData3];
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('SEPT', style: style);
        break;
      case 5:
        text = Text('OCT', style: style);
        break;
      case 8:
        text = Text('DEC', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget _leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    return Text('${value.toInt()}m', style: style, textAlign: TextAlign.left);
  }
}

class IncomeExpenseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 600),
      delay: Duration(milliseconds: 100),
      child: Card(
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Income Vs Expense',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              Divider(),
              SizedBox(height: 16),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _InfoItem(
                      title: 'Income Today',
                      value: '\$15000.10',
                      iconColor: Colors.blue,
                      iconData: Icons.account_balance_wallet,
                    ),
                    VerticalDivider(),
                    _InfoItem(
                      title: 'Expense Today',
                      value: '\$7342.40',
                      iconColor: Colors.red,
                      iconData: Icons.money_off,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _InfoItem(
                      title: 'Income This Month',
                      value: '\$200000.890',
                      iconColor: Colors.orange,
                      iconData: Icons.account_balance_wallet,
                    ),
                    VerticalDivider(),
                    _InfoItem(
                      title: 'Expense This Month',
                      value: '\$83500.90',
                      iconColor: Colors.pink,
                      iconData: Icons.money_off,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final Color iconColor;
  final IconData iconData;

  const _InfoItem({
    Key? key,
    required this.title,
    required this.value,
    required this.iconColor,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            iconData,
            color: iconColor,
            size: 48,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1.1);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: 600.h,
            padding:
                const EdgeInsets.only(left: 20, top: 48, right: 20, bottom: 20)
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sales Manager', style: FontManagment().poppins14),
                    SvgPicture.asset('assets/images/notification_icon.svg')
                  ],
                ),
                Text(
                  'Ahmend Ahmed',
                  style: FontManagment().poppins24,
                ),
                20.ph,
                SizedBox(
                  // height: 400,
                  // width: 427.w,
                  height: 320.h,
                  child: PageView.builder(
                      controller: _pageController,
                      pageSnapping: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      itemCount: glassCardList.length,
                      itemBuilder: (context, index) {
                        return FractionallySizedBox(
                          widthFactor: 1 / _pageController.viewportFraction,
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
                                          left: 20,
                                          right: 20,
                                          bottom: 2)
                                      .r,

                                  decoration: BoxDecoration(
                                      color: const Color(0xffF6F6F6)
                                          .withOpacity(0.15),
                                      border: Border.all(
                                          color: const Color(0xffF6F6F6)
                                              .withOpacity(0.15)),
                                      borderRadius: const BorderRadius.all(
                                              Radius.circular(30))
                                          .r),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Text('Dashboard',
                                              style: FontManagment().poppins14),
                                          10.ph,
                                          // Text('Attendees',
                                          //     style: FontManagment().poppins28),
                                          Text(glassCardList[index]['title'],
                                              style: FontManagment().poppins28),

                                          29.ph,
                                          Container(
                                            width: 53.w,
                                            height: 20.h,
                                            padding: EdgeInsets.only(left: 4).r,
                                            decoration: BoxDecoration(
                                                color: Color(0xffFFFFFF)
                                                    .withOpacity(0.30),
                                                borderRadius:
                                                    BorderRadius.circular(10)
                                                        .r),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'View',
                                                  style: FontManagment()
                                                      .poppins10White,
                                                ),
                                                2.pw,
                                                SvgPicture.asset(
                                                    'assets/images/arrow_down.svg')
                                              ],
                                            ),
                                          ),
                                          23.8.ph,
                                          const Divider(),
                                        ],
                                      ),
                                      14.8.ph,
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (glassCardList[index]
                                                          ['widget_title1'] ==
                                                      'Check In') {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                                context) =>
                                                            CheckInDialog(
                                                              title: 'Check In',
                                                            ));
                                                  }
                                                },
                                                child: Container(
                                                  height: 70.h,
                                                  width: 130.w,
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
                                                  child: glassCardList[index][
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
                                                                    .all(8.0),
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
                                                          glassCardList[index]
                                                              ['widget_icon1']),
                                                ),
                                              ),
                                              7.ph,
                                              Text(
                                                glassCardList[index]
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
                                                  if (glassCardList[index]
                                                          ['widget_title2'] ==
                                                      'Check Out') {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                                context) =>
                                                            CheckInDialog(
                                                              title:
                                                                  'Check Out',
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
                                                  height: 70.h,
                                                  width: 130.w,
                                                  decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                                  12)
                                                              .r),
                                                  child: SvgPicture.asset(
                                                      glassCardList[index]
                                                          ['widget_icon2']),
                                                ),
                                              ),
                                              7.ph,
                                              Text(
                                                glassCardList[index]
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
                    glassCardList.length,
                    (index) => buildDot(index: index, context: context),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // height: 662.h,
            margin: EdgeInsets.only(top: 500, bottom: 25).r,
            decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30).r,
                    topRight: Radius.circular(30).r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.ph,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 178).r,
                  child: const Divider(
                    color: Color(0xff080422),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 11).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Actions',
                        style: FontManagment().montserrat18,
                      ),
                      16.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 100.w,
                                height: 86.h,
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
                                child: Stack(
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.only(left: 7, top: 4).r,
                                        child: Text(
                                          '5',
                                          style: GoogleFonts.montserrat(
                                              color: Color(0xffBA1717),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    Center(
                                      child: Image.asset(
                                        'assets/images/approval_icon.png',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                                width: 100.w,
                                height: 86.h,
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
                                    'assets/images/message_icon.png'),
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
                                width: 100.w,
                                height: 86.h,
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
                ),
                25.ph,
                Container(
                  height: 51.h,
                  margin: EdgeInsets.symmetric(
                    horizontal: 25,
                  ).r,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(6).r,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(
                          1.0,
                          3.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 21.5, right: 32.4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Generate OTP',
                          style: GoogleFonts.montserrat(
                              color: Color(0xff302929),
                              fontSize: 17.16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SvgPicture.asset('assets/images/forward_arrow.svg')
                      ],
                    ),
                  ),
                ),
                20.ph,
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 11).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Services',
                        style: FontManagment().montserrat18,
                      ),
                      13.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100.w,
                            height: 86.h,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Services',
                                    maxLines: 1,
                                    style: FontManagment().poppins14Black),
                                Text('Lorem Ispum',
                                    maxLines: 1,
                                    style: FontManagment().poppins12Grey),
                              ],
                            ),
                          ),
                          Container(
                            width: 100.w,
                            height: 86.h,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Services',
                                    maxLines: 1,
                                    style: FontManagment().poppins14Black),
                                Text('Lorem Ispum',
                                    maxLines: 1,
                                    style: FontManagment().poppins12Grey),
                              ],
                            ),
                          ),
                          Container(
                            width: 100.w,
                            height: 86.h,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Services',
                                    maxLines: 1,
                                    style: FontManagment().poppins14Black),
                                Text('Lorem Ispum',
                                    maxLines: 1,
                                    style: FontManagment().poppins12Grey),
                              ],
                            ),
                          ),
                        ],
                      )
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

  Widget buildDot({required int index, required BuildContext context}) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          //color: _currentPage == index ? Colors.white : Colors.grey,
        ),
        child: _currentPage == index
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List glassCardList = [
    {
      'title': 'Attendees',
      'widget_icon1': 'assets/images/check_in_icon.svg',
      'widget_title1': 'Check In',
      'widget_icon2': 'assets/images/check_out_icon.svg',
      'widget_title2': 'Check Out',
    },
    {
      'title': 'Leave Management',
      'widget_icon1': 'assets/images/vacation_balance_icon.svg',
      'widget_title1': 'Vacation Balance',
      'widget_icon2': 'assets/images/leave_request_icon.svg',
      'widget_title2': 'Leave Request',
    },
    {
      'title': 'General Information',
      'widget_icon1': 'assets/images/profile_icon.svg',
      'widget_title1': 'Profile',
      'widget_icon2': 'assets/images/company_icon.svg',
      'widget_title2': 'Company',
    }
  ];
}

class CheckInDialog extends StatelessWidget {
  String? title;
  CheckInDialog({required this.title});
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
                      child: SvgPicture.asset(
                        'assets/images/dialog_upper_circle.svg',
                      ),
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


// class MainHomeScreen extends StatefulWidget {
//   @override
//   _MainHomeScreenState createState() => _MainHomeScreenState();
// }

// class _MainHomeScreenState extends State<MainHomeScreen> {
//   PageController _pageController = PageController(viewportFraction: 0.9);
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(() {
//       int next = _pageController.page!.round();
//       if (_currentPage != next) {
//         setState(() {
//           _currentPage = next;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               //height: 441.h,
//               padding: const EdgeInsets.only(
//                       left: 20, top: 48, right: 20, bottom: 20)
//                   .r,

//               width: double.infinity.w,
//               decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [Color(0xff2751A1), Color(0xff4BB3CF)])),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Sales Manager', style: FontManagment().poppins14),
//                       Icon(Icons.notification_add)
//                     ],
//                   ),
//                   Text(
//                     'Ahmend Ahmed',
//                     style: FontManagment().poppins24,
//                   ),
//                   40.ph,
//                   PageView.builder(
//                       controller: _pageController,
//                       itemCount: 3,
//                       itemBuilder: (context, index) {
//                         return Center(
//                           child: ClipRRect(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(25)),
//                             child: BackdropFilter(
//                               filter:
//                                   ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//                               child: Container(
//                                 width: 327.w,
//                                 // height: 280.h,
//                                 padding: const EdgeInsets.only(
//                                         top: 22,
//                                         left: 20,
//                                         right: 20,
//                                         bottom: 22)
//                                     .r,
//                                 decoration: BoxDecoration(
//                                     color: const Color(0xffF6F6F6)
//                                         .withOpacity(0.15),
//                                     border: Border.all(
//                                         color: const Color(0xffF6F6F6)
//                                             .withOpacity(0.15)),
//                                     borderRadius: const BorderRadius.all(
//                                             Radius.circular(30))
//                                         .r),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Text('Dashboard',
//                                             style: FontManagment().poppins14),
//                                         10.ph,
//                                         Text('Attendees',
//                                             style: FontManagment().poppins28),
//                                         29.ph,
//                                         Container(
//                                           width: 53.w,
//                                           height: 20.h,
//                                           padding: EdgeInsets.only(left: 4).r,
//                                           decoration: BoxDecoration(
//                                               color: Color(0xffFFFFFF)
//                                                   .withOpacity(0.30),
//                                               borderRadius:
//                                                   BorderRadius.circular(10).r),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Text(
//                                                 'View',
//                                                 style: FontManagment()
//                                                     .poppins10White,
//                                               ),
//                                               2.pw,
//                                               SvgPicture.asset(
//                                                   'assets/images/arrow_down.svg')
//                                             ],
//                                           ),
//                                         ),
//                                         23.8.ph,
//                                         const Divider(),
//                                       ],
//                                     ),
//                                     14.8.ph,
//                                     Row(
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Container(
//                                               height: 70.h,
//                                               width: 130.w,
//                                               padding: const EdgeInsets.only(
//                                                       left: 0,
//                                                       top: 12,
//                                                       bottom: 12)
//                                                   .r,
//                                               decoration: BoxDecoration(
//                                                   color: whiteColor,
//                                                   borderRadius:
//                                                       BorderRadius.circular(12)
//                                                           .r),
//                                               child: SvgPicture.asset(
//                                                 'assets/images/check_in_icon.svg',
//                                               ),
//                                             ),
//                                             7.ph,
//                                             Text(
//                                               'Check In',
//                                               style: FontManagment()
//                                                   .poppins12White,
//                                             ),
//                                           ],
//                                         ),
//                                         19.pw,
//                                         Column(
//                                           children: [
//                                             Container(
//                                               padding: const EdgeInsets.only(
//                                                       left: 0,
//                                                       top: 12,
//                                                       bottom: 12)
//                                                   .r,
//                                               height: 70.h,
//                                               width: 130.w,
//                                               decoration: BoxDecoration(
//                                                   color: whiteColor,
//                                                   borderRadius:
//                                                       BorderRadius.circular(12)
//                                                           .r),
//                                               child: SvgPicture.asset(
//                                                 'assets/images/check_out_icon.svg',
//                                               ),
//                                             ),
//                                             7.ph,
//                                             Text(
//                                               'Check Out',
//                                               style: FontManagment()
//                                                   .poppins12White,
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       })
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 3, // Number of dots should match the itemCount of the PageView
//                 (index) => buildDot(index: index, context: context),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
