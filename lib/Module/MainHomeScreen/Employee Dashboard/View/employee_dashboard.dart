import 'dart:ui';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Constants/constants.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../../../Event/Notifier/event_notifier.dart';
import '../Notifier/employee_notifier_notifier.dart';

class EmployeeDashboard extends ConsumerWidget {
  const EmployeeDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(employeeDashboardProvider.notifier);
    final state = ref.watch(employeeDashboardProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dashboard',
          style: GoogleFonts.montserrat(
              fontSize: 16, color: blackColor, fontWeight: FontWeight.bold),
        ),
        10.ph,
        //EVENTS
        Consumer(builder: (context, ref, child) {
          final controller = ref.watch(EventProvider.notifier);
          final state = ref.watch(EventProvider);
          return Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12).r,
            ),
            padding: const EdgeInsets.only(
                    left: 17.8, top: 15, bottom: 36, right: 17.8)
                .r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  'Events',
                  style: GoogleFonts.montserrat(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff202046)),
                )),
                // 20.ph,
                if (state.responseStatus == Status.loading)
                  const Loader()
                else if (state.responseStatus == Status.completed) ...[
                  //10.ph,
                  if (state.event.isEmpty) ...[
                    Center(
                      child: Text(
                        'No Events Found.',
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: HexColor('#EB2F2F')),
                      ),
                    )
                  ] else
                    SizedBox(
                      height: 300.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.event.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.event[index].event!.title ?? "",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff262627)),
                                ),
                                5.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 120.w,
                                      child: Text(
                                        state.event[index].event!.startDate ??
                                            "",
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
                                        state.event[index].event!.endDate ?? "",
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
                            );
                          }),
                    ),
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
          );
        }),
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
          // height: 191.h,
          decoration: BoxDecoration(
              color: Color(0xffDBDBDB).withOpacity(0.01),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ).r,
              border: Border.fromBorderSide(
                  BorderSide(color: whiteColor, width: 1))),
          child: SizedBox(
            height: 191.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (state.responseStatus == Status.loading)
                    const Loader()
                  else if (state.responseStatus == Status.completed) ...[
                    //10.ph,
                    if (state.employeeannouncments.isEmpty) ...[
                      Center(
                        child: Text(
                          'No Announcements Found.',
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: HexColor('#EB2F2F')),
                        ),
                      )
                    ] else
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.employeeannouncments.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          state.employeeannouncments[index]
                                                  .announcments.title ??
                                              "",
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff585858)),
                                        )),
                                    Text(
                                      state.employeeannouncments[index]
                                              .announcments.startDate ??
                                          "",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff4D4D4D)),
                                    ),
                                    Text(
                                      state.employeeannouncments[index]
                                              .announcments.endDate ??
                                          "",
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
                              ],
                            );
                          }),
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
          child: SizedBox(
            height: 191.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (state.responseStatus == Status.loading)
                    const Loader()
                  else if (state.responseStatus == Status.completed) ...[
                    //10.ph,
                    if (state.employeemeetings.isEmpty) ...[
                      Center(
                        child: Text(
                          'No Meetings Found.',
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: HexColor('#EB2F2F')),
                        ),
                      )
                    ] else
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.employeemeetings.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          state.employeemeetings[index].meetings
                                                  .title ??
                                              "",
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff585858)),
                                        )),
                                    SizedBox(
                                      width: 70.w,
                                      child: Text(
                                        state.employeemeetings[index].meetings
                                                .date ??
                                            "",
                                        maxLines: 1,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff4D4D4D)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                      child: Text(
                                        state.employeemeetings[index].meetings
                                                .time ??
                                            "",
                                        maxLines: 1,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff4D4D4D)),
                                      ),
                                    ),
                                  ],
                                ),
                                8.3.ph,
                                const Divider(
                                  color: Color(0xffDBDBDB),
                                ),
                              ],
                            );
                          }),
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
            ),
          ),
        )
      ],
    );
  }
}
