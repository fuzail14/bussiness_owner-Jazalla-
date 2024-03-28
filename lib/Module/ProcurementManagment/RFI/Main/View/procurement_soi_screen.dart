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
import '../../../../SalesManagment/RFIMain/RFI/Controller/sales_managment_rfi_controller.dart';
import '../../../../SalesManagment/RFIMain/RFI/View/sales_managment_rfi_screen.dart';
import '../Controller/procurement_soi_controller.dart';

// ignore: must_be_immutable
class ProcuremenetSoiScreen extends ConsumerStatefulWidget {
  @override
  _ProcuremenetSoiScreenState createState() => _ProcuremenetSoiScreenState();
}

class _ProcuremenetSoiScreenState extends ConsumerState<ProcuremenetSoiScreen>
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
    final salesManagmentRFPcontroller =
        ref.watch(SalesManagmentRFIProvider.notifier);
    final salesManagmentRFPstate = ref.watch(SalesManagmentRFIProvider);

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
            margin: EdgeInsets.only(left: 23.w, right: 23.w, top: 30).w,
            // width: 362.w,
            height: 48.h,
            decoration: ShapeDecoration(
                color: const Color(0xff4EBBD3).withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.w, color: const Color(0xff4EBBD3)),
                  borderRadius: BorderRadius.circular(8.r),
                )),
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: const Color(0xFF5A5A5A),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              indicator: ShapeDecoration(
                color: HexColor('#1F3996'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r)),
              ),
              tabs: [
                Tab(
                    child: Text(
                  'RFI Send',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 12.sp),
                )),
                Tab(
                  child: Text(
                    'RFI Recieved',
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
                SendRFIScreen(),
                SalesManagmentRFIScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SendRFIScreen extends ConsumerWidget {
  int buildcheck = 0;

  SendRFIScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ProcuremenetSoiProvider.notifier);
    final state = ref.watch(ProcuremenetSoiProvider);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    print('build check  ${buildcheck++}');

    return Scaffold(
      // appBar: MyAppBar(
      //   showBell: false,
      //   showFilter: false,
      //   title: "RFI Managemet",
      //   // filterOnPressed: () {
      //   //   _scaffoldKey.currentState?.openEndDrawer();
      //   // }
      // ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          26.ph,
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
          //   ],
          // ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            // 20.ph,
            if (state.request4Information.isEmpty) ...[
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
                    itemCount: state.request4Information.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                            rFXManagmentRFIDetailPage,
                            pathParameters: {
                              'id':
                                  state.request4Information[index].id.toString()
                            },
                          );
                        },
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,
                          margin:
                              EdgeInsets.only(left: 26, right: 26, bottom: 20)
                                  .r,
                          decoration: BoxDecoration(
                              color: Color(0xffF9F9F9),
                              borderRadius: BorderRadius.circular(8.0).r),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                        left: 32, top: 16, bottom: 20)
                                    .r,
                                child: SizedBox(
                                  width: 180.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ID',
                                        style: montserratHeadingTextStyle,
                                      ),
                                      4.ph,
                                      Text(
                                        state.request4Information[index].id
                                            .toString(),
                                        style: montserratSubHeadingTextStyle,
                                      ),
                                      16.ph,
                                      Text(
                                        'Title',
                                        style: montserratHeadingTextStyle,
                                      ),
                                      4.ph,
                                      Text(
                                        state.request4Information[index].title
                                            .toString(),
                                        style: montserratSubHeadingTextStyle,
                                      ),
                                      16.ph,
                                      Text(
                                        'Issue Date',
                                        style: montserratHeadingTextStyle,
                                      ),
                                      4.ph,
                                      Text(
                                        state.request4Information[index]
                                            .startdate
                                            .toString(),
                                        style: montserratSubHeadingTextStyle,
                                      ),
                                      16.ph,
                                      Text(
                                        'Item Type',
                                        style: montserratHeadingTextStyle,
                                      ),
                                      4.ph,
                                      Text(
                                        state.request4Information[index]
                                            .requestType
                                            .toString(),
                                        style: montserratSubHeadingTextStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, bottom: 20)
                                        .r,
                                child: SizedBox(
                                  //width: 180.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Request',
                                        style: montserratHeadingTextStyle,
                                      ),
                                      4.ph,
                                      if (state.request4Information[index]
                                              .status ==
                                          '1') ...[
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0)
                                              .r,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff124206),
                                              borderRadius:
                                                  BorderRadius.circular(8).r),
                                          child: Text('Processing',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xffFACC15))),
                                        ),
                                      ],
                                      16.ph,
                                      Text(
                                        'Status',
                                        style: montserratHeadingTextStyle,
                                      ),
                                      4.ph,
                                      if (state.request4Information[index]
                                              .status ==
                                          '1') ...[
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0)
                                              .r,
                                          decoration: BoxDecoration(
                                              color: const Color(0xff042F2E),
                                              borderRadius:
                                                  BorderRadius.circular(8).r),
                                          child: Text('RFI Sent',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff2DD4BF))),
                                        ),
                                      ],
                                      16.ph,
                                      Text(
                                        'Item For',
                                        style: montserratHeadingTextStyle,
                                      ),
                                      4.ph,
                                      Text(
                                        state.request4Information[index]
                                            .requestFor
                                            .toString(),
                                        style: montserratSubHeadingTextStyle,
                                      ),
                                      16.ph,
                                    ],
                                  ),
                                ),
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
