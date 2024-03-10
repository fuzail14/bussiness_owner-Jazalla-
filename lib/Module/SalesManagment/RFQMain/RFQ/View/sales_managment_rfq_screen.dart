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
  int buildcheck = 0;

  SalesManagmentRFQScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ProcuremenetSoiProvider.notifier);
    final state = ref.watch(ProcuremenetSoiProvider);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showBell: false,
        title: "RFQ Managemet",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          26.ph,
          Row(
            children: [
              Container(
                width: 281.w,
                height: 36.h,
                padding: EdgeInsets.only(left: 20).r,
                margin: EdgeInsets.only(left: 26).r,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: HexColor('#DEDEDE'))),
                child: TextField(
                  controller: controller.searchController,
                  // onChanged: (query) {
                  //   controller.debounce(() {
                  //     controller.bussinesCommunitySearchApi(query: query);
                  //   });
                  // },
                  decoration: InputDecoration(
                    hintText: "What are you looking for?",
                    hintStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: HexColor('#75788D')),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // controller.request4InformationRepository(
                        //     query: controller.searchController.text.trim());
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 22).r,
                        width: 22.w,
                        height: 21.h,
                        child: SvgPicture.asset(
                          'assets/images/search.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              10.pw,
              IconButton(
                  onPressed: () {
                    controller.request4InformationViewApi(
                        userId: state.person.data!.id,
                        bearerToken: state.person.Bearer);
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: blueColor,
                  )

                  // SvgPicture.asset(
                  //   'assets/images/filter.svg',
                  //   height: 20,
                  //   width: 40,
                  // )
                  ),
            ],
          ),
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
                      return GestureDetector(
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
                          //width: 360.w,
                          // height: 224.h,
                          margin: const EdgeInsets.only(
                            left: 26,
                            right: 26,
                            bottom: 20,
                          ).r,
                          padding: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 20, top: 16)
                              .r,

                          decoration: BoxDecoration(
                            // color: Color(0xffF9F9F9),
                            gradient: LinearGradient(
                              stops: [0.001, 0.5],
                              // begin: Alignment.bottomRight,
                              // end: Alignment.bottomLeft,

                              begin: Alignment
                                  .bottomCenter, // Begin gradient from top right
                              end: Alignment.topCenter,
                              colors: <Color>[
                                Color(0xff08B783).withOpacity(0.05),
                                Color(0xffFFFFFF),
                              ],
                            ),

                            borderRadius: BorderRadius.circular(8.0).r,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'RFQ-ID',
                                style: GoogleFonts.sourceCodePro(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff000000)),
                              ),
                              4.ph,
                              Text('RFQ-${state.requestForQuotation[index].id}',
                                  style: GoogleFonts.sourceCodePro(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff000000))),
                              16.ph,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Item Name',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      5.ph,
                                      Container(
                                        width: 89.w,
                                        // height: 22.h,
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0)
                                            .r,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12).r,
                                            border: Border.all(
                                                color: Color(0xff3C3C43))),
                                        child: AutoSizeText(
                                            state.requestForQuotation[index]
                                                .title
                                                .toString(),
                                            maxLines: 1,
                                            style: GoogleFonts.sourceCodePro(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w300,
                                                color:
                                                    const Color(0xff000000))),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Unit',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      5.ph,
                                      Container(
                                        width: 89.w,
                                        // height: 22.h,
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0)
                                            .r,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12).r,
                                            border: Border.all(
                                                color: Color(0xff3C3C43))),
                                        child: AutoSizeText(
                                            state
                                                .requestForQuotation[index].unit
                                                .toString(),
                                            maxLines: 1,
                                            style: GoogleFonts.sourceCodePro(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w300,
                                                color:
                                                    const Color(0xff000000))),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Issue Date',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      5.ph,
                                      Container(
                                        width: 89.w,
                                        // height: 22.h,
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0)
                                            .r,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12).r,
                                            border: Border.all(
                                                color: Color(0xff3C3C43))),
                                        child: AutoSizeText(
                                            state.requestForQuotation[index]
                                                .startDate
                                                .toString(),
                                            maxLines: 1,
                                            style: GoogleFonts.sourceCodePro(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w300,
                                                color:
                                                    const Color(0xff000000))),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              16.ph,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'QTY',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      5.ph,
                                      Container(
                                        width: 89.w,
                                        // height: 22.h,
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0)
                                            .r,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12).r,
                                            border: Border.all(
                                                color: Color(0xff3C3C43))),
                                        child: AutoSizeText(
                                            state.requestForQuotation[index]
                                                .quantity
                                                .toString(),
                                            maxLines: 1,
                                            style: GoogleFonts.sourceCodePro(
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w300,
                                                color:
                                                    const Color(0xff000000))),
                                      )
                                    ],
                                  ),
                                  20.pw,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Status',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      5.ph,
                                      if (state.requestForQuotation[index]
                                              .status ==
                                          '1') ...[
                                        Container(
                                          width: 89.w,
                                          // height: 22.h,
                                          padding: const EdgeInsets.symmetric(
                                                  horizontal: 8.0)
                                              .r,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12).r,
                                              border: Border.all(
                                                  color: Color(0xff3C3C43))),

                                          child: AutoSizeText('RFQ Sent',
                                              maxLines: 1,
                                              style: GoogleFonts.sourceCodePro(
                                                  fontSize: 8.sp,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      const Color(0xff000000))),
                                        )
                                      ]
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(
            //         horizontal: 16.0, vertical: 16.0),
            //     child: DataTable(
            //       headingRowColor:
            //           MaterialStateProperty.resolveWith<Color?>(
            //               (Set<MaterialState> states) {
            //         if (states.contains(MaterialState.selected)) {
            //           return Color(0xffE5E7EB);
            //         }
            //         return Color(0xffE5E7EB);
            //       }),
            //       columnSpacing: 20.0,
            //       dividerThickness: 0.3,
            //       border: TableBorder.all(
            //           color: Color(0xffF3F4F6),
            //           width: 1,
            //           borderRadius: BorderRadius.circular(16).r),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(16).r),
            //       columns: const [
            //         DataColumn(label: Text('ID')),
            //         DataColumn(label: Text('Title')),
            //         DataColumn(label: Text('Item Unit')),
            //         DataColumn(label: Text('Item Quantity')),
            //         DataColumn(label: Text('Issue Date')),
            //         DataColumn(label: Text('Status')),
            //         DataColumn(label: Text('Actions')),
            //       ],
            //       rows: state.requestForQuotation
            //           .map<DataRow>(
            //             (company) => DataRow(
            //               cells: [
            //                 DataCell(Text(company.id.toString())),
            //                 DataCell(SizedBox(
            //                   width: 100.w,
            //                   child: Text(
            //                     company.title.toString(),
            //                     maxLines: 1,
            //                     overflow: TextOverflow.ellipsis,
            //                     style: interTextstyle,
            //                   ),
            //                 )),
            //                 DataCell(Text(
            //                   company.unit.toString(),
            //                   style: interTextstyle,
            //                 )),
            //                 DataCell(Text(
            //                   company.quantity.toString(),
            //                   style: interTextstyle,
            //                 )),
            //                 DataCell(Text(company.deliveryDate.toString())),
            //                 DataCell(Text(
            //                   company.status == '1' ? 'RFI Sent' : 'Wait',
            //                   style: GoogleFonts.inter(
            //                       fontSize: 10.sp,
            //                       fontWeight: FontWeight.w400,
            //                       color: company.status == '1'
            //                           ? Color(0xffE83434)
            //                           : Color(0xff000000)),
            //                 )),
            //                 DataCell(
            //                   DropdownButton<String>(
            //                     dropdownColor: whiteColor,

            //                     borderRadius: BorderRadius.circular(10).r,
            //                     style: interTextstyle,
            //                     icon: const Icon(Icons.arrow_drop_down,
            //                         color:
            //                             Colors.grey), // Custom icon color
            //                     items: <String>['View RFI', 'Delete RFI']
            //                         .map((String value) {
            //                       return DropdownMenuItem<String>(
            //                         value: value,
            //                         child: Text(value),
            //                       );
            //                     }).toList(),
            //                     onChanged: (newValue) {
            //                       // Handle dropdown changes
            //                       if (newValue == 'View RFI') {
            //                         // View RFI logic goes here
            //                       } else if (newValue == 'Delete RFI') {
            //                         // Send Response logic goes here
            //                       }
            //                     },
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           )
            //           .toList(),
            //     ),
            //   ),
            // )
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
