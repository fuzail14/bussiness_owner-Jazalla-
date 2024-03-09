import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../Constants/api_routes.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../Controller/rfx_managment_rfi_detail_controller.dart';

class RFXManagmentRFIDetailPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(rFXManagmentRFIDetailProvider.notifier);
    final state = ref.watch(rFXManagmentRFIDetailProvider);
    return Scaffold(
      appBar: MyAppBar(
        title: "RFI Detail",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          26.ph,
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            20.ph,
            Expanded(
                child: ListView.builder(
              itemCount: state.rfxManagmentRFIDetail.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RFI DETAILS',
                        style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff414141)),
                      ),
                      20.ph,
                      Container(
                        // height: 360,

                        padding: const EdgeInsets.only(bottom: 20).r,

                        decoration: BoxDecoration(
                          color: Color(0xff707070).withOpacity(0.08),
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 17)
                                  .r,
                              child: AutoSizeText(
                                'RFI-${state.rfxManagmentRFIDetail[index].title.toString()}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000)),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(12).r,
                                  border: Border.all(color: Color(0xffE1E3E8))),
                              padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 12)
                                  .r,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        'Type',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff777777)),
                                      ),
                                      10.pw,
                                      Flexible(
                                        child: AutoSizeText(
                                          state.rfxManagmentRFIDetail[index]
                                              .requestType
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff3A3A3A)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  10.ph,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        'Status',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff777777)),
                                      ),
                                      10.pw,
                                      Flexible(
                                        child: AutoSizeText(
                                          state.rfxManagmentRFIDetail[index]
                                              .status
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff3A3A3A)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  10.ph,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        'Issue Date',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff777777)),
                                      ),
                                      10.pw,
                                      Flexible(
                                        child: AutoSizeText(
                                          state.rfxManagmentRFIDetail[index]
                                              .startDate
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff3A3A3A)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 17)
                                  .r,
                              child: AutoSizeText(
                                'RFI-Description',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000)),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(12).r,
                                  border: Border.all(color: Color(0xffE1E3E8))),
                              padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 12)
                                  .r,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    state.rfxManagmentRFIDetail[index].details
                                        .toString(),
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff3A3A3A)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
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
}

Widget _generalInfoTileRow(icon, firstText, SecondText) {
  return Row(
    children: [
      Icon(
        icon,
        size: 12.h,
        color: HexColor('#19A3A3'),
      ),
      16.pw,
      Text.rich(TextSpan(
          text: firstText,
          style: GoogleFonts.ubuntu(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: HexColor('#757A8E')),
          children: <InlineSpan>[
            TextSpan(
              text: SecondText,
              style: GoogleFonts.ubuntu(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: HexColor('#0D0B0C')),
            )
          ])),
    ],
  );
}

Widget _generalInfoCard(firstText, SecondText) {
  return Container(
    width: 130.w,
    height: 56.h,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey,
        offset: Offset(0.5, 0.5),
        blurRadius: 1.0,
      ),
    ], borderRadius: BorderRadius.circular(6), color: Colors.white),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SvgPicture.asset(
            'assets/images/bc_detailpage_giCard.svg', // Replace with your asset path
            width: 130.w,
            fit: BoxFit.fitWidth,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 23.065.w,
                height: 22.h,
                margin: EdgeInsets.only(left: 10.48, top: 10).r,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [HexColor('19A3A3'), HexColor('132F75')])),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/person_icon.svg',
                    fit: BoxFit.contain,
                    height: 12.h,
                    width: 12.58.w,
                  ),
                )),
            6.29.pw,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  firstText,
                  style: GoogleFonts.inter(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: HexColor('#6B6363')),
                ),
                5.ph,
                Text(
                  SecondText,
                  style: GoogleFonts.inter(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: HexColor('#413B3B')),
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}

// Custom list item widget
Widget customListItem(String leadingText, String trailingText, int index) {
  return Container(
    //width: 100,
    height: 39.h,
    padding: EdgeInsets.only(top: 12, left: 16, right: 20).r,
    margin: EdgeInsets.only(left: 1, top: 12).r,
    color: index % 2 == 0 ? Color(0xFFF9F9F9) : Color(0xFFFFFFFF),
    //color: Colors.amber,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 186.w,
          //color: Colors.amber,
          child: AutoSizeText(
            leadingText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.quicksand(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: HexColor('#4E4949')),
          ),
        ),
        Text(
          trailingText,
          style: GoogleFonts.quicksand(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: HexColor('#292525')),
        ),
      ],
    ),
  );
}
