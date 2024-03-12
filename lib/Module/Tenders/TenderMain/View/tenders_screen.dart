import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/api_routes.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Constants/Global/Model/global_lists.dart';
import '../../../../Constants/constants.dart';
import '../../../../Constants/provider/global_providers.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Widgets/Buttons/FilterButton/filter_button.dart';
import '../../../../Widgets/CustomButton/custom_button.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../Controller/tenders_controller.dart';

class TendersView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(tendersProvider.notifier);
    final state = ref.watch(tendersProvider);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xff29b8eb), Color(0xff7634fc)],
                ),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  expansionTileTheme: ExpansionTileThemeData(
                    backgroundColor: Colors.transparent,
                  ),
                ),
                child: ExpansionTile(
                  title: Text(
                    'Sort By',
                    style: GoogleFonts.quicksand(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteColor),
                  ),
                  onExpansionChanged: (bool expanded) {
                    // Update the expansion state for this specific tile
                    ref
                        .read(expansionTileStateProvider.notifier)
                        .update((state) => {
                              ...state,
                              'sortBy': expanded,
                            });
                  },
                  trailing: Icon(
                    Icons.add,
                    color: whiteColor,
                  ),
                  // children: ref
                  //             .watch(expansionTileStateProvider)
                  //             .containsKey('sortBy') &&
                  //         ref.watch(expansionTileStateProvider)['sortBy'] ==
                  //             true
                  //     ? buildSortFilter(controller,
                  //         state) // This function builds the children widgets
                  //     : [],
                  children: buildSortFilter(controller, state),
                ),
                // ListTile(
                //   title: Text(
                //     'Sort By',
                //     style: GoogleFonts.quicksand(
                //         fontSize: 12.sp,
                //         fontWeight: FontWeight.w600,
                //         color: whiteColor),
                //   ),
                //   trailing: Icon(
                //     Icons.sort,
                //     color: whiteColor,
                //   ),
                //   onTap: () {
                //     showCustomCupertinoDialog(
                //       context: context,
                //       dialogTitle: 'Filter',
                //       actions: controller.getDialogActions(context, ref),
                //     );
                //   },
                // ),
              ),
            ),
            20.ph,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xff29b8eb), Color(0xff7634fc)],
                ),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  expansionTileTheme: ExpansionTileThemeData(
                    backgroundColor: Colors.transparent,
                  ),
                ),
                child: ExpansionTile(
                  iconColor: whiteColor,
                  collapsedIconColor: whiteColor,
                  backgroundColor: Colors.transparent,
                  title: Text(
                    'Business Activities Filter',
                    style: GoogleFonts.quicksand(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteColor),
                  ),
                  onExpansionChanged: (bool expanded) {
                    // Update the expansion state for this specific tile
                    ref
                        .read(expansionTileStateProvider.notifier)
                        .update((state) => {
                              ...state,
                              'Business Activities Filter':
                                  expanded, // Use unique keys for each tile, e.g., 'sortBy', 'providers'
                            });
                  },
                  children: buildBusinessActivitiesFilter(controller, state),
                ),
              ),
            ),
          ],
        ),
      ),

      key: _scaffoldKey,

      //backgroundColor: HexColor('#F5F5F5'),
      backgroundColor: Colors.white,
      appBar: MyAppBar(
          title: 'Tenders',
          size: 50.h,
          showBell: false,
          filterOnPressed: () {
            _scaffoldKey.currentState?.openEndDrawer();
          }),

      body: Column(
        children: [
          26.ph,
          Row(
            children: [
              Container(
                width: 281.w,
                height: 36.h,
                margin: EdgeInsets.only(left: 26).r,

                // decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(30.0),
                //     border: Border.all(color: HexColor('#DEDEDE'))),
                child: TextField(
                  controller: controller.searchController,
                  // onChanged: (query) {
                  //   controller.debounce(() {
                  //     controller.bussinesCommunitySearchApi(query: query);
                  //   });
                  // },

                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20).r,
                      fillColor: Colors.white,
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        // border: Border.all(color: HexColor('#DEDEDE'))
                      ),
                      hintText: "What are you looking for?",
                      hintStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: HexColor('#75788D')),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.tenderSearchApi(
                              query: controller.searchController.text.trim());
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
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30).r,
                        borderSide: BorderSide(color: Color(0xffDEDEDE)),
                      ),
                      focusColor: blueColor),
                ),
              ),
              10.pw,
              IconButton(
                  onPressed: () {
                    controller.searchController.clear();
                    controller.loadTenders();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: blueColor,
                  )),
            ],
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            20.ph,
            if (state.tendersList.isEmpty) ...[
              Center(
                child: Text(
                  'No Search Found.',
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#EB2F2F')),
                ),
              ),
            ] else
              Expanded(
                  child: ListView.builder(
                itemCount: state.tendersList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var tenders = state.tendersList[index];
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pushNamed(tendersDetailPage,
                          pathParameters: {
                            'id': state.tendersList[index].id.toString()
                          },
                          extra: controller.person.Bearer);
                    },
                    child: Container(
                      //height: 686.h,
                      //width: 386.w,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0xfff3f4f5)),
                      margin: EdgeInsets.only(top: 10, left: 14, right: 14).r,
                      padding: EdgeInsets.only(
                              left: 16, top: 22, right: 16, bottom: 30)
                          .r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // margin:
                            //     EdgeInsets.only(top: 22, left: 16, right: 16).r,
                            padding: EdgeInsets.only(
                                    left: 10, top: 10, right: 10, bottom: 13)
                                .r,

                            width: 353.83331298828125.w,
                            //height: 186.h,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 55.75555419921875.w,
                                      height: 52.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: HexColor('#E1E3E6')),
                                          shape: BoxShape.circle),
                                      child: CachedNetworkImage(
                                        imageUrl: Api.imageBaseUrl +
                                            tenders.companies!.logo.toString(),
                                        fit: BoxFit.contain,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    // CircleAvatar(
                                    //   backgroundColor: HexColor('#FFFFF'),
                                    //   child: (tenders.companies.logo == null)
                                    //       ? Icon(Icons.eco, color: Colors.white)
                                    //       : Image.network(Api.imageBaseUrl +
                                    //           tenders.companies.logoPath
                                    //               .toString()),
                                    // ),
                                    15.pw,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tenders.title
                                                .toString(), // Replace with actual title
                                            style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          AutoSizeText(
                                            tenders.companies!.mobileNo
                                                .toString(),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                13.ph,
                                Container(
                                  width: 332.39.w,
                                  height: 27.h,
                                  decoration: BoxDecoration(
                                      color: HexColor('#FFFFFF'),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: HexColor('#E1E3E6'))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/tendercard_icon1.svg',
                                        height: 14.h,
                                        width: 15.01.w,
                                      ),
                                      Text(
                                        'Closed',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                            color: HexColor('#EB2F2F')),
                                      ),
                                      VerticalDivider(
                                        color: HexColor('#E1E3E6'),
                                      ),
                                      SvgPicture.asset(
                                        'assets/images/tendercard_icon2.svg',
                                        height: 14.h,
                                        width: 15.01.w,
                                      ),
                                      Text('Qualified',
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: HexColor('#27D959'))),
                                      VerticalDivider(
                                        color: HexColor('#E1E3E6'),
                                      ),
                                      SvgPicture.asset(
                                        'assets/images/tendercard_icon3.svg',
                                        height: 14.h,
                                        width: 15.01.w,
                                      ),
                                      Text('Product',
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: HexColor('#4758EF'))),
                                    ],
                                  ),
                                ),
                                13.ph,
                                Text('Construction the road',
                                    style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.sp,
                                        color: HexColor('#686868'))),
                                6.ph,
                                Row(
                                  children: [
                                    Container(
                                      height: 24.h,
                                      width: 101.w,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          border: Border.all(
                                              color: HexColor('#27BCEB'))),
                                      child: Center(
                                        child: Text(
                                          'Email Protected',
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10.sp,
                                              color: HexColor('#27BCEB')),
                                        ),
                                      ),
                                    ),
                                    21.23.pw,
                                    Container(
                                      height: 24.h,
                                      width: 63.w,
                                      decoration: BoxDecoration(
                                        color: HexColor('#27BCEB'),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'contact',
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10.sp,
                                              color: HexColor('#FFFFFF')),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          10.ph,
                          Text(
                            'Description'
                                .toString(), // Replace with actual title
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                            ),
                          ),
                          12.ph,
                          AutoSizeText(
                            tenders.description.toString(),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          20.ph,
                          Container(
                            width: 353.83331298828125.w,
                            //height: 186.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16).r,
                                color: Colors.white),
                            child: Card(
                              margin: EdgeInsets.only(
                                      top: 16,
                                      bottom: 15,
                                      left: 24.66,
                                      right: 25.73)
                                  .r,
                              color: HexColor('#F3F4F5'),
                              child: Padding(
                                padding: EdgeInsets.only(
                                        left: 20,
                                        top: 10,
                                        right: 20,
                                        bottom: 20)
                                    .r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Details',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.sp,
                                          color: HexColor('#0D0B0C')),
                                    ),
                                    16.ph,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Posted By',
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: HexColor('#6A7380')),
                                        ),
                                        //16.pw,
                                        Text(
                                          tenders.companies!.companyName
                                              .toString(),
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                      ],
                                    ),
                                    16.ph,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Deadline',
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: HexColor('#6A7380')),
                                        ),
                                        //16.pw,
                                        Text(
                                          tenders.endDate.toString(),
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                      ],
                                    ),
                                    16.ph,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Activity',
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: HexColor('#6A7380')),
                                        ),
                                        //16.pw,
                                        Text(
                                          tenders.companies!.primaryActivity
                                              .toString(),
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // 51.25.ph,
                          // Row(
                          //   children: [
                          //     CustomButton(
                          //       onTap: () {
                          //         GoRouter.of(context).pushNamed(
                          //             tendersDetailPage,
                          //             pathParameters: {
                          //               'id':
                          //                   state.tendersList[index].id.toString()
                          //             },
                          //             extra: controller.person.Bearer);
                          //       },
                          //       width: 140.w,
                          //       height: 32.h,
                          //       text: 'Detail',
                          //       textColor: HexColor('#27BCEB'),
                          //       borderColor: HexColor('#27BCEB'),
                          //     ),
                          //     21.23.pw,
                          //     // CustomButton(
                          //     //   onTap: () {
                          //     //     tenders.id;
                          //     //     controller.person.data!.id;
                          //     //     tenders.companyId;
                          //     //     controller.person.data!.companyId;
                          //     //     print(tenders.id);
                          //     //     print("user id ${controller.person.data!.id}");
                          //     //     print(tenders.companyId);
                          //     //     print(
                          //     //         "buyer id ${controller.person.data!.companyId}");

                          //     //     final quoteData = {
                          //     //       'tenderId': tenders.id,
                          //     //       'tenderCompanyId': tenders.companyId,
                          //     //       'userId': controller.person.data!.id,
                          //     //       'userCompanyId':
                          //     //           controller.person.data!.companyId
                          //     //     };

                          //     //     GoRouter.of(context).pushNamed(
                          //     //       tenderResponseScreen,
                          //     //       extra: quoteData,
                          //     //     );
                          //     //   },
                          //     //   width: 140.w,
                          //     //   height: 32.h,
                          //     //   text: 'Response',
                          //     //   color: HexColor('#27BCEB'),
                          //     // ),

                          //   ],
                          // )
                        ],
                      ),
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

