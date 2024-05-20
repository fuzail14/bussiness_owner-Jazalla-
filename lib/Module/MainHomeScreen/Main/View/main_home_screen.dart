import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:app_settings/app_settings.dart';
import 'package:badges/badges.dart' as badges;
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Constants/api_routes.dart';
import 'package:bussines_owner/Module/MainHomeScreen/Project%20Manager%20Dashboard/project_manager_dashboard.dart';
import 'package:bussines_owner/Module/MainHomeScreen/Service%20Manager%20Dashboard/service_manager_dashboard.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../Accounting Manager Dashboard/accounting_manager_dashboard.dart';
import '../../Administrator Dashboard/administrator_dashboard.dart';
import '../../Employee Dashboard/View/employee_dashboard.dart';
import '../Notifier/main_home_screen_notifier.dart';
import '../../Procurement Manager Dashboard/procurement_manager_dashboard.dart';
import '../../Sales Manager Dashboard/sales_manager_dashboard.dart';
import '../State/main_home_screen_state.dart';

class ApprovalScreenArgs {
  final Person person;
  final bool showBackButton;

  ApprovalScreenArgs({required this.person, this.showBackButton = false});
}

class MainHomeScreen extends ConsumerStatefulWidget {
  const MainHomeScreen({super.key});

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mainHomeScreenProvider);
    final notifier = ref.watch(mainHomeScreenProvider.notifier);
    final person = ref.read(personProvider);
    print('logo');
    print(person!.data!.company!.logo);
    print(person!.data!.company!.logoPath);
    print('-----------------');
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
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
                        // Container(
                        //   height: 48.h,
                        //   width: 48.w,
                        //   decoration: BoxDecoration(
                        //       border:
                        //           Border.all(color: const Color(0xff4EBBD3)),
                        //       color: const Color(0xffF5F9F9),
                        //       shape: BoxShape.circle),
                        //   margin: const EdgeInsets.only(top: 0, left: 0).r,
                        //   child: SvgPicture.asset(
                        //     'assets/images/default_company_logo.svg',
                        //     fit: BoxFit.contain,
                        //   ),
                        // ),
                        SizedBox(
                          // width: double.infinity,
                          //height: 200.h,
                          child: Wrap(
                            children: [
                              //if (person.data!.company!.logo != null) ...[
                              Container(
                                height: 48.h,
                                width: 48.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xff4EBBD3)),
                                    color: const Color(0xffF5F9F9),
                                    shape: BoxShape.circle),
                                child: (person.data!.company!.logo != null)
                                    ? CachedNetworkImage(
                                        imageUrl: Api.originalImageBaseUrl +
                                            person.data!.company!.logoPath
                                                .toString() +
                                            person.data!.company!.logo
                                                .toString(),
                                        fit: BoxFit.fill,
                                      )
                                    : Container(
                                        height: 48.h,
                                        width: 48.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xff4EBBD3)),
                                            color: const Color(0xffF5F9F9),
                                            shape: BoxShape.circle),
                                        child: SvgPicture.asset(
                                          'assets/images/default_company_logo.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                              ),
                              //]
                              // else
                              // Container(
                              //   height: 48.h,
                              //   width: 48.w,
                              //   decoration: BoxDecoration(
                              //       border: Border.all(
                              //           color: const Color(0xff4EBBD3)),
                              //       color: const Color(0xffF5F9F9),
                              //       shape: BoxShape.circle),
                              //   child: SvgPicture.asset(
                              //     'assets/images/default_company_logo.svg',
                              //     fit: BoxFit.contain,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        10.pw,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              person!.data!.company!.companyName.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w800,
                                  color: whiteColor),
                            ),
                            //5.ph,
                            SizedBox(
                              width: 150.w,
                              child: Text(
                                "Hi,${"${person!.data!.firstName} ${person!.data!.lastName}"}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: whiteColor),
                              ),
                            ),
                            Text(
                              person!.data!.type.toString(),
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
                                color: const Color(0xffFFFFFF))),
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
                const Divider(),

                10.ph,
                SizedBox(
                  // height: 400,
                  width: 427.w,
                  height: 210.h,
                  child: PageView.builder(
                      controller: notifier.pageController,
                      pageSnapping: true,
                      physics: const AlwaysScrollableScrollPhysics(),
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
                                                onTap: () async {
                                                  if (notifier.glassCardList[
                                                              index]
                                                          ['widget_title1'] ==
                                                      'Check In') {
                                                    Location location =
                                                        Location();

                                                    // Check if location services are enabled
                                                    bool _serviceEnabled =
                                                        await location
                                                            .serviceEnabled();
                                                    if (!_serviceEnabled) {
                                                      _serviceEnabled =
                                                          await location
                                                              .requestService();
                                                      if (!_serviceEnabled) {
                                                        // Show a message to the user that location services need to be enabled
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                              content: Text(
                                                                  'Please enable location services')),
                                                        );
                                                        return;
                                                      }
                                                    }

                                                    // Check if location permissions are granted
                                                    PermissionStatus
                                                        _permissionGranted =
                                                        await location
                                                            .hasPermission();
                                                    if (_permissionGranted ==
                                                            PermissionStatus
                                                                .denied ||
                                                        _permissionGranted ==
                                                            PermissionStatus
                                                                .deniedForever) {
                                                      _permissionGranted =
                                                          await location
                                                              .requestPermission();
                                                      if (_permissionGranted !=
                                                          PermissionStatus
                                                              .granted) {
                                                        // Show a message to the user and redirect to settings
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                'Location permissions are required. Please enable them in settings.'),
                                                            action:
                                                                SnackBarAction(
                                                              label: 'Settings',
                                                              onPressed: () {
                                                                AppSettings
                                                                    .openAppSettings();
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                    }

                                                    // Re-check permissions after returning from settings
                                                    _permissionGranted =
                                                        await location
                                                            .hasPermission();
                                                    if (_permissionGranted ==
                                                            PermissionStatus
                                                                .granted ||
                                                        _permissionGranted ==
                                                            PermissionStatus
                                                                .grantedLimited) {
                                                      try {
                                                        print(
                                                            'Getting location...');
                                                        LocationData
                                                            _locationData =
                                                            await location
                                                                .getLocation();
                                                        print(
                                                            'Latitude: ${_locationData.latitude}, Longitude: ${_locationData.longitude}');

                                                        // Store coordinates in a variable (if needed)
                                                        double latitude =
                                                            _locationData
                                                                .latitude!;
                                                        double longitude =
                                                            _locationData
                                                                .longitude!;

                                                        // Proceed to show the dialog
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              CheckInDialog(
                                                            title: 'Check In',
                                                            svgPath:
                                                                'assets/images/check_in_dialog_icon.svg',
                                                            onTap: () {
                                                              notifier
                                                                  .sendClockInApi(
                                                                companyId: person!
                                                                    .data!
                                                                    .companyId,
                                                                employeeId: person
                                                                    .data!
                                                                    .employee!
                                                                    .id,
                                                                date: notifier
                                                                    .formattedDate,
                                                                clockInTime: notifier
                                                                    .formattedTime
                                                                    .toString(),
                                                                late: notifier
                                                                    .lateTime,
                                                                latitude:
                                                                    latitude,
                                                                longitude:
                                                                    longitude,
                                                                context:
                                                                    context,
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      } catch (e) {
                                                        print(
                                                            'Error getting location: $e');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                              content: Text(
                                                                  'Failed to get location. Please try again.')),
                                                        );
                                                      }
                                                    } else {
                                                      // Show a message if permissions are still not granted
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                            content: Text(
                                                                'Location permissions are required.')),
                                                      );
                                                    }
                                                  }
                                                }

                                                // onTap: () {
                                                //   if (notifier.glassCardList[
                                                //               index]
                                                //           ['widget_title1'] ==
                                                //       'Check In') {
                                                //     // notifier.lateTime = notifier
                                                //     //     .calculateLateTime(
                                                //     //         notifier
                                                //     //             .formattedTime!,
                                                //     //         state.companytime!);
                                                //     // print(
                                                //     //     'Late Time: ${notifier.lateTime}');
                                                //     // print(
                                                //     //     'company id: ${notifier.person!.data!.companyId}');
                                                //     showDialog(
                                                //         context: context,
                                                //         builder: (BuildContext
                                                //                 context) =>
                                                //             CheckInDialog(
                                                //               title: 'Check In',
                                                //               svgPath:
                                                //                   'assets/images/check_in_dialog_icon.svg',
                                                //               onTap: () {
                                                //                 notifier.sendClockInApi(
                                                //                     companyId: person!
                                                //                         .data!
                                                //                         .companyId,
                                                //                     employeeId: person
                                                //                         .data!
                                                //                         .employee!
                                                //                         .id,
                                                //                     date: notifier
                                                //                         .formattedDate,
                                                //                     clockInTime:
                                                //                         notifier
                                                //                             .formattedTime
                                                //                             .toString(),
                                                //                     late: notifier
                                                //                         .lateTime,
                                                //                     context:
                                                //                         context);
                                                //               },
                                                //             ));
                                                //   }
                                                // },
                                                ,
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
                                                              onTap: () {
                                                                notifier.sendClockOutApi(
                                                                    employeeId: person
                                                                        .data!
                                                                        .employee!
                                                                        .id,
                                                                    date: notifier
                                                                        .formattedDate,
                                                                    clockOut: notifier
                                                                        .formattedTime
                                                                        .toString(),
                                                                    context:
                                                                        context);
                                                              },
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
            margin: const EdgeInsets.only(top: 400, bottom: 25).r,
            padding: const EdgeInsets.only(left: 24, right: 24).r,
            decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30).r,
                    topRight: const Radius.circular(30).r)),
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
                      mainAxisAlignment: (person!.data!.type == 'company')
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.spaceAround,
                      children: [
                        if (person!.data!.type == 'company') ...[
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  GoRouter.of(context).pushNamed(
                                    approvalManagmentScreen,
                                    extra: ApprovalScreenArgs(
                                        person: person!, showBackButton: true),
                                  );
                                },
                                child: badges.Badge(
                                  badgeContent: Text('3',
                                      style: GoogleFonts.roboto(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xffFFFFFF))),
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
                              7.ph,
                              Text(
                                'Approval',
                                style: FontManagment().montserrat16,
                              ),
                            ],
                          ),
                        ],
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
                      border: Border.all(color: const Color(0xff2D60A8)),
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

                // Text(
                //   'Dashboard',
                //   style: GoogleFonts.montserrat(
                //       fontSize: 16,
                //       color: blackColor,
                //       fontWeight: FontWeight.bold),
                // ),
                if (person!.data!.type == 'company') ...[
                  const AdministratorDashboard(),
                ] else if (person!.data!.type == 'employee') ...[
                  const EmployeeDashboard()
                ] else if (person!.data!.type == 'project manager') ...[
                  const ProjectManagerDashboard()
                ] else if (person!.data!.type == 'buyer') ...[
                  const ProcurementManagerDashboard()
                ] else if (person!.data!.type == 'service manager') ...[
                  const ServiceManagerDashboard()
                ] else if (person!.data!.type == 'sales manager') ...[
                  const SalesManagerDashboard()
                ] else if (person!.data!.type == 'accounting manager') ...[
                  const AccountingManagerDashboard()
                ]
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
        margin: const EdgeInsets.symmetric(horizontal: 5),
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
  DateTime dateTime = DateTime.now();

  void Function()? onTap;
  CheckInDialog(
      {super.key, required this.title, required this.svgPath, this.onTap});
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, MMMM d yyyy').format(dateTime);
    String formattedTime = DateFormat('h:mm a').format(dateTime);

    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(left: 0.0, right: 0.0),
          width: 320.w,
          height: 403.h,
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  // height: 403.h,
                  padding:
                      const EdgeInsets.only(top: 18.0, right: 0, bottom: 50).r,
                  margin:
                      const EdgeInsets.only(top: 50.0, right: 8.0, bottom: 0).r,

                  decoration: BoxDecoration(
                      color: whiteColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const <BoxShadow>[
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
                              color: const Color(0xff5F5656),
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
                              color: const Color(0xffAFAFAF),
                              size: 18.h,
                            ),
                            10.pw,
                            SizedBox(
                              width: 220.w,
                              child: Text(
                                formattedDate,
                                style: GoogleFonts.montserrat(
                                    color: const Color(0xff383333),
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
                              color: const Color(0xffAFAFAF),
                              size: 18.h,
                            ),
                            10.pw,
                            Text(
                              formattedTime,
                              style: GoogleFonts.montserrat(
                                  color: const Color(0xff383333),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      31.ph,
                      InkWell(
                        onTap: onTap,
                        child: Container(
                          height: 30.h,
                          width: 147.w,
                          margin: const EdgeInsets.symmetric(horizontal: 75).r,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16).r,
                              gradient: const LinearGradient(colors: [
                                Color(0xff2751A1),
                                Color(0xff4BB3CF)
                              ])),
                          child: Center(
                            child: Text(
                              'Confirm',
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
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            Color(0xff4DB8D1),
                            Color(0xff203D98),
                          ])),
                      child: FadeInDown(
                        child: CircleAvatar(
                          radius: 61.8.h /
                              2, // This sets the radius of the CircleAvatar.
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(svgPath),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
