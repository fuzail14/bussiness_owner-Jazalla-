import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../Controller/procurement_soi_controller.dart';

// ignore: must_be_immutable
class ProcuremenetSoiScreen extends ConsumerWidget {
  int buildcheck = 0;

  ProcuremenetSoiScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ProcuremenetSoiProvider.notifier);
    final state = ref.watch(ProcuremenetSoiProvider);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showBell: false,
        showFilter: false,
        title: "RFI/SOI Managemet",
        // filterOnPressed: () {
        //   _scaffoldKey.currentState?.openEndDrawer();
        // }
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
            ],
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            20.ph,
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
                      return Container(
                        //width: 360.w,
                        // height: 224.h,
                        margin:
                            EdgeInsets.only(left: 26, right: 26, bottom: 20).r,
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
                                      state.request4Information[index].startdate
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
                                  const EdgeInsets.only(top: 16, bottom: 20).r,
                              child: SizedBox(
                                //width: 180.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      state
                                          .request4Information[index].requestFor
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
            //         DataColumn(label: Text('Request Type')),
            //         DataColumn(label: Text('Item Type')),
            //         // DataColumn(label: Text('Issue Date')),

            //         DataColumn(label: Text('Status')),
            //         DataColumn(label: Text('Actions')),
            //       ],
            //       rows: state.request4Information
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
            //                   company.requestFor.toString(),
            //                   style: interTextstyle,
            //                 )),
            //                 DataCell(Text(
            //                   company.requestType ?? 'N/A',
            //                   style: interTextstyle,
            //                 )),
            //                 // DataCell(Text(company.status ?? 'N/A')),
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
