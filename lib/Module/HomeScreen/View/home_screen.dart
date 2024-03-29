import 'package:animate_do/animate_do.dart';
import 'package:bussines_owner/Module/MarketPlace/View/market_place_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../Constants/Global/Method/global_methods.dart';
import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Services/Notification Services/notification_services.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
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
      CustomLineChart(),
      MarketPlaceScreen(),
      Container(),
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
