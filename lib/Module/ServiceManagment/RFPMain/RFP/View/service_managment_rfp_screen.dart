import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Routes/set_routes.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../Controller/service_managment_rfp_controller.dart';

// ignore: must_be_immutable
class ServiceManagmentRFPScreen extends ConsumerWidget {
  int buildcheck = 0;

  ServiceManagmentRFPScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(serviceManagmentRFPProvider.notifier);
    final state = ref.watch(serviceManagmentRFPProvider);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    print('build check  ${buildcheck++}');

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20).r,
            child: Text(
              'RFP Managment',
              style: GoogleFonts.sourceCodePro(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff000000)),
            ),
          ),
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
          //               serviceProviderId: state.person.data!.id,
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
            if (state.requestForProposal.isEmpty) ...[
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
                    itemCount: state.requestForProposal.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                            serviceManagmentRFPDetailPage,
                            pathParameters: {
                              'id':
                                  state.requestForProposal[index].id.toString()
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                                  left: 13, right: 13, top: 20)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 17, right: 17, bottom: 18, top: 14)
                              .r,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(7).r,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      width: 100.w,
                                      child: Text(
                                        'ID',
                                        style: montserratHeadingTextStyle,
                                      ),
                                    ),
                                    Flexible(
                                      child: AutoSizeText(
                                        'RFP-${state.requestForProposal[index].id}',
                                        maxLines: 1,
                                        style: montserratSubHeadingTextStyle,
                                      ),
                                    ),
                                  ]),
                              8.ph,
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      width: 100.w,
                                      child: Text(
                                        'Title',
                                        style: montserratHeadingTextStyle,
                                      ),
                                    ),
                                    Flexible(
                                      child: AutoSizeText(
                                        state.requestForProposal[index].title
                                            .toString(),
                                        maxLines: 2,
                                        style: montserratSubHeadingTextStyle,
                                      ),
                                    ),
                                  ]),
                              8.ph,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: AutoSizeText('Status',
                                        maxLines: 1,
                                        style: montserratHeadingTextStyle),
                                  ),
                                  10.ph,
                                  if (state.requestForProposal[index].status ==
                                      '1') ...[
                                    Flexible(
                                      child: AutoSizeText('RFP Received',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff274EA0))),
                                    ),
                                  ] else if (state
                                          .requestForProposal[index].status ==
                                      '2') ...[
                                    Flexible(
                                      child: AutoSizeText('RFP Viewed',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff274EA0))),
                                    )
                                  ] else if (state
                                          .requestForProposal[index].status ==
                                      '3') ...[
                                    Flexible(
                                      child: AutoSizeText('RFP Replied',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff4EBBD3))),
                                    )
                                  ] else if (state
                                          .requestForProposal[index].status ==
                                      '4') ...[
                                    Flexible(
                                      child: AutoSizeText('RFP Cancel',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xffFF0000))),
                                    )
                                  ] else if (state
                                          .requestForProposal[index].status ==
                                      '10') ...[
                                    Flexible(
                                      child: AutoSizeText('RFP Draft',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff4EBBD3))),
                                    )
                                  ]
                                ],
                              ),
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
