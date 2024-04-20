import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../../../../SalesManagment/RFIMain/RFI/Controller/sales_managment_rfi_controller.dart';
import '../../../../SalesManagment/RFIMain/RFI/View/sales_managment_rfi_screen.dart';
import '../Controller/procurement_soi_controller.dart';

// ignore: must_be_immutable
class ProcuremenetSoiScreen extends ConsumerWidget {
  const ProcuremenetSoiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print('build check  ${buildcheck++}');
    final controller = ref.watch(ProcuremenetSoiProvider.notifier);
    final state = ref.watch(ProcuremenetSoiProvider);
    final salesManagmentRFPcontroller =
        ref.watch(SalesManagmentRFIProvider.notifier);
    final salesManagmentRFPstate = ref.watch(SalesManagmentRFIProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 23.w, right: 23.w, top: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tabButton(
                  title: 'RFI Sent',
                  index: 0,
                  isSelected: state.selectedIndex == 0,
                  controller: controller,
                ),
                _tabButton(
                  title: 'RFI Received',
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

Widget _tabButton({
  required String title,
  required int index,
  required bool isSelected,
  required ProcuremenetSoiController controller,
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

class SendRFIScreen extends ConsumerWidget {
  int buildcheck = 0;

  SendRFIScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ProcuremenetSoiProvider.notifier);
    final state = ref.watch(ProcuremenetSoiProvider);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20).r,
            child: Text(
              'RFI Managment',
              style: GoogleFonts.sourceCodePro(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff000000)),
            ),
          ),
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
                          margin: const EdgeInsets.only(
                                  bottom: 9, left: 20, right: 20, top: 9)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 39, right: 0, bottom: 15, top: 9)
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 180.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ID',
                                      style: montserratHeadingTextStyle,
                                    ),
                                    4.ph,
                                    Text(
                                      state.request4Information[index].id
                                          .toString(),
                                      maxLines: 2,
                                      style: montserratSubHeadingTextStyle,
                                    ),
                                    10.ph,
                                    Text(
                                      'Title',
                                      style: montserratHeadingTextStyle,
                                    ),
                                    4.ph,
                                    Text(
                                      state.request4Information[index].title
                                          .toString(),
                                      maxLines: 2,
                                      style: montserratSubHeadingTextStyle,
                                    ),
                                    10.ph,
                                    Text(
                                      'Issue Date',
                                      style: montserratHeadingTextStyle,
                                    ),
                                    4.ph,
                                    Text(
                                      state.request4Information[index].startdate
                                          .toString(),
                                      maxLines: 2,
                                      style: montserratSubHeadingTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 100.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Item Type',
                                      style: montserratHeadingTextStyle,
                                    ),
                                    4.ph,
                                    Text(
                                      state.request4Information[index]
                                          .requestType
                                          .toString(),
                                      maxLines: 2,
                                      style: montserratSubHeadingTextStyle,
                                    ),
                                    10.ph,
                                    Text(
                                      'Request',
                                      style: montserratHeadingTextStyle,
                                    ),
                                    4.ph,
                                    if (state.request4Information[index]
                                            .status ==
                                        '1') ...[
                                      Text('Processing',
                                          maxLines: 2,
                                          style: montserratSubHeadingTextStyle),
                                    ],
                                    10.ph,
                                    Text(
                                      'Status',
                                      style: montserratHeadingTextStyle,
                                    ),
                                    4.ph,
                                    if (state.request4Information[index]
                                            .status ==
                                        '1') ...[
                                      Text('RFI Sent',
                                          maxLines: 2,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff213F99))),
                                    ],
                                  ],
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
