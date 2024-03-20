import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../Controller/sales_managment_rfq_controller.dart';

// ignore: must_be_immutable
class SalesManagmentRFQScreen extends ConsumerWidget {
  SalesManagmentRFQScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(salesManagmentRFQProvider.notifier);
    final state = ref.watch(salesManagmentRFQProvider);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 26.ph,
          // Row(
          //   children: [
          //     Container(
          //       width: 281.w,
          //       height: 36.h,
          //       padding: EdgeInsets.only(left: 20).r,
          //       margin: EdgeInsets.only(left: 26).r,
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(30.0),
          //           border: Border.all(color: HexColor('#DEDEDE'))),
          //       child: TextField(
          //         controller: controller.searchController,
          //         // onChanged: (query) {
          //         //   controller.debounce(() {
          //         //     controller.bussinesCommunitySearchApi(query: query);
          //         //   });
          //         // },
          //         decoration: InputDecoration(
          //           hintText: "What are you looking for?",
          //           hintStyle: TextStyle(
          //               fontSize: 12.sp,
          //               fontWeight: FontWeight.w300,
          //               color: HexColor('#75788D')),
          //           suffixIcon: GestureDetector(
          //             onTap: () {
          //               // controller.request4InformationRepository(
          //               //     query: controller.searchController.text.trim());
          //             },
          //             child: Container(
          //               padding: EdgeInsets.only(right: 22).r,
          //               width: 22.w,
          //               height: 21.h,
          //               child: SvgPicture.asset(
          //                 'assets/images/search.svg',
          //                 fit: BoxFit.contain,
          //               ),
          //             ),
          //           ),
          //           border: InputBorder.none,
          //         ),
          //       ),
          //     ),
          //     10.pw,
          //     IconButton(
          //         onPressed: () {
          //           controller.request4InformationViewApi(
          //               userId: state.person.data!.id,
          //               bearerToken: state.person.Bearer);
          //         },
          //         icon: const Icon(
          //           Icons.refresh,
          //           color: blueColor,
          //         )

          //         // SvgPicture.asset(
          //         //   'assets/images/filter.svg',
          //         //   height: 20,
          //         //   width: 40,
          //         // )
          //         ),
          //   ],
          // ),

          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            20.ph,
            if (state.requestForQuotation.isEmpty) ...[
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
                    itemCount: state.requestForQuotation.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                            salesManagmentRFQDetailPage,
                            pathParameters: {
                              'id':
                                  state.requestForQuotation[index].id.toString()
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ).r,
                          padding: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 5, top: 10)
                              .r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ID',
                                        style: GoogleFonts.sourceCodePro(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff000000)),
                                      ),
                                      5.ph,
                                      Text(
                                        'Title',
                                        style: GoogleFonts.sourceCodePro(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff000000)),
                                      ),
                                      5.ph,
                                      Text(
                                        'Date',
                                        style: GoogleFonts.sourceCodePro(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff000000)),
                                      ),
                                    ],
                                  ),
                                  6.pw,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 80.w,
                                        child: AutoSizeText(
                                            'RFQ-${state.requestForQuotation[index].id}',
                                            maxLines: 1,
                                            style: GoogleFonts.sourceCodePro(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff000000))),
                                      ),
                                      5.ph,
                                      SizedBox(
                                        width: 80.w,
                                        child: AutoSizeText(
                                            state.requestForQuotation[index]
                                                .title
                                                .toString(),
                                            maxLines: 1,
                                            style: GoogleFonts.sourceCodePro(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff000000))),
                                      ),
                                      5.ph,
                                      SizedBox(
                                        width: 80.w,
                                        child: AutoSizeText(
                                            state.requestForQuotation[index]
                                                .startDate
                                                .toString(),
                                            maxLines: 1,
                                            style: GoogleFonts.sourceCodePro(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff000000))),
                                      ),
                                    ],
                                  ),
                                  50.pw,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Quantity',
                                        style: GoogleFonts.sourceCodePro(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff000000)),
                                      ),
                                      5.ph,
                                      Text(
                                        'Status',
                                        style: GoogleFonts.sourceCodePro(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xff000000)),
                                      ),
                                    ],
                                  ),
                                  5.pw,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 70.w,
                                        child: AutoSizeText(
                                            state.requestForQuotation[index]
                                                .quantity
                                                .toString(),
                                            maxLines: 1,
                                            style: GoogleFonts.sourceCodePro(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff000000))),
                                      ),
                                      10.ph,
                                      if (state.requestForQuotation[index]
                                              .status ==
                                          '1') ...[
                                        SizedBox(
                                          width: 80.w,
                                          child: AutoSizeText('RFQ Send',
                                              maxLines: 1,
                                              style: GoogleFonts.sourceCodePro(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff4EBBD3))),
                                        ),
                                      ] else if (state
                                              .requestForQuotation[index]
                                              .status ==
                                          '2') ...[
                                        SizedBox(
                                          width: 80.w,
                                          child: AutoSizeText('RFQ Viewed',
                                              maxLines: 1,
                                              style: GoogleFonts.sourceCodePro(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff3D56A3))),
                                        ),
                                      ] else if (state
                                              .requestForQuotation[index]
                                              .status ==
                                          '3') ...[
                                        SizedBox(
                                          width: 80.w,
                                          child: AutoSizeText('RFQ Replied',
                                              maxLines: 1,
                                              style: GoogleFonts.sourceCodePro(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff4EBBD3))),
                                        ),
                                      ] else if (state
                                              .requestForQuotation[index]
                                              .status ==
                                          '4') ...[
                                        SizedBox(
                                          width: 80.w,
                                          child: AutoSizeText('RFQ Cancel',
                                              maxLines: 1,
                                              style: GoogleFonts.sourceCodePro(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xffFF0000))),
                                        ),
                                      ] else if (state
                                              .requestForQuotation[index]
                                              .status ==
                                          '10') ...[
                                        SizedBox(
                                          width: 80.w,
                                          child: AutoSizeText('RFQ Draft',
                                              maxLines: 1,
                                              style: GoogleFonts.sourceCodePro(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff000000))),
                                        ),
                                      ]
                                    ],
                                  ),

                                  // 5.p
                                  // w,
                                  // Flexible(
                                  //   child: AutoSizeText(
                                  //       'RFQ-${state.requestForQuotation[index].id}',
                                  //       maxLines: 1,
                                  //       style: GoogleFonts.sourceCodePro(
                                  //           fontSize: 12.sp,
                                  //           fontWeight: FontWeight.w600,
                                  //           color: Color(0xff000000))),
                                  // ),
                                  // 70.pw,
                                  // Text(
                                  //   'Request',
                                  //   style: GoogleFonts.montserrat(
                                  //       fontSize: 12.sp,
                                  //       color: Color(0xff000000),
                                  //       fontWeight: FontWeight.w300),
                                  // ),
                                  // 5.pw,
                                  // Flexible(
                                  //   child: AutoSizeText(
                                  //     'Processing',
                                  //     maxLines: 1,
                                  //     style: GoogleFonts.montserrat(
                                  //         fontSize: 12.sp,
                                  //         color: Color(0xff000000),
                                  //         fontWeight: FontWeight.w600),
                                  //   ),
                                  // ),
                                ],
                              ),
                              5.ph,
                              const Divider()
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
