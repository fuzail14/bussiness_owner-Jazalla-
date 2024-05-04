import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Person/person_controller.dart';
import 'package:bussines_owner/Constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Widgets/AppBar/my_app_bar.dart';

import '../Model/leave_type.dart';
import '../Notifier/leave_create_notifier.dart';

// ignore: must_be_immutable
class LeaveCreateScreen extends ConsumerWidget {
  int buildcheck = 0;

  LeaveCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(leaveCreateProvider.notifier);
    final state = ref.watch(leaveCreateProvider);
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showFilter: false,
        title: "Employee Center",
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Form(
          key: controller.key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                ).r,
                child: Center(
                  child: Text(
                    'Leave Center',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: blackColor,
                    ),
                  ),
                ),
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.only(left: 23).r,
                child: Text('Employee',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff343434),
                    )),
              ),
              15.ph,
              Container(
                // height: 429.h,
                padding: const EdgeInsets.only(
                        top: 13, left: 33, right: 29, bottom: 30)
                    .r,
                margin: const EdgeInsets.only(
                  left: 23,
                  right: 33,
                ).r,

                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(7).r,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 12.0,
                      spreadRadius: 2.5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Leave Type',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff131925),
                        )),
                    5.ph,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Color(0xffE4E4E4)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            offset: Offset(1.0, 1.0),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<int>(
                          isExpanded: true,
                          value: state.leaveTypeId,
                          style: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          icon: Icon(Icons.arrow_drop_down,
                              color: Color(0xffBEBEC2)),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            border: InputBorder.none,
                          ),
                          items: state.leavetype.map<DropdownMenuItem<int>>(
                              (Allleavetypes leavetype) {
                            return DropdownMenuItem<int>(
                              value: leavetype.id,
                              child: Text(leavetype.title,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff131925),
                                  )),
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            print(newValue);
                            controller.updateLeaveTypeValue(newValue!);
                          },
                        ),
                      ),
                    ),
                    15.ph,
                    Text('Leave Start Date',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff131925),
                        )),
                    5.ph,
                    Container(
                      // height: 32.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(6).r,
                        border: Border.all(
                          color: const Color(0xffE4E4E4).withOpacity(0.5),
                        ),
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
                      child: TextField(
                        //readOnly: true, // Remove this line
                        controller: controller.startDateController,
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff131925),
                        ),
                        cursorHeight: 16,
                        onTap: () {
                          controller.StartDate(context);
                        },
                        decoration: InputDecoration(
                          hintText: 'dd-mm-yyyy',
                          fillColor: whiteColor,
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff131925),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffE4E4E4),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffE4E4E4),
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: const Color(0xff969799),
                            size: 20.h,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                    ),
                    15.ph,
                    Text('Leave End Date',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff131925),
                        )),
                    5.ph,
                    Container(
                      // height: 32.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(6).r,
                        border: Border.all(
                          color: const Color(0xffE4E4E4).withOpacity(0.5),
                        ),
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
                      child: TextField(
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff131925),
                        ),
                        //readOnly: true, // Remove this line
                        controller: controller.endDateController,
                        cursorHeight: 16,
                        onTap: () {
                          controller.endDate(context);
                        },
                        decoration: InputDecoration(
                          hintText: 'dd-mm-yyyy',
                          fillColor: whiteColor,
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff131925),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffE4E4E4),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffE4E4E4),
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: const Color(0xff969799),
                            size: 20.h,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.only(left: 23).r,
                child: Text('Leave Reason',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff343434),
                    )),
              ),
              15.ph,
              Container(
                height: 100.h,
                padding: const EdgeInsets.only(
                        top: 12, left: 19, right: 16, bottom: 0)
                    .r,
                margin: const EdgeInsets.only(
                  left: 23,
                  right: 33,
                ).r,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(7).r,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 12.0,
                      spreadRadius: 2.5,
                    ),
                  ],
                ),
                child: TextField(
                  controller: controller.leaveReasonController,
                  maxLines: 2,
                  decoration: InputDecoration(
                      hintText: 'Leave Response',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              15.ph,
              Padding(
                padding: const EdgeInsets.only(left: 23).r,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('EX..',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff4D4D4D),
                        )),
                    5.pw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 24.h,
                          width: 261.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4).r,
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xff2E63A9), Color(0xff5EAACA)],
                            ),
                          ),
                          child: Center(
                            child: Container(
                              height: 23.h,
                              width: 260.w,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(4).r,
                              ),
                              child: Center(
                                child: Text(
                                  'I have a severe cold and need time to recover',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w300,
                                      color: const Color(0xff4D4D4D)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        5.ph,
                        Row(
                          children: [
                            Container(
                              height: 24.h,
                              width: 72.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4).r,
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff2E63A9),
                                    Color(0xff5EAACA)
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  height: 23.h,
                                  width: 71.w,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(4).r,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Sick leave',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w300,
                                          color: const Color(0xff4D4D4D)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            10.pw,
                            Container(
                              height: 24.h,
                              width: 179.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4).r,
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff2E63A9),
                                    Color(0xff5EAACA)
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  height: 23.h,
                                  width: 178.w,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(4).r,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'I have a medical appointment',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w300,
                                          color: const Color(0xff4D4D4D)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              99.ph,
              InkWell(
                onTap: () {
                  //print('current date ${controller.appliedOn.toString()}');
                  if (controller.key.currentState!.validate()) {
                    ref.read(leaveCreateProvider.notifier).sendLeaveRequestApi(
                        companyId: controller.person!.data!.companyId,
                        employeeId: controller.person!.data!.id,
                        leaveTypeId: state.leaveTypeId,
                        appliedOn: controller.appliedOn,
                        startDate: controller.startDateController.text,
                        endDate: controller.endDateController.text,
                        leaveReason: controller.leaveReasonController.text,
                        context: context);
                  }
                },
                child: Container(
                  height: 45.h,
                  width: 334.w,
                  margin: const EdgeInsets.symmetric(horizontal: 40).r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).r,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff2E63A9), Color(0xff5EAACA)],
                    ),
                  ),
                  child: Center(
                      child: Text(
                    'Send',
                    style: GoogleFonts.montserrat(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  )),
                ),
              ),
              40.ph,
            ],
          ),
        ),
      ),

      // ),
    );
  }
}