List<Widget> buildBusinessActivitiesFilter(
    TendersController controller, TendersState state) {
  return [
    Container(
      width: double.infinity,
      // height: 437,
      padding: EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: HexColor('#FFFFFF'),
          border: Border.all(color: HexColor('#7F7F8A4D'))),
      child: Wrap(
        spacing: 8.0, // Gap between adjacent chips.
        runSpacing: 4.0, // Gap between lines.
        children: state.customMainCategory.map((sector) {
          bool isSelected = sector.id == state.selectedSectorId;

          // int index = businessSectors.indexOf(sector);
          // bool isSelected = sector['isChecked'];

          return GestureDetector(
            onTap: () {
              controller.setSelectedSectorId(sector.id!);
            },
            child: FilterButton(
                name: sector.custom_activity_name!, isSelected: isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}

List<Widget> buildSortFilter(TendersController controller, TendersState state) {
  return [
    Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: HexColor('#FFFFFF'),
          border: Border.all(color: HexColor('#7F7F8A4D'))),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: sortList.map((sector) {
          //bool isSelected = sector['id'] == state.selectedProviderId;
          bool isSelected = sector['isChecked'];

          return GestureDetector(
            onTap: () {
              // Check if the tapped button is already selected
              if (sector['isChecked']) {
                // If yes, revert its state
                sector['isChecked'] = false;

                controller.loadTenders();
              } else {
                // If no, unselect all other buttons
                for (var s in sortList) {
                  s['isChecked'] = false;
                }
                // Select the tapped button
                sector['isChecked'] = true;

                // Trigger the first API call with the selected sector's ID
                controller.tenderSortApi(filtertype: sector['name']);
              }
            },
            child: FilterButton(name: sector['name'], isSelected: isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}
