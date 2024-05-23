import 'dart:io';
import 'dart:ui';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pdf/pdf.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../../../../Constants/Font/fonts.dart';
import '../../../../Routes/set_routes.dart';
import '../Notifier/salary_payslip_detail_notifier.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

class SalaryPaySlipDetailPage extends ConsumerWidget {
  const SalaryPaySlipDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(salaryPaySlipDetailProvider.notifier);
    final state = ref.watch(salaryPaySlipDetailProvider);
    return Scaffold(
      appBar: MyAppBar(
        title: "Employee Center",
        bellOnTap: () {
          GoRouter.of(context).pushNamed(notificationsScreen);
        },
      ),
      backgroundColor: whiteColor,
      body: Column(
        children: [
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            25.ph,
            Expanded(
                child: ListView.builder(
              itemCount: state.salaryPaySlipDetail.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Payslip Details',
                        style: FontManagment()
                            .montserrat18HeadingEmployeeCenterAllModules),
                    20.ph,
                    Container(
                      width: 363.w,
                      padding: const EdgeInsets.only(
                              bottom: 22, left: 11, right: 11, top: 17)
                          .r,
                      margin:
                          const EdgeInsets.only(bottom: 60, left: 26, right: 25)
                              .r,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10).r,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12)
                                .r,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4).r,
                                border: Border.all(color: Color(0xffEBEDF2)),
                                color: Color(0xffF9F9FA)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Invoice ',
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff1A1C21)),
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      child: Text(
                                        '#AB55555-01',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff5E6470)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Date ',
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff1A1C21)),
                                    ),
                                    SizedBox(
                                      width: 70.w,
                                      child: Text(
                                        '02-10-2024',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff5E6470)),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          8.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // width: 162.2,
                                // height: 104.h,
                                padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12)
                                    .r,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xffEBEDF2)),
                                    borderRadius: BorderRadius.circular(4).r,
                                    color: Color(0xffF9F9FA)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'To',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff1A1C21)),
                                    ),
                                    6.ph,
                                    Text(
                                      'Fuzail Fuzail',
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff5E6470)),
                                    ),
                                    Text(
                                      'EMP#12345567899',
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff5E6470)),
                                    ),
                                    Text(
                                      'General Labour',
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff5E6470)),
                                    ),
                                    Text(
                                      'Salary Paid',
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff5E6470)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 162.2,
                                // height: 104.h,
                                padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12)
                                    .r,

                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xffEBEDF2)),
                                    borderRadius: BorderRadius.circular(4).r,
                                    color: Color(0xffF9F9FA)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff1A1C21)),
                                    ),
                                    6.ph,
                                    Text(
                                      'Jazalla Jazalla',
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff5E6470)),
                                    ),
                                    Text(
                                      'Business address',
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff5E6470)),
                                    ),
                                    Text(
                                      'City, State, IN - 000 000',
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff5E6470)),
                                    ),
                                    Text(
                                      'Lorem ispim lorem ispum',
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff5E6470)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          15.ph,
                          Text(
                            'Earning Details',
                            style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff0A2540)),
                          ),
                          5.ph,
                          Container(
                            // padding: EdgeInsets.symmetric(
                            //         horizontal: 10, vertical: 12)
                            //     .r,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3).r,
                                border: Border.all(color: Color(0xffDFE4EA))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12)
                                      .r,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Description',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff0A2540)),
                                      ),
                                      Text(
                                        'Title',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff0A2540)),
                                      ),
                                      Text(
                                        'Type',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff0A2540)),
                                      ),
                                      Text(
                                        'Amount',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff0A2540)),
                                      ),
                                    ],
                                  ),
                                ),
                                // 19.ph,
                                Divider(
                                  color: Color(0xffDFE4EA),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12)
                                      .r,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 70.w,
                                        child: Text(
                                          'Basic Salary',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          'some title',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                        child: Text(
                                          '%',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          '\$2,000.00',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Divider(
                                  color: Color(0xffDFE4EA),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12)
                                      .r,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 70.w,
                                        child: Text(
                                          'Allowance',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          'Health Allowance',
                                          maxLines: 2,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                        child: Text(
                                          '%',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          '\$2,000.00',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Divider(
                                  color: Color(0xffDFE4EA),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12)
                                      .r,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 70.w,
                                        child: Text(
                                          'Overtime',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          'Increase Workable',
                                          maxLines: 2,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                        child: Text(
                                          '%',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          '\$2,000.00',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          15.ph,
                          Text(
                            'Deduction Details',
                            style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff0A2540)),
                          ),
                          5.ph,
                          Container(
                            // padding: EdgeInsets.symmetric(
                            //         horizontal: 10, vertical: 12)
                            //     .r,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3).r,
                                border: Border.all(color: Color(0xffDFE4EA))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12)
                                      .r,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Description',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff0A2540)),
                                      ),
                                      Text(
                                        'Title',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff0A2540)),
                                      ),
                                      Text(
                                        'Type',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff0A2540)),
                                      ),
                                      Text(
                                        'Amount',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xff0A2540)),
                                      ),
                                    ],
                                  ),
                                ),
                                // 19.ph,
                                Divider(
                                  color: Color(0xffDFE4EA),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12)
                                      .r,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 70.w,
                                        child: Text(
                                          'Loan',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          'Emergency Loan',
                                          maxLines: 2,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                        child: Text(
                                          '%',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          '\$2,000.00',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Divider(
                                  color: Color(0xffDFE4EA),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 12)
                                      .r,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 70.w,
                                        child: Text(
                                          'Deduction',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          'Taxes',
                                          maxLines: 2,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                        child: Text(
                                          '%',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                        child: Text(
                                          '\$2,000.00',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff0A2540)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          15.ph,
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 184.w,
                              // height: 99.h,
                              padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 9)
                                  .r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4).r,
                                  border: Border.all(color: Color(0xffEBEDF2)),
                                  color: Color(0xffF9F9FA)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Subtotal',
                                        style: GoogleFonts.inter(
                                            fontSize: 10,
                                            color: Color(0xff1A1C21),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          '\$2000.00',
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                          style: GoogleFonts.inter(
                                              fontSize: 10,
                                              color: Color(0xff5E6470),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                  8.ph,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tax (0%)',
                                        style: GoogleFonts.inter(
                                            fontSize: 10,
                                            color: Color(0xff1A1C21),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          '\$0.00',
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                          style: GoogleFonts.inter(
                                              fontSize: 10,
                                              color: Color(0xff5E6470),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                  8.ph,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Deduction',
                                        style: GoogleFonts.inter(
                                            fontSize: 10,
                                            color: Color(0xff1A1C21),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        width: 70.w,
                                        child: Text(
                                          '\$2000.00',
                                          textAlign: TextAlign.right,
                                          maxLines: 1,
                                          style: GoogleFonts.inter(
                                              fontSize: 10,
                                              color: Color(0xff1A1C21),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                  8.ph,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Net Salary',
                                        style: GoogleFonts.inter(
                                            fontSize: 10,
                                            color: Color(0xff1A1C21),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'US \$2000.00',
                                          textAlign: TextAlign.right,
                                          maxLines: 1,
                                          style: GoogleFonts.inter(
                                              fontSize: 10,
                                              color: Color(0xff1A1C21),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          15.ph,
                          Divider(
                            color: Color(0xffDFE4EA),
                          ),
                          5.ph,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Employee Signature :',
                                      style: GoogleFonts.montserrat(
                                          fontSize: 10,
                                          color: Color(0xff1A1C21),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Paid By : ',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10,
                                              color: Color(0xff1A1C21),
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          width: 150.w,
                                          child: Text(
                                            'Muhammad (HR Manager)',
                                            maxLines: 1,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                color: Color(0xff1A1C21),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap:
                                      createPDF, // Call the createPDF function when the button is tapped
                                  child: SvgPicture.asset(
                                      'assets/images/download_button.svg'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ))
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
  }

  Future<void> createPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) => [
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text('Payslip Details',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Container(
              decoration: pw.BoxDecoration(
                color: PdfColors.white,
                borderRadius: pw.BorderRadius.all(pw.Radius.circular(10)),
                boxShadow: [
                  pw.BoxShadow(
                    color: PdfColors.grey300,
                    //offset: pw.Offset(1.0, 3.0),
                    blurRadius: 10,
                  )
                ],
              ),
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      padding: pw.EdgeInsets.all(16),
                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(color: PdfColors.grey300),
                        borderRadius:
                            pw.BorderRadius.all(pw.Radius.circular(4)),
                        color: PdfColors.grey200,
                      ),
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('Invoice #AB55555-01',
                                style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text('Date: 02-10-2024',
                                style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold)),
                          ]),
                    ),
                    // pw.SizedBox(height: 8),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Container(
                          width: 162.2,
                          // height: 104.h,
                          padding: pw.EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.grey300),
                              borderRadius: pw.BorderRadius.circular(4),
                              color: PdfColors.white),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                'To',
                                style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.SizedBox(height: 6),
                              pw.Text(
                                'Fuzail Fuzail',
                                maxLines: 1,
                                style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                'EMP#12345567899',
                                maxLines: 1,
                                style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                'General Labour',
                                maxLines: 1,
                                style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                'Salary Paid',
                                maxLines: 1,
                                style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        pw.Container(
                          width: 162.2,
                          // height: 104.h,
                          padding: pw.EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),

                          decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.grey300),
                              borderRadius: pw.BorderRadius.circular(4),
                              color: PdfColors.white),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                'From',
                                style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.SizedBox(height: 6),
                              pw.Text(
                                'Jazalla Jazalla',
                                maxLines: 1,
                                style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                'Business address',
                                maxLines: 1,
                                style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                'City, State, IN - 000 000',
                                maxLines: 1,
                                style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                'Lorem ispim lorem ispum',
                                maxLines: 1,
                                style: pw.TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 15),
                    pw.Text(
                      'Earning Details',
                      style: pw.TextStyle(
                        fontSize: 12.sp,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      // padding: EdgeInsets.symmetric(
                      //         horizontal: 10, vertical: 12)
                      //     .r,
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(3),
                          border: pw.Border.all(color: PdfColors.grey300)),

                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Padding(
                            padding: pw.EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text(
                                  'Description',
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.Text(
                                  'Title',
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.Text(
                                  'Type',
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.Text(
                                  'Amount',
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // 19.ph,
                          pw.Divider(
                            color: PdfColors.grey100,
                          ),

                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.SizedBox(
                                  width: 70.w,
                                  child: pw.Text(
                                    'Basic Salary',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 50.w,
                                  child: pw.Text(
                                    'some title',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 20.w,
                                  child: pw.Text(
                                    '%',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 50.w,
                                  child: pw.Text(
                                    '\$2,000.00',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          pw.Divider(
                            color: PdfColors.grey100,
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.SizedBox(
                                  width: 70.w,
                                  child: pw.Text(
                                    'Allowance',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 50.w,
                                  child: pw.Text(
                                    'Health Allowance',
                                    maxLines: 2,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 20.w,
                                  child: pw.Text(
                                    '%',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 50.w,
                                  child: pw.Text(
                                    '\$2,000.00',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          pw.Divider(
                            color: PdfColors.grey100,
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.SizedBox(
                                  width: 70.w,
                                  child: pw.Text(
                                    'Overtime',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 50.w,
                                  child: pw.Text(
                                    'Increase Workable',
                                    maxLines: 2,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 20.w,
                                  child: pw.Text(
                                    '%',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 50.w,
                                  child: pw.Text('\$2,000.00',
                                      maxLines: 1,
                                      style: pw.TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: pw.FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 15),
                    pw.Text(
                      'Deduction Details',
                      style: pw.TextStyle(
                        fontSize: 12.sp,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      // padding: EdgeInsets.symmetric(
                      //         horizontal: 10, vertical: 12)
                      //     .r,
                      decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(3),
                          border: pw.Border.all(color: PdfColors.grey300)),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text(
                                  'Description',
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.Text(
                                  'Title',
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.Text(
                                  'Type',
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.Text(
                                  'Amount',
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // 19.ph,
                          pw.Divider(
                            color: PdfColors.grey100,
                          ),

                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.SizedBox(
                                  width: 70.w,
                                  child: pw.Text(
                                    'Loan',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 50.w,
                                  child: pw.Text(
                                    'Emergency Loan',
                                    maxLines: 2,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 20.w,
                                  child: pw.Text(
                                    '%',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 50.w,
                                  child: pw.Text(
                                    '\$2,000.00',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          pw.Divider(
                            color: PdfColors.grey100,
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.SizedBox(
                                  width: 70.w,
                                  child: pw.Text(
                                    'Deduction',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 50.w,
                                  child: pw.Text(
                                    'Taxes',
                                    maxLines: 2,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 20.w,
                                  child: pw.Text(
                                    '%',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                                pw.SizedBox(
                                  width: 50.w,
                                  child: pw.Text(
                                    '\$2,000.00',
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 15),
                    pw.Align(
                      alignment: pw.Alignment.centerRight,
                      child: pw.Container(
                        width: 184.w,
                        // height: 99.h,
                        padding: pw.EdgeInsets.symmetric(
                            horizontal: 10, vertical: 9),
                        decoration: pw.BoxDecoration(
                            borderRadius: pw.BorderRadius.circular(4),
                            border: pw.Border.all(color: PdfColors.grey500),
                            color: PdfColors.white),
                        child: pw.Column(
                          children: [
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text(
                                  'Subtotal',
                                  style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.SizedBox(
                                  width: 100.w,
                                  child: pw.Text(
                                    '\$2000.00',
                                    maxLines: 1,
                                    textAlign: pw.TextAlign.right,
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            pw.SizedBox(height: 8),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text(
                                  'Tax (0%)',
                                  style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.SizedBox(
                                  width: 100.w,
                                  child: pw.Text(
                                    '\$0.00',
                                    maxLines: 1,
                                    textAlign: pw.TextAlign.right,
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            pw.SizedBox(height: 8),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text(
                                  'Total Deduction',
                                  style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.SizedBox(
                                  width: 70.w,
                                  child: pw.Text(
                                    '\$2000.00',
                                    textAlign: pw.TextAlign.right,
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            pw.SizedBox(height: 8),
                            pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text(
                                  'Net Salary',
                                  style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.SizedBox(
                                  width: 100.w,
                                  child: pw.Text(
                                    'US \$2000.00',
                                    textAlign: pw.TextAlign.right,
                                    maxLines: 1,
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // pw.SizedBox(
                    //   height: 15,
                    // ),
                    // pw.SizedBox(
                    //   height: 5,
                    // ),
                    pw.Divider(
                      color: PdfColors.grey100,
                    ),
                    // pw.SizedBox(
                    //   height: 5,
                    // ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                'Employee Signature :',
                                style: pw.TextStyle(
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.Row(
                                children: [
                                  pw.Text(
                                    'Paid By : ',
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                  pw.SizedBox(
                                    width: 150.w,
                                    child: pw.Text(
                                      'Muhammad (HR Manager)',
                                      maxLines: 1,
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ]),
        ],
      ),
    );

    // Save the document
    try {
      if (Platform.isAndroid) {
        final String dir = (await getApplicationDocumentsDirectory()).path;

        final String path = '$dir/payslip.pdf';
        final File file = File(path);
        await file.writeAsBytes(await pdf.save());
        myToast(msg: 'PDF saved in Documents!');

        await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save(),
        );
      }
      final String dir = (await getApplicationDocumentsDirectory()).path;
      final String path = '$dir/payslip.pdf';
      final File file = File(path);
      await file.writeAsBytes(await pdf.save());
      await Printing.sharePdf(bytes: await pdf.save(), filename: 'payslip.pdf');
    } catch (e) {
      print("Error saving document: $e");
    }
  }
}
