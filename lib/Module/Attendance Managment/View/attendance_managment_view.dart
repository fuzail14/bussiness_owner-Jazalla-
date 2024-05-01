import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../../../Widgets/AppBar/my_app_bar.dart';
import '../Notifier/attendance_managment_notifier.dart';

// ignore: must_be_immutable
class AttendanceManagmentScreen extends ConsumerWidget {
  int buildcheck = 0;

  AttendanceManagmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(attendanceManagmentProvider.notifier);
    final state = ref.watch(attendanceManagmentProvider);
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showFilter: false,
        title: "Employee Center",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25).r,
            child: Text(
              'Attendance Management',
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            10.ph,
            if (state.request4Informatio.isEmpty) ...[
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
                    itemCount: state.request4Informatio.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CheckInDialog(
                                    title: 'Details',
                                    svgPath:
                                        'assets/images/attendance_managment_dialog_icon.svg',
                                  ));
                        },
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,
                          margin: const EdgeInsets.only(
                                  bottom: 20, left: 25, right: 25, top: 10)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 14, right: 18, bottom: 0, top: 15)
                              .r,

                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(10).r,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '10-05-2024 (SUN)',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16.sp,
                                      color: blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  (state.request4Informatio[index]
                                              .requestType ==
                                          'product')
                                      ? Text(
                                          'Absent',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.sp,
                                            color: const Color(0xffBA1717),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      : Text(
                                          'Present',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.sp,
                                            color: const Color(0xff22A527),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                        left: 21,
                                        right: 18,
                                        top: 12,
                                        bottom: 10)
                                    .r,
                                margin: const EdgeInsets.only(
                                        left: 19,
                                        right: 18,
                                        top: 11,
                                        bottom: 17)
                                    .r,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10).r,
                                    color: const Color(0xffF9F9F9)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Check In',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: const Color(0xff4B4F54),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '10:00 AM',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: const Color(0xff4B4F54),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Check Out',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: const Color(0xff4B4F54),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '05:00 PM',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: const Color(0xff4B4F54),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text(
                                    //       'Late',
                                    //       style: GoogleFonts.montserrat(
                                    //         fontSize: 12.sp,
                                    //         color: Color(0xff4B4F54),
                                    //         fontWeight: FontWeight.w600,
                                    //       ),
                                    //     ),
                                    //     Text(
                                    //       '30:00 Min',
                                    //       style: GoogleFonts.montserrat(
                                    //         fontSize: 12.sp,
                                    //         color: Color(0xff4B4F54),
                                    //         fontWeight: FontWeight.w500,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    // // Divider(),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text(
                                    //       'Early Evening',
                                    //       style: GoogleFonts.montserrat(
                                    //         fontSize: 12.sp,
                                    //         color: Color(0xff4B4F54),
                                    //         fontWeight: FontWeight.w600,
                                    //       ),
                                    //     ),
                                    //     Text(
                                    //       '05:00 AM',
                                    //       style: GoogleFonts.montserrat(
                                    //         fontSize: 12.sp,
                                    //         color: Color(0xff4B4F54),
                                    //         fontWeight: FontWeight.w500,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    // Divider(),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text(
                                    //       'Total',
                                    //       style: GoogleFonts.montserrat(
                                    //         fontSize: 12.sp,
                                    //         color: Color(0xff4B4F54),
                                    //         fontWeight: FontWeight.w600,
                                    //       ),
                                    //     ),
                                    //     Text(
                                    //       '08:00h',
                                    //       style: GoogleFonts.montserrat(
                                    //         fontSize: 12.sp,
                                    //         color: Color(0xff4B4F54),
                                    //         fontWeight: FontWeight.w500,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    // Divider(),
                                  ],
                                ),
                              )
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

class CheckInDialog extends StatelessWidget {
  String title;
  String svgPath;
  CheckInDialog({super.key, required this.title, required this.svgPath});
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(left: 0.0, right: 0.0),
          width: 320.w,
          //  height: 403.h,
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  // height: 403.h,
                  padding:
                      const EdgeInsets.only(top: 18.0, right: 0, bottom: 30).r,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: const EdgeInsets.only(left: 23, right: 23).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Emp-2882',
                              style: GoogleFonts.montserrat(
                                  color: blackColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Present',
                              style: GoogleFonts.montserrat(
                                  color: const Color(0xff22A527),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      5.ph,
                      Container(
                        padding: const EdgeInsets.only(
                                left: 23, right: 23, top: 12, bottom: 11)
                            .r,
                        decoration: BoxDecoration(
                            color: const Color(0xffF9F9F9),
                            borderRadius: BorderRadius.circular(8).r),
                        child: Column(
                          children: [
                            attendanceManagmentDialog(
                                title: 'Date', subTitle: '03 April 2023'),
                            const Divider(),
                            6.ph,
                            attendanceManagmentDialog(
                                title: 'Check In ', subTitle: '08:00 AM'),
                            const Divider(),
                            6.ph,
                            attendanceManagmentDialog(
                                title: 'Check Out ', subTitle: '05:00 AM'),
                            const Divider(),
                            6.ph,
                            attendanceManagmentDialog(
                                title: 'Late', subTitle: '30 Min'),
                            const Divider(),
                            6.ph,
                            attendanceManagmentDialog(
                                title: 'Early Leaving', subTitle: '00:00:00'),
                            const Divider(),
                            6.ph,
                            attendanceManagmentDialog(
                                title: 'Overtime', subTitle: '00:00:00'),
                            const Divider(),
                            6.ph,
                            attendanceManagmentDialog(
                                title: 'Total Hours', subTitle: '12H 45M'),
                            const Divider(),
                            6.ph,
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
                          margin: const EdgeInsets.symmetric(horizontal: 75).r,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16).r,
                              gradient: const LinearGradient(colors: [
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
                      child: SvgPicture.asset(svgPath),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget attendanceManagmentDialog(
    {required String title, required String subTitle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: GoogleFonts.montserrat(
            color: const Color(0xff383333),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
      ),
      Text(
        subTitle,
        style: GoogleFonts.montserrat(
            color: const Color(0xff383333),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
      ),
    ],
  );
}
