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
import '../../../../ServiceManagment/RFPMain/RFP/Controller/service_managment_rfp_controller.dart';
import '../../../../ServiceManagment/RFPMain/RFP/View/service_managment_rfp_screen.dart';
import '../Controller/procurement_rfp_controller.dart';

class ProcurementRFPScreen extends ConsumerStatefulWidget {
  const ProcurementRFPScreen({super.key});

  @override
  _ProcurementRFPScreenState createState() => _ProcurementRFPScreenState();
}

class _ProcurementRFPScreenState extends ConsumerState<ProcurementRFPScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int buildcheck = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build check  ${buildcheck++}');
    final controller = ref.watch(ProcuremenetRFpProvider.notifier);
    final state = ref.watch(ProcuremenetRFpProvider);
    final serviceManagmentRFPcontroller =
        ref.watch(serviceManagmentRFPProvider.notifier);
    final serviceManagmentRFPstate = ref.watch(serviceManagmentRFPProvider);
    return Scaffold(
      // appBar: MyAppBar(
      //   showBell: false,
      //   showFilter: false,
      //   title: "RFP Managment",
      // ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 23.w, right: 23.w, top: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tabButton(
                  title: 'RFP Sent',
                  index: 0,
                  isSelected: state.selectedIndex == 0,
                  controller: controller,
                ),
                _tabButton(
                  title: 'RFP Received',
                  index: 1,
                  isSelected: state.selectedIndex == 1,
                  controller: controller,
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: state.selectedIndex,
              children: [
                SendRFPScreen(),
                ServiceManagmentRFPScreen(),
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 23.w, right: 23.w, top: 30).w,
          //   // width: 362.w,
          //   height: 48.h,
          //   decoration: ShapeDecoration(
          //       color: const Color(0xff4EBBD3).withOpacity(0.2),
          //       shape: RoundedRectangleBorder(
          //         side: BorderSide(width: 1.w, color: const Color(0xff4EBBD3)),
          //         borderRadius: BorderRadius.circular(8.r),
          //       )),
          //   child: TabBar(
          //     controller: _tabController,
          //     unselectedLabelColor: const Color(0xFF5A5A5A),
          //     indicatorSize: TabBarIndicatorSize.tab,
          //     labelColor: Colors.white,
          //     indicator: ShapeDecoration(
          //       color: HexColor('#1F3996'),
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(6.r)),
          //     ),
          //     tabs: [
          //       Tab(
          //           child: Text(
          //         'RFP Send',
          //         style: GoogleFonts.poppins(
          //             fontWeight: FontWeight.w500, fontSize: 12.sp),
          //       )),
          //       Tab(
          //         child: Text(
          //           'RFP Recieved',
          //           style: GoogleFonts.poppins(
          //               fontWeight: FontWeight.w500, fontSize: 12.sp),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Expanded(
          //   child: TabBarView(
          //     controller: _tabController,
          //     children: [
          //       SendRFPScreen(),
          //       ServiceManagmentRFPScreen(),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

Widget _tabButton({
  required String title,
  required int index,
  required bool isSelected,
  required ProcuremenetRFPController controller,
}) {
  return GestureDetector(
    onTap: () => controller.setTabBarStatus(index),
    child: AnimatedContainer(
      width: 150.w,
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff4EBBD3) : Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(0, 2),
                  blurRadius: 4.0,
                ),
              ]
            : [], // Apply shadow only when selected
        border: Border.all(
          color: isSelected ? const Color(0xffDADADA) : const Color(0xff4EBBD3),
          width: 1.w,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            color: isSelected ? Colors.white : const Color(0xff4EBBD3),
          ),
        ),
      ),
    ),
  );
}

class SendRFPScreen extends ConsumerWidget {
  int buildcheck = 0;

  SendRFPScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ProcuremenetRFpProvider.notifier);
    final state = ref.watch(ProcuremenetRFpProvider);
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
          //           controller.request4ProposalViewApi(
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
                            rFXManagmentRFPDetailPage,
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
                                      child: AutoSizeText('RFP Sent',
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
              padding: const EdgeInsets.symmetric(vertical: 20).r,
              child: Center(
                child: Text(
                  "No Data Found",
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#EB2F2F')),
                ),
              ),
            ),
        ],
      ),

      // ),
    );
  }
}
