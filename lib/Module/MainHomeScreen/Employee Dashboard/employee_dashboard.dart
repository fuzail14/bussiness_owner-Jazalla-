import 'dart:ui';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/constants.dart';

class EmployeeDashboard extends StatelessWidget {
  const EmployeeDashboard({super.key});

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
        Container(
          //height: 353.h,

          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12).r,
          ),
          padding: const EdgeInsets.only(
                  left: 17.8, top: 15, bottom: 36, right: 17.8)
              .r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                'Events',
                style: GoogleFonts.montserrat(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff202046)),
              )),
              20.ph,
              Text(
                'Events Title',
                style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff262627)),
              ),
              5.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120.w,
                    child: Text(
                      'Wed, Aug 23',
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff828282)),
                    ),
                  ),
                  Text(
                    'To',
                    style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff828282)),
                  ),
                  SizedBox(
                    width: 120.w,
                    child: Text(
                      'Wed, Aug 27',
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff828282)),
                    ),
                  )
                ],
              ),
              12.ph,
              const Divider(
                color: Color(0xffD6D9DC),
              ),
              12.ph,
              Text(
                'Events Title',
                style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff262627)),
              ),
              5.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120.w,
                    child: Text(
                      'Wed, Aug 23',
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff828282)),
                    ),
                  ),
                  Text(
                    'To',
                    style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff828282)),
                  ),
                  SizedBox(
                    width: 120.w,
                    child: Text(
                      'Wed, Aug 27',
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff828282)),
                    ),
                  )
                ],
              ),
              12.ph,
              const Divider(
                color: Color(0xffD6D9DC),
              ),
            ],
          ),
        ),
        10.ph,
        Text(
          'Announcement List',
          style: GoogleFonts.montserrat(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.bold),
        ),
        10.ph,
        Container(
          height: 38.h,
          padding: EdgeInsets.only(left: 25, top: 10, bottom: 10, right: 24).r,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ).r,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.23),
                offset: const Offset(
                  0.0,
                  10.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 100.w,
                  child: Text(
                    'Title',
                    style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: blackColor),
                  )),
              Text(
                'Start Date',
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff707070)),
              ),
              Text(
                'End Date',
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff707070)),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 25, top: 18, bottom: 9, right: 24).r,
          height: 150,
          decoration: BoxDecoration(
              color: Color(0xffDBDBDB).withOpacity(0.01),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ).r,
              border: Border.fromBorderSide(
                  BorderSide(color: whiteColor, width: 1))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 100.w,
                        child: Text(
                          'Architecto auto',
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff585858)),
                        )),
                    Text(
                      '21,Aug 2022',
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                    Text(
                      '21,Aug 2022',
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                  ],
                ),
                8.3.ph,
                const Divider(
                  color: Color(0xffDBDBDB),
                ),
                5.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 100.w,
                        child: Text(
                          'Architecto auto',
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff585858)),
                        )),
                    Text(
                      '21,Aug 2022',
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                    Text(
                      '21,Aug 2022',
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                  ],
                ),
                8.3.ph,
                const Divider(
                  color: Color(0xffDBDBDB),
                ),
                5.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 100.w,
                        child: Text(
                          'Architecto auto',
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff585858)),
                        )),
                    Text(
                      '21,Aug 2022',
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                    Text(
                      '21,Aug 2022',
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                  ],
                ),
                8.3.ph,
                const Divider(
                  color: Color(0xffDBDBDB),
                ),
                5.ph,
              ],
            ),
          ),
        ),
        20.ph,
        Text(
          'Meeting Schedule',
          style: GoogleFonts.montserrat(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.bold),
        ),
        10.ph,
        Container(
          height: 38.h,
          padding: EdgeInsets.only(left: 25, top: 10, bottom: 10, right: 24).r,
          decoration: BoxDecoration(
            color: whiteColor,
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(12),
            //   topRight: Radius.circular(12),
            // ).r,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: const Offset(
                  0.0,
                  10.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 100.w,
                  child: Text(
                    'Title',
                    style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: blackColor),
                  )),
              Text(
                'Meeting Date',
                style: GoogleFonts.montserrat(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff707070)),
              ),
              Text(
                'Meeting Time',
                style: GoogleFonts.montserrat(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff707070)),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 25, top: 18, bottom: 9, right: 24).r,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ).r,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 100.w,
                        child: Text(
                          'Event Related',
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff585858)),
                        )),
                    Text(
                      '21,Aug 2022',
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                    Text(
                      '04:32',
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                  ],
                ),
                8.3.ph,
                const Divider(
                  color: Color(0xffDBDBDB),
                ),
                5.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 100.w,
                        child: Text(
                          'New Technology',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff585858)),
                        )),
                    Text(
                      '21,Aug 2022',
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                    Text(
                      '21:33',
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                  ],
                ),
                8.3.ph,
                const Divider(
                  color: Color(0xffDBDBDB),
                ),
                5.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 100.w,
                        child: Text(
                          'Meeting: Weekly Team Meeting',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff585858)),
                        )),
                    Text(
                      '21,Aug 2022',
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                    Text(
                      '19:33',
                      style: GoogleFonts.montserrat(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4D4D4D)),
                    ),
                  ],
                ),
                8.3.ph,
                const Divider(
                  color: Color(0xffDBDBDB),
                ),
                5.ph,
              ],
            ),
          ),
        )
      ],
    );
  }
}
