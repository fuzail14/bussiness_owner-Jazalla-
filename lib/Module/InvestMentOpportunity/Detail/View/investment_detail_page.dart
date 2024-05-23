import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../../../../Widgets/StarRating/star_rating.dart';
import '../Controller/investment_detail_controller.dart';

class InvestmentDetailPage extends ConsumerWidget {
  const InvestmentDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(investmentPageProvider);
    return Scaffold(
      appBar: MyAppBar(
        title: "Detail",
        bellOnTap: () {
          GoRouter.of(context).pushNamed(notificationsScreen);
        },
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            20.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //30.pw,
                Container(
                  width: 120.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: HexColor('#1F3996'),
                    borderRadius: BorderRadius.circular(16).r,
                  ),
                  child: Center(
                    child: Text(
                      'Respond',
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                          color: HexColor('#FFFFFF')),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: state.investmentDetail.length,
              shrinkWrap: true,
              itemBuilder: (context, outerIndex) {
                var investment = state.investmentDetail[outerIndex];
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 31, top: 29, right: 31).r,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          investment.title.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: HexColor('5A5A5A')),
                        ),
                        5.ph,
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            StarRating(
                              color: HexColor('#FBC02D'),
                              rating: 3.5,
                            ),
                            Text("4.9 (531 reviews)",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#B8B8B8'))),
                          ],
                        ),
                        10.ph,
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text('Company Name',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#B8B8B8'))),
                            Text(investment.company!.companyName.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#B8B8B8')))
                          ],
                        ),
                        20.ph,
                        Text(investment.company!.companyName.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        6.ph,
                        Container(
                          width: 362.w,
                          //height: 242.h,
                          padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 18, bottom: 17)
                              .r,
                          decoration: BoxDecoration(
                              border: Border.all(color: detailCradBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xfffbfffd)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: AutoSizeText('Contact Person Name',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textScaleFactor: 1.2,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff414141))),
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                        investment.company!.contactPersonName
                                            .toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textScaleFactor: 1.2,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff414141))),
                                  ),
                                ],
                              ),
                              10.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: AutoSizeText('Contact No',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textScaleFactor: 1.2,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff414141))),
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                        investment.company!.mobileNo.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textScaleFactor: 1.2,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff414141))),
                                  ),
                                ],
                              ),
                              10.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: AutoSizeText('Email',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textScaleFactor: 1.2,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff414141))),
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                        investment.company!.email.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textScaleFactor: 1.2,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff414141))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        20.ph,
                        Text("Business Overview",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        6.ph,
                        Container(
                          width: 362.w,
                          //height: 242.h,
                          padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 18, bottom: 17)
                              .r,
                          decoration: BoxDecoration(
                              border: Border.all(color: detailCradBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xfffbfffd)),
                          child: AutoSizeText(
                              investment.businessOverview.toString(),
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff414141))),
                        ),
                        20.ph,
                        Text("Facilities Overview",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        6.ph,
                        Container(
                          width: 362.w,
                          //height: 242.h,
                          padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 18, bottom: 17)
                              .r,
                          decoration: BoxDecoration(
                              border: Border.all(color: detailCradBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xfffbfffd)),
                          child: AutoSizeText(
                              investment.facilitiesOverview.toString(),
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff414141))),
                        ),
                        20.ph,
                        Text("Product & Service Overview",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        6.ph,
                        Container(
                          width: 362.w,
                          //height: 242.h,
                          padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 18, bottom: 17)
                              .r,
                          decoration: BoxDecoration(
                              border: Border.all(color: detailCradBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xfffbfffd)),
                          child: AutoSizeText(
                              investment.prodnservOverview.toString(),
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff414141))),
                        ),
                        20.ph,
                        Text("Reason For Sale",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        6.ph,
                        Container(
                          width: 362.w,
                          //height: 242.h,
                          padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 18, bottom: 17)
                              .r,
                          decoration: BoxDecoration(
                              border: Border.all(color: detailCradBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xfffbfffd)),
                          child: AutoSizeText(
                              investment.reasonforsale.toString(),
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff414141))),
                        ),
                        20.ph,
                        Text(
                            "List all the tangible and intangible assets the buyer would get",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        6.ph,
                        Container(
                          width: 362.w,
                          //height: 242.h,
                          padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 18, bottom: 17)
                              .r,
                          decoration: BoxDecoration(
                              border: Border.all(color: detailCradBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xfffbfffd)),
                          child: AutoSizeText(investment.assets.toString(),
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff414141))),
                        ),
                      ]),
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

      // ),
    );
  }
}
