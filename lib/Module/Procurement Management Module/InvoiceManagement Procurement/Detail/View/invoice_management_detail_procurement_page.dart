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
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../../Constants/Font/fonts.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Routes/set_routes.dart';
import '../../../../../Widgets/Loader/loader.dart';

import '../Notifier/invoice_management_detail_procurement_notifier.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

class InvoiceManagementDetailProcurementPage extends ConsumerWidget {
  const InvoiceManagementDetailProcurementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.watch(invoiceManagementDetailProcurementProvider.notifier);
    final state = ref.watch(invoiceManagementDetailProcurementProvider);
    return Scaffold(
      appBar: MyAppBar(
        title: "Invoice Management",
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
                child: ListView(
                    //itemCount: state.invoice.length,
                    shrinkWrap: true,
                    children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Invoice Details',
                          style: FontManagment()
                              .montserrat18HeadingEmployeeCenterAllModules),
                      20.ph,
                      Container(
                        width: 363.w,
                        padding: const EdgeInsets.only(
                                bottom: 17, left: 11, right: 11, top: 17)
                            .r,
                        margin: const EdgeInsets.only(
                                bottom: 60, left: 26, right: 25)
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
                            //INVOICE BASIC DETAIL
                            Container(
                              padding: const EdgeInsets.only(
                                left: 16,
                              ).r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4).r,
                                  border: Border.all(color: Color(0xffB7C9E2)),
                                  color: whiteColor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Invoice ',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff131315)),
                                      ),
                                      7.ph,
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          state.invoice!.refNumber ?? "",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff131315)),
                                        ),
                                      ),
                                      13.ph,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Issue Date',
                                                maxLines: 1,
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff131315)),
                                              ),
                                              7.ph,
                                              SizedBox(
                                                width: 80.w,
                                                child: Text(
                                                  state.invoice!.issueDate
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff131315)),
                                                ),
                                              )
                                            ],
                                          ),
                                          10.pw,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Due Date',
                                                maxLines: 1,
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff131315)),
                                              ),
                                              7.ph,
                                              SizedBox(
                                                width: 80.w,
                                                child: Text(
                                                  state.invoice!.dueDate
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff131315)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  20.pw,
                                  Container(
                                    height: 127.h,
                                    width: 1,
                                    color: Color(0xffB7C9E2),
                                  ),
                                  10.pw,
                                  QrImageView(
                                    data: 'This is a simple QR code',
                                    version: QrVersions.auto,
                                    size: 78.h,
                                    gapless: false,
                                  )
                                ],
                              ),
                            ),
                            8.ph,

                            //Buyer Company DETAIL
                            Container(
                              width: double.infinity,
                              padding:
                                  EdgeInsets.only(left: 14, top: 18, bottom: 18)
                                      .r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4).r,
                                  border: Border.all(color: Color(0xffB7C9E2)),
                                  color: whiteColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Billed to',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff131315)),
                                  ),
                                  7.ph,
                                  Text(
                                    state.invoice!.company!.companyName
                                        .toString(),
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff46454A)),
                                  ),
                                  5.ph,
                                  Text(
                                    'Address :Saudi Arabia, ${state.invoice!.company!.address!.address.toString()}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff46454A)),
                                  ),
                                  5.ph,
                                  Text(
                                    'Contact : ${state.invoice!.company!.mobileNo.toString()}',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff46454A)),
                                  ),
                                ],
                              ),
                            ),
                            15.ph,

                            //Supplier Company DETAIL
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                      left: 14, top: 18, bottom: 18, right: 25)
                                  .r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4).r,
                                  border: Border.all(color: Color(0xffB7C9E2)),
                                  color: whiteColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shipped To',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff131315)),
                                  ),
                                  7.ph,
                                  Text(
                                    state.invoice!.vendor!.companyName
                                        .toString(),
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff46454A)),
                                  ),
                                  5.ph,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Contact : ${state.invoice!.vendor!.mobileNo.toString()}',
                                        maxLines: 2,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff46454A)),
                                      ),
                                      Text(
                                        'Paid',
                                        maxLines: 2,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff22A527)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            15.ph,

                            Container(
                              padding: EdgeInsets.only(bottom: 12).r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7).r,
                                  border: Border.all(color: Color(0xffB7C9E2))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff326DAE),
                                      borderRadius: BorderRadius.circular(7).r,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 12)
                                          .r,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Product',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: whiteColor),
                                          ),
                                          Text(
                                            'QTY',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: whiteColor),
                                          ),
                                          Text(
                                            'Rate',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: whiteColor),
                                          ),
                                          Text(
                                            'Discount',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: whiteColor),
                                          ),
                                          Text(
                                            'Tax',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: whiteColor),
                                          ),
                                          Text(
                                            'Price',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: whiteColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  11.ph,
                                  if (state
                                      .invoice!.purchase!.items.isEmpty) ...[
                                    Center(
                                      child: Text(
                                        'No Products Found.',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: HexColor('#EB2F2F')),
                                      ),
                                    ),
                                  ] else
                                    SizedBox(
                                      height: 100.h,
                                      child: ListView.builder(
                                          itemCount: state
                                              .invoice!.purchase!.items.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                          vertical: 5)
                                                      .r,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 40.w,
                                                    child: Text(
                                                      state
                                                          .invoice!
                                                          .purchase!
                                                          .items[index]
                                                          .product2
                                                          .name
                                                          .toString(),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff46454A)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 40.w,
                                                    child: Text(
                                                      state.invoice!.purchase!
                                                          .items[index].quantity
                                                          .toString(),
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff46454A)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 40.w,
                                                    child: Text(
                                                      '\$${state.invoice!.purchase!.items[index].price.toString()}',
                                                      maxLines: 2,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff46454A)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 40.w,
                                                    child: Text(
                                                      '\$${state.invoice!.purchase!.items[index].discount.toString()}',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff46454A)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 40.w,
                                                    child: Text(
                                                      '${state.invoice!.purchase!.items[index].price.toString()}%',
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color(
                                                                  0xff46454A)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 40.w,
                                                    child: Text(
                                                      '\$${state.invoice!.purchase!.items[index].price.toString()}',
                                                      maxLines: 2,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff46454A)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),

                                  // 19.ph,
                                  const Divider(color: Color(0xffB7C9E2)),
                                  9.5.ph,
                                  //Total
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      width: 184.w,
                                      // height: 99.h,
                                      padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 9)
                                          .r,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4).r,
                                          border: Border.all(
                                              color: Color(0xffEBEDF2)),
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
                                                    fontWeight:
                                                        FontWeight.w700),
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
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                                'Discount',
                                                style: GoogleFonts.inter(
                                                    fontSize: 10,
                                                    color: Color(0xff1A1C21),
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                child: Text(
                                                  '\$95000.00',
                                                  maxLines: 1,
                                                  textAlign: TextAlign.right,
                                                  style: GoogleFonts.inter(
                                                      fontSize: 10,
                                                      color: Color(0xff5E6470),
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                                'Tax',
                                                style: GoogleFonts.inter(
                                                    fontSize: 10,
                                                    color: Color(0xff1A1C21),
                                                    fontWeight:
                                                        FontWeight.w700),
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
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                                'Total',
                                                style: GoogleFonts.inter(
                                                    fontSize: 10,
                                                    color: Color(0xff1A1C21),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                child: Text(
                                                  '\$20000.00',
                                                  textAlign: TextAlign.right,
                                                  maxLines: 1,
                                                  style: GoogleFonts.inter(
                                                      fontSize: 10,
                                                      color: Color(0xff1A1C21),
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                'Paid',
                                                style: GoogleFonts.inter(
                                                    fontSize: 10,
                                                    color: Color(0xff1A1C21),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                child: Text(
                                                  '\$1252000.00',
                                                  textAlign: TextAlign.right,
                                                  maxLines: 1,
                                                  style: GoogleFonts.inter(
                                                      fontSize: 10,
                                                      color: Color(0xff1A1C21),
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                'Credit Note',
                                                style: GoogleFonts.inter(
                                                    fontSize: 10,
                                                    color: Color(0xff1A1C21),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                child: Text(
                                                  '\$0.00',
                                                  textAlign: TextAlign.right,
                                                  maxLines: 1,
                                                  style: GoogleFonts.inter(
                                                      fontSize: 10,
                                                      color: Color(0xff1A1C21),
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                'Due',
                                                style: GoogleFonts.inter(
                                                    fontSize: 10,
                                                    color: Color(0xff1A1C21),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                child: Text(
                                                  '\$0.00',
                                                  textAlign: TextAlign.right,
                                                  maxLines: 1,
                                                  style: GoogleFonts.inter(
                                                      fontSize: 10,
                                                      color: Color(0xff1A1C21),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            15.ph,
                            Row(
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
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ]))
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
            pw.Text('Invoice Details',
                style:
                    pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Container(
              width: 363,
              padding: const pw.EdgeInsets.only(
                  bottom: 17, left: 11, right: 11, top: 17),
              margin: const pw.EdgeInsets.only(bottom: 60, left: 26, right: 25),
              decoration: pw.BoxDecoration(
                color: PdfColors.white,
                borderRadius: pw.BorderRadius.circular(10),
                // boxShadow: [
                //   pw.BoxShadow(
                //     color: PdfColors.grey,
                //     offset: const pw.Offset(
                //       1.0,
                //       3.0,
                //     ),
                //     blurRadius: 10.0,
                //     spreadRadius: 1.0,
                //   ),
                // ],
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Container(
                    padding: pw.EdgeInsets.only(
                        left: 16, top: 10, right: 10, bottom: 10),
                    decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(4),
                        border: pw.Border.all(color: PdfColors.grey),
                        color: PdfColors.white),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Invoice ',
                          maxLines: 1,
                          style: pw.TextStyle(
                            fontSize: 12.sp,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 7),
                        pw.SizedBox(
                          width: 100.w,
                          child: pw.Text(
                            '#AB55555-01',
                            maxLines: 1,
                            style: pw.TextStyle(
                              fontSize: 12.sp,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                        pw.SizedBox(height: 13),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'Issue Date',
                              maxLines: 1,
                              style: pw.TextStyle(
                                fontSize: 12.sp,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.SizedBox(height: 7),
                            pw.SizedBox(
                              width: 80.w,
                              child: pw.Text(
                                '02-10-2024',
                                maxLines: 1,
                                style: pw.TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        pw.SizedBox(width: 7),
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'Due Date',
                              maxLines: 1,
                              style: pw.TextStyle(
                                fontSize: 12.sp,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.SizedBox(height: 7),
                            pw.SizedBox(
                              width: 80.w,
                              child: pw.Text(
                                '02-10-2024',
                                maxLines: 1,
                                style: pw.TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Container(
                    width: double.infinity,
                    padding: pw.EdgeInsets.only(left: 14, top: 18, bottom: 18),
                    decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(4),
                        border: pw.Border.all(color: PdfColors.grey),
                        color: PdfColors.white),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Billed to',
                          style: pw.TextStyle(
                            fontSize: 12.sp,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 7),
                        pw.Text(
                          'Company Name',
                          style: pw.TextStyle(
                            fontSize: 13.sp,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          'Address :Saudi Arabia, Khobar, Eastern Province',
                          maxLines: 2,
                          style: pw.TextStyle(
                            fontSize: 12.sp,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          'Contact : 05584726739',
                          style: pw.TextStyle(
                            fontSize: 12.sp,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 15),
                  pw.Container(
                    width: double.infinity,
                    padding: pw.EdgeInsets.only(
                        left: 14, top: 18, bottom: 18, right: 25),
                    decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(4),
                        border: pw.Border.all(color: PdfColors.grey),
                        color: PdfColors.white),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Shipped To',
                          style: pw.TextStyle(
                            fontSize: 12.sp,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 7),
                        pw.Text(
                          'Fuzail',
                          style: pw.TextStyle(
                            fontSize: 12.sp,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                              'Contact : 05584726739',
                              maxLines: 2,
                              style: pw.TextStyle(
                                fontSize: 12.sp,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Text(
                              'Paid',
                              maxLines: 2,
                              style: pw.TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: pw.FontWeight.bold,
                                  color: PdfColors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 15),
                  pw.Container(
                    padding: pw.EdgeInsets.only(bottom: 12),
                    decoration: pw.BoxDecoration(
                        borderRadius: pw.BorderRadius.circular(7),
                        border: pw.Border.all(color: PdfColors.grey)),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                          decoration: pw.BoxDecoration(
                            color: PdfColors.blue500,
                            borderRadius: pw.BorderRadius.circular(7),
                          ),
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            child: pw.Row(
                              mainAxisAlignment:
                                  pw.MainAxisAlignment.spaceBetween,
                              children: [
                                pw.Text(
                                  'Product',
                                  style: pw.TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                                pw.Text(
                                  'QTY',
                                  style: pw.TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                                pw.Text(
                                  'Rate',
                                  style: pw.TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                                pw.Text(
                                  'Discount',
                                  style: pw.TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                                pw.Text(
                                  'Tax',
                                  style: pw.TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                                pw.Text(
                                  'Price',
                                  style: pw.TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: pw.FontWeight.bold,
                                      color: PdfColors.white),
                                ),
                              ],
                            ),
                          ),
                        ),

                        pw.SizedBox(height: 11),
                        pw.Padding(
                          padding:
                              const pw.EdgeInsets.symmetric(horizontal: 10),
                          child: pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(
                                width: 40.w,
                                child: pw.Text(
                                  'Engine Fan',
                                  maxLines: 2,
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 40.w,
                                child: pw.Text(
                                  '150KG',
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 40.w,
                                child: pw.Text(
                                  '\$1,000.00',
                                  maxLines: 2,
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 40.w,
                                child: pw.Text(
                                  '\$950.0',
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 40.w,
                                child: pw.Text(
                                  '15%',
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 40.w,
                                child: pw.Text(
                                  '\$175000.00',
                                  maxLines: 2,
                                  style: pw.TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 19.ph,
                        pw.Divider(color: PdfColors.grey100),

                        pw.SizedBox(height: 9.5),
                        pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Container(
                            width: 184.w,
                            // height: 99.h,
                            padding: pw.EdgeInsets.symmetric(
                                horizontal: 10, vertical: 9),
                            decoration: pw.BoxDecoration(
                                borderRadius: pw.BorderRadius.circular(4),
                                border: pw.Border.all(color: PdfColors.white),
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
                                      'Discount',
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.SizedBox(
                                      width: 100.w,
                                      child: pw.Text(
                                        '\$95000.00',
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
                                      'Tax',
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
                                      'Total',
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.SizedBox(
                                      width: 100.w,
                                      child: pw.Text(
                                        '\$20000.00',
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
                                      'Paid',
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.SizedBox(
                                      width: 100.w,
                                      child: pw.Text(
                                        '\$1252000.00',
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
                                      'Credit Note',
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.SizedBox(
                                      width: 100.w,
                                      child: pw.Text(
                                        '\$0.00',
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
                                      'Due',
                                      style: pw.TextStyle(
                                          fontSize: 10,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.SizedBox(
                                      width: 100.w,
                                      child: pw.Text(
                                        '\$0.00',
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
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 15),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'Employee Signature :',
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold),
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
                  )
                ],
              ),
            ),
          ]),
        ],
      ),
    );

    // Save the document
    try {
      if (Platform.isAndroid) {
        final String dir = (await getApplicationDocumentsDirectory()).path;

        final String path = '$dir/invoicepayable.pdf';
        final File file = File(path);
        await file.writeAsBytes(await pdf.save());
        myToast(msg: 'PDF saved in Documents!');

        await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save(),
        );
      }
      final String dir = (await getApplicationDocumentsDirectory()).path;
      final String path = '$dir/invoicepayable.pdf';
      final File file = File(path);
      await file.writeAsBytes(await pdf.save());
      await Printing.sharePdf(
          bytes: await pdf.save(), filename: 'invoicepayable.pdf');
    } catch (e) {
      print("Error saving document: $e");
    }
  }
}
