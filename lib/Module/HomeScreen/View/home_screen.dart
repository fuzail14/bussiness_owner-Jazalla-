import 'package:bussines_owner/Module/MarketPlace/View/market_place_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../../MainHomeScreen/Main/View/main_home_screen.dart';
import '../../Menu/View/menu_screen.dart';
import '../Controller/home_screen_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

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

  @override
  void dispose() {
    super.dispose();
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  //  _HomeScreenState({super.key});

  // List<Widget> _buildScreens() {
  //   return [
  //     // CustomLineChart(),
  //     const MainHomeScreen(),
  //     MarketPlaceScreen(),
  //     const ApprovalManagmentScreen(),

  //     const EmployeeCenterPage(),
  //     const Menu(),
  //   ];
  // }

  List<Widget> _buildScreens(String userType) {
    switch (userType) {
      case userTypeCompany:
        return [
          // CustomLineChart(),
          const MainHomeScreen(),
          MarketPlaceScreen(),
          const ApprovalManagmentScreen(),
          const EmployeeCenterPage(),
          const Menu(),
        ];
      case userTypeEmployee:
        return [
          // CustomLineChart(),
          const MainHomeScreen(),
          const EmployeeCenterPage(),
          const Menu(),
        ];
      case userTypeProjectManager:
        return [
          // CustomLineChart(),
          const MainHomeScreen(),
          MarketPlaceScreen(),
          const ApprovalManagmentScreen(),
          const EmployeeCenterPage(),
          const Menu(),
        ];
      case userTypeProcurementManager:
        return [
          // CustomLineChart(),
          const MainHomeScreen(),
          MarketPlaceScreen(),
          const ApprovalManagmentScreen(),
          const EmployeeCenterPage(),
          const Menu(),
        ];
      case userTypeServiceManager:
        return [
          // CustomLineChart(),
          const MainHomeScreen(),
          MarketPlaceScreen(),
          const ApprovalManagmentScreen(),
          const EmployeeCenterPage(),
          const Menu(),
        ];
      case userTypeSalesManager:
        return [
          // CustomLineChart(),
          const MainHomeScreen(),
          MarketPlaceScreen(),
          const ApprovalManagmentScreen(),
          const EmployeeCenterPage(),
          const Menu(),
        ];
      case userTypeAccountingManager:
        return [
          // CustomLineChart(),
          const MainHomeScreen(),
          MarketPlaceScreen(),
          const ApprovalManagmentScreen(),
          const EmployeeCenterPage(),
          const Menu(),
        ];
      case userTypeHR:
        return [
          // CustomLineChart(),
          const MainHomeScreen(),
          MarketPlaceScreen(),
          const EmployeeCenterPage(),
          const Menu(),
        ];
      default:
        return []; // Handle unexpected user types
    }
  }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.home),
  //       title: ("Home"),
  //       textStyle:
  //           GoogleFonts.ubuntu(fontSize: 10.sp, fontWeight: FontWeight.w600),
  //       activeColorPrimary: Color(0xff49AECD),
  //       inactiveColorPrimary: Colors.black,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.macwindow),
  //       title: ("MarketPlace"),
  //       textStyle:
  //           GoogleFonts.ubuntu(fontSize: 10.sp, fontWeight: FontWeight.w600),
  //       activeColorPrimary: Color(0xff49AECD),
  //       inactiveColorPrimary: Colors.black,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.app_badge_fill),
  //       title: ("Approvals"),
  //       textStyle:
  //           GoogleFonts.ubuntu(fontSize: 10.sp, fontWeight: FontWeight.w600),
  //       activeColorPrimary: Color(0xff49AECD),
  //       inactiveColorPrimary: Colors.black,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.waveform_circle),
  //       title: ("Employee Center"),
  //       textStyle:
  //           GoogleFonts.ubuntu(fontSize: 10.sp, fontWeight: FontWeight.w600),
  //       activeColorPrimary: Color(0xff49AECD),
  //       inactiveColorPrimary: Colors.black,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: const Icon(CupertinoIcons.square_grid_2x2_fill),
  //       title: ("Menu"),
  //       textStyle:
  //           GoogleFonts.ubuntu(fontSize: 10.sp, fontWeight: FontWeight.w600),
  //       activeColorPrimary: Color(0xff49AECD),
  //       inactiveColorPrimary: Colors.black,
  //     ),
  //     // Add more items as needed
  //   ];
  // }

  // List<BottomNavigationBarItem> _bottomNavBarItems() {
  //   return [
  //     const BottomNavigationBarItem(
  //       icon: Icon(CupertinoIcons.home),
  //       label: 'Home',
  //       backgroundColor: Color(0xff49AECD),
  //     ),
  //     const BottomNavigationBarItem(
  //       icon: Icon(CupertinoIcons.macwindow),
  //       label: 'MarketPlace',
  //       backgroundColor: Color(0xff49AECD),
  //     ),
  //     const BottomNavigationBarItem(
  //       icon: Icon(CupertinoIcons.app_badge_fill),
  //       label: 'Approvals',
  //       backgroundColor: Color(0xff49AECD),
  //     ),
  //     const BottomNavigationBarItem(
  //       icon: Icon(CupertinoIcons.waveform_circle),
  //       label: 'Employee Center',
  //       backgroundColor: Color(0xff49AECD),
  //     ),
  //     const BottomNavigationBarItem(
  //       icon: Icon(CupertinoIcons.square_grid_2x2_fill),
  //       label: 'Menu',
  //       backgroundColor: Color(0xff49AECD),
  //     ),
  //   ];
  // }

  List<BottomNavigationBarItem> _bottomNavBarItems(String userType) {
    switch (userType) {
      case userTypeCompany:
        return [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.macwindow),
            label: 'MarketPlace',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.app_badge_fill),
            label: 'Approvals',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.waveform_circle),
            label: 'Employee Center',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2_fill),
            label: 'Menu',
            backgroundColor: Color(0xff49AECD),
          ),
        ];
      case userTypeProjectManager:
        return [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.macwindow),
            label: 'MarketPlace',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.app_badge_fill),
            label: 'Approvals',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.waveform_circle),
            label: 'Employee Center',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2_fill),
            label: 'Menu',
            backgroundColor: Color(0xff49AECD),
          ),
        ];
      case userTypeProcurementManager:
        return [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.macwindow),
            label: 'MarketPlace',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.app_badge_fill),
            label: 'Approvals',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.waveform_circle),
            label: 'Employee Center',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2_fill),
            label: 'Menu',
            backgroundColor: Color(0xff49AECD),
          ),
        ];
      case userTypeServiceManager:
        return [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.macwindow),
            label: 'MarketPlace',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.app_badge_fill),
            label: 'Approvals',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.waveform_circle),
            label: 'Employee Center',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2_fill),
            label: 'Menu',
            backgroundColor: Color(0xff49AECD),
          ),
        ];
      case userTypeSalesManager:
        return [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.macwindow),
            label: 'MarketPlace',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.app_badge_fill),
            label: 'Approvals',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.waveform_circle),
            label: 'Employee Center',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2_fill),
            label: 'Menu',
            backgroundColor: Color(0xff49AECD),
          ),
        ];
      case userTypeAccountingManager:
        return [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.macwindow),
            label: 'MarketPlace',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.app_badge_fill),
            label: 'Approvals',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.waveform_circle),
            label: 'Employee Center',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2_fill),
            label: 'Menu',
            backgroundColor: Color(0xff49AECD),
          ),
        ];
      case userTypeEmployee:
      case userTypeHR:
        return [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.waveform_circle),
            label: 'Employee Center',
            backgroundColor: Color(0xff49AECD),
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2_fill),
            label: 'Menu',
            backgroundColor: Color(0xff49AECD),
          ),
        ];
      default:
        return []; // Handle unexpected user types
    }
  }

  @override
  Widget build(BuildContext context) {
    final person = ref.read(personProvider);
    final state = ref.watch(homeScreenProvider);
    final notifier = ref.watch(homeScreenProvider.notifier);
    print('homescreen');
    print(person!.data!.id);
    print(person!.data!.companyId);
    print(person!.employee!.id);

    // print(person!.data!.company!.companyName);

    return Scaffold(
        body: PageView(
          controller: notifier.pageController,

          children: _buildScreens(person.data!.type!),

          // onPageChanged: notifier.bottomIndexChanged,
          // onPageChanged: (index) {
          //   if (notifier.pageController.page?.round() != index) {
          //     notifier.bottomIndexChanged(
          //         index); // Ensure sync with PageView's current page
          //   }
          // },

          onPageChanged: (index) {
            notifier.pageChanged(
                index); // This will update the state's currentIndex to sync with PageView
          },

          // onPageChanged: (index) {
          //   notifier.bottomIndexChanged(index);
          // },
        ),
        bottomNavigationBar: BottomNavigationBar(
          // currentIndex: state.currentIndex,
          currentIndex: state.currentIndex,
          // onTap: notifier.bottomIndexChanged,
          // onTap: (index) {
          //   if (state.currentIndex != index) {
          //     notifier.bottomIndexChanged(
          //         index); // Sync BottomNavBar tap with the current index
          //   }
          // },
          onTap: (index) {
            notifier.bottomIndexChanged(index);
          },
          // onTap: (index) {
          //   notifer.pageController.animateToPage(index,
          //       duration: Duration(milliseconds: 500), curve: Curves.easeOut);

          //   //state.currentIndex = index;
          //   notifer.bottomIndexChanged(index);
          // },
          items: _bottomNavBarItems(person.data!.type!),

          selectedItemColor: blackColor,
          unselectedItemColor: whiteColor,
          selectedLabelStyle:
              GoogleFonts.ubuntu(fontSize: 10.sp, fontWeight: FontWeight.w600),
          unselectedLabelStyle:
              GoogleFonts.ubuntu(fontSize: 10.sp, fontWeight: FontWeight.w600),
          type: BottomNavigationBarType
              .shifting, // or fixed, depending on your preference
        ));

    // bottomNavigationBar: BottomNavigationBar(
    //   currentIndex: _currentIndex,
    //   onTap: (index) {
    //     _pageController.animateToPage(index,
    //         duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    //   },
    //   items: _bottomNavBarItems(),

    //   // bottomNavigationBar:

    //   //    PersistentTabView(
    //   //     context,
    //   //     controller: _controller,
    //   //     screens: _buildScreens(),
    //   //     items: _navBarsItems(),
    //   //     confineInSafeArea: true,
    //   //     backgroundColor: Colors.white,
    //   //     handleAndroidBackButtonPress: true,
    //   //     resizeToAvoidBottomInset: true,
    //   //     stateManagement: true,
    //   //     hideNavigationBarWhenKeyboardShows: true,
    //   //     decoration: NavBarDecoration(
    //   //       borderRadius: BorderRadius.circular(10.0),
    //   //       colorBehindNavBar: Colors.white,
    //   //     ),
    //   //     popAllScreensOnTapOfSelectedTab: true,
    //   //     popActionScreens: PopActionScreensType.all,
    //   //     itemAnimationProperties: const ItemAnimationProperties(
    //   //       duration: Duration(milliseconds: 100),
    //   //       curve: Curves.ease,
    //   //     ),
    //   //     screenTransitionAnimation: const ScreenTransitionAnimation(
    //   //       animateTabTransition: true,
    //   //       curve: Curves.ease,
    //   //       duration: Duration(milliseconds: 200),
    //   //     ),
    //   //     navBarStyle: NavBarStyle.style6,
    //   //         onItemSelected: (index) {
    //   //     setState(() {
    //   //       _controller.index = index;  // Update the current index on tap
    //   //     });
    //   //   },

    //   //   ),
    // ));
  }
}
