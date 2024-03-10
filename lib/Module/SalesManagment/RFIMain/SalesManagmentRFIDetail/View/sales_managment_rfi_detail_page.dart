import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../Controller/sales_managment_rfi_detail_controller.dart';

class SalesManagmentRFIDetailPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(salesManagmentRFIDetailProvider.notifier);
    final state = ref.watch(salesManagmentRFIDetailProvider);
    return Scaffold(
      appBar: MyAppBar(
        showBell: false,
        showFilter: false,
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
              itemCount: state.salesManagmentRFIDetail.length,
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
                                'RFI-${state.salesManagmentRFIDetail[index].title.toString()}',
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
                                          state.salesManagmentRFIDetail[index]
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
                                          state.salesManagmentRFIDetail[index]
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
                                          state.salesManagmentRFIDetail[index]
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
                                    state.salesManagmentRFIDetail[index].details
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
