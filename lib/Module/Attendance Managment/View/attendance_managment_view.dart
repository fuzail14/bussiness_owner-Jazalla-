import 'dart:ui';

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
import '../../../Constants/Person/person_controller.dart';
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
              style: GoogleFonts.poppins(
                fontSize: 18,
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
                        onTap: () {},
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
                                    'Emp-2852',
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
                                            color: Color(0xffBA1717),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      : Text(
                                          'Present',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14.sp,
                                            color: Color(0xff22A527),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                        left: 21,
                                        right: 18,
                                        top: 12,
                                        bottom: 10)
                                    .r,
                                margin: EdgeInsets.only(
                                        left: 19,
                                        right: 18,
                                        top: 11,
                                        bottom: 17)
                                    .r,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10).r,
                                    color: Color(0xffF9F9F9)),
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
                                            color: Color(0xff4B4F54),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '10:00 AM',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: Color(0xff4B4F54),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Check Out',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: Color(0xff4B4F54),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '05:00 PM',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: Color(0xff4B4F54),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Late',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: Color(0xff4B4F54),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '30:00 Min',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: Color(0xff4B4F54),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Early Evening',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: Color(0xff4B4F54),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '05:00 AM',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: Color(0xff4B4F54),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
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
