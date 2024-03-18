import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Routes/set_routes.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../../../../SalesManagment/RFQMain/RFQ/Controller/sales_managment_rfq_controller.dart';
import '../../../../SalesManagment/RFQMain/RFQ/View/sales_managment_rfq_screen.dart';
import '../Controller/procurement_rfq_controller.dart';

class ProcurementRFQScreen extends ConsumerStatefulWidget {
  @override
  _ProcurementRFQScreenState createState() => _ProcurementRFQScreenState();
}

class _ProcurementRFQScreenState extends ConsumerState<ProcurementRFQScreen>
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
    final controller = ref.watch(ProcuremenetSoiProvider.notifier);
    final state = ref.watch(ProcuremenetSoiProvider);
    final salesManagmentRFQ = ref.watch(salesManagmentRFQProvider.notifier);
    final salesManagmentRFQstate = ref.watch(salesManagmentRFQProvider);
    return Scaffold(
      appBar: MyAppBar(
        showBell: false,
        showFilter: false,
        title: "RFQ Managment",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 23.w, right: 23.w, top: 30).w,
            // width: 362.w,
            height: 48.h,
            decoration: ShapeDecoration(
                color: const Color(0xffE2F5ED),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.w, color: const Color(0xff27BCEB)),
                  borderRadius: BorderRadius.circular(8.r),
                )),
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: const Color(0xFF5A5A5A),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              indicator: ShapeDecoration(
                color: HexColor('#4B6FFF'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r)),
              ),
              indicatorColor: HexColor('#4B6FFF'),
              tabs: [
                Tab(
                    child: Text(
                  'RFQ Send',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 12.sp),
                )),
                Tab(
                  child: Text(
                    'RFQ Recieved',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SendRFQScreen(),
                SalesManagmentRFQScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SendRFQScreen extends ConsumerWidget {
  SendRFQScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ProcuremenetSoiProvider.notifier);
    final state = ref.watch(ProcuremenetSoiProvider);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //26.ph,
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
                            rFXManagmentRFQDetailPage,
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
                                      SizedBox(
                                        width: 80.w,
                                        child: AutoSizeText('RFQ Send',
                                            maxLines: 1,
                                            style: GoogleFonts.sourceCodePro(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff4EBBD3))),
                                      ),
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
