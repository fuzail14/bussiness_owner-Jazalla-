import 'dart:ui';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../../../../Widgets/AppBar/my_app_bar.dart';
import '../../../../Widgets/HomeAppBar/home_app_bar.dart';
import '../../History/View/approval_managment_screen.dart';
import '../Controller/approval_managment_controller.dart';

// ignore: must_be_immutable
class ApprovalManagmentScreen extends ConsumerStatefulWidget {
  @override
  _ApprovalManagmentScreenState createState() =>
      _ApprovalManagmentScreenState();
}

class _ApprovalManagmentScreenState
    extends ConsumerState<ApprovalManagmentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    //print('build check  ${buildcheck++}');
    final controller = ref.watch(ApprovalManagmentProvider.notifier);
    final state = ref.watch(ApprovalManagmentProvider);
    // final salesManagmentRFPcontroller =
    //     ref.watch(SalesManagmentRFIProvider.notifier);
    // final salesManagmentRFPstate = ref.watch(SalesManagmentRFIProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(
          showFilter: false,
          showBackButton: false,
          title: (state.selectedIndex == 0)
              ? "Approval Control"
              : "Approval History"),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 23.w, right: 23.w, top: 15).w,
            //  padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 4).w,
            // width: 362.w,

            height: 40.h,
            decoration: ShapeDecoration(
                color: Color(0xffF9F9F9),
                // shape: Border(
                //   right: BorderSide(
                //     width: 1,
                //     color: Colors.grey.withOpacity(0.5),
                //   ),
                //   left: BorderSide(
                //     width: 1,
                //     color: Colors.grey.withOpacity(0.5),
                //   ),
                //   bottom:
                //       BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
                //   top: BorderSide(
                //     width: 1,
                //     color: Colors.grey.withOpacity(0.5),
                //   ),
                // ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1.5.w,
                    color: Color.fromRGBO(97, 97, 97, 0.1),
                  ),
                  borderRadius: BorderRadius.circular(14.r),
                )),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tabButton(
                  title: 'Approval Control',
                  index: 0,
                  isSelected: state.selectedIndex == 0,
                  controller: controller,
                ),
                _tabButton(
                  title: 'Approval History',
                  index: 1,
                  isSelected: state.selectedIndex == 1,
                  controller: controller,
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: state.selectedIndex,
              children: [
                ApprovalControlScreen(),
                ApprovalHistoryScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _tabButton({
  required String title,
  required int index,
  required bool isSelected,
  required ApprovalManagmentController controller,
}) {
  return GestureDetector(
    onTap: () => controller.setTabBarStatus(index),
    child: AnimatedContainer(
      width: 150.w,
      duration: const Duration(milliseconds: 00),
      margin: EdgeInsets.symmetric(
        vertical: 4,
      ).r,
      decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12).r,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Color.fromRGBO(191, 113, 15, 0.2),
                    offset: const Offset(
                      1.0,
                      15.0,
                    ),
                    blurRadius: 25.0,
                    spreadRadius: 2.5,
                  ),
                ]
              : []),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.ibmPlexSans(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: isSelected ? blackColor : const Color(0xff213F99),
          ),
        ),
      ),
    ),
  );
}

class ApprovalControlScreen extends ConsumerWidget {
  int buildcheck = 0;

  ApprovalControlScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ApprovalManagmentProvider.notifier);
    final state = ref.watch(ApprovalManagmentProvider);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    print('build check  ${buildcheck++}');

    return Scaffold(
      // appBar: MyAppBar(
      //   showBell: false,
      //   showFilter: false,
      //   title: "Approval Control",
      //   // filterOnPressed: () {
      //   //   _scaffoldKey.currentState?.openEndDrawer();
      //   // }
      // ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            10.ph,
            if (state.request4Information.isEmpty) ...[
              Center(
                child: Text(
                  'No Requests Found.',
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#EB2F2F')),
                ),
              ),
            ] else
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.request4Information.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  CustomDialog());
                        },
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,

                          margin: const EdgeInsets.only(
                                  bottom: 15, left: 28, right: 28, top: 10)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 28, right: 28, bottom: 15, top: 13)
                              .r,

                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(20).r,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                offset: const Offset(
                                  1.0,
                                  3.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      '1',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff000000)),
                                    ),
                                  ),
                                  //40.pw,
                                  Flexible(
                                    child: Text(
                                      'Proposal Approval',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff707070)),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              11.ph,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      'Khobar Company (A0053)',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: FontManagment().poppins12,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      'Pending Approval',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: FontManagment().ubuntu10red,
                                    ),
                                  ),
                                ],
                              ),
                              11.ph,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 150.w,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'INITIATED BY: ',
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffA5AAB7)),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' FUZAIL',
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff606470)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 14.h,
                                        color: Color(0xffA7A7A7),
                                      ),
                                      6.pw,
                                      SizedBox(
                                        width: 75.w,
                                        child: Text(
                                          '21,August,2022',
                                          maxLines: 1,
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff4D4D4D)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
          ] else
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "No Data Found",
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: HexColor('#EB2F2F')),
              ),
            ),
        ],
      ),

      // ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0, right: 0.0),
      width: 320.w,
      height: 403.h,
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 403.h,
              padding: EdgeInsets.only(
                top: 18.0,
              ),
              margin: EdgeInsets.only(
                top: 50.0,
                right: 8.0,
              ).r,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 30).r,
                    child: Row(
                      children: [
                        Text(
                          'Approval Control',
                          style: FontManagment().inter16,
                        ),
                        25.pw,
                        InkWell(
                          child: Container(
                            width: 78.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              color: Color(0xff1F3996).withOpacity(0.11),
                              borderRadius: BorderRadius.circular(5).r,
                            ),
                            child: Center(
                              child: Text(
                                "Detail",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff2955A3),
                                    fontSize: 12.sp),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  25.ph,
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(color: Color(0xffF5F5F5))),
                                  child: SvgPicture.asset(
                                    'assets/images/dialog_tick.svg',
                                  ),
                                ),
                                7.pw,
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 50.w,
                                      child: Text(
                                        '20 Sept',
                                        maxLines: 1,
                                        style: FontManagment().poppins10,
                                      ),
                                    ),
                                    SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          '5:00 pm',
                                          maxLines: 1,
                                          style: FontManagment().poppins8,
                                        )),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                                height: 43.h,
                                child: VerticalDivider(
                                  color: Color(0xffD9D9D9),
                                )),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/dialog_tick.svg',
                                  height: 20.h,
                                  width: 20.w,
                                ),
                                7.pw,
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 50.w,
                                      child: Text(
                                        '20 Sept',
                                        maxLines: 1,
                                        style: FontManagment().poppins10,
                                      ),
                                    ),
                                    SizedBox(
                                        width: 50.w,
                                        child: Text('5:00 pm',
                                            style: FontManagment().poppins8)),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                                height: 43.h,
                                child: VerticalDivider(
                                  color: Color(0xffD9D9D9),
                                )),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/dialog_tick.svg',
                                  height: 20.h,
                                  width: 20.w,
                                ),
                                7.pw,
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 50.w,
                                      child: Text(
                                        'Pending',
                                        maxLines: 1,
                                        style: FontManagment().poppins8,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      31.pw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/images/user1.png'),
                              7.pw,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      'Abu Muhammad',
                                      maxLines: 1,
                                      style: FontManagment().poppins10,
                                    ),
                                  ),
                                  4.ph,
                                  SizedBox(
                                      width: 75.w,
                                      child: Text(
                                        'Buyer Staff',
                                        maxLines: 1,
                                        style: FontManagment().poppins9,
                                      )),
                                  SizedBox(
                                      width: 75.w,
                                      child: Text(
                                        'Request Initiated',
                                        maxLines: 1,
                                        style: FontManagment().poppins8,
                                      )),
                                ],
                              )
                            ],
                          ),
                          25.ph,
                          Row(
                            children: [
                              Image.asset('assets/images/user2.png'),
                              7.pw,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      'Fuzail Fuzail',
                                      maxLines: 1,
                                      style: FontManagment().poppins10,
                                    ),
                                  ),
                                  4.ph,
                                  SizedBox(
                                      width: 75.w,
                                      child: Text(
                                        'Buyer Manager',
                                        maxLines: 1,
                                        style: FontManagment().poppins9,
                                      )),
                                  SizedBox(
                                      width: 75.w,
                                      child: Text(
                                        'Pending Approval',
                                        maxLines: 1,
                                        style: FontManagment().poppins8,
                                      )),
                                ],
                              )
                            ],
                          ),
                          25.ph,
                          Row(
                            children: [
                              Image.asset('assets/images/user3.png'),
                              7.pw,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      'Ahmed Ahmed',
                                      maxLines: 1,
                                      style: FontManagment().poppins10,
                                    ),
                                  ),
                                  4.ph,
                                  SizedBox(
                                      width: 75.w,
                                      child: Text(
                                        'Administrator',
                                        maxLines: 1,
                                        style: FontManagment().poppins9,
                                      )),
                                  SizedBox(
                                      width: 100.w,
                                      child: Text(
                                        'Pending 1st Approval',
                                        maxLines: 1,
                                        style: FontManagment().poppins8,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  36.ph,
                  Padding(
                    padding: const EdgeInsets.only(left: 52).r,
                    child: Row(
                      children: [
                        InkWell(
                          child: Container(
                            width: 90.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              color: Color(0xffC2EECC).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5).r,
                            ),
                            child: Center(
                              child: Text(
                                "Accept",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff03781D),
                                    fontSize: 12.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        15.pw,
                        InkWell(
                          child: Container(
                            width: 90.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              color: Color(0xffFEE1E1),
                              borderRadius: BorderRadius.circular(5).r,
                            ),
                            child: Center(
                              child: Text(
                                "Reject",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffBA1717),
                                    fontSize: 12.sp),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
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
                    'assets/images/dialog_avatar.svg',
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
