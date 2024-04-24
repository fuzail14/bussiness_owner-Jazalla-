import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Constants/Global/Model/global_lists.dart';
import '../../../../Constants/provider/global_providers.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/Buttons/FilterButton/filter_button.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../Controller/bussines_communities_controller.dart';

// ignore: must_be_immutable
class BussinesCommunitiesScreen extends ConsumerWidget {
  int buildcheck = 0;

  BussinesCommunitiesScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(bussinesCommunitiesProvider.notifier);
    final state = ref.watch(bussinesCommunitiesProvider);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    print('build check  ${buildcheck++}');

    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: myGradientColor),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  expansionTileTheme: const ExpansionTileThemeData(
                    backgroundColor: Colors.transparent,
                  ),
                ),
                child: ExpansionTile(
                  title: Text(
                    'Providers',
                    style: GoogleFonts.quicksand(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteColor),
                  ),
                  trailing: Icon(
                    Icons.add,
                    color: whiteColor,
                  ),
                  children: buildBusinessProvidersFilter(controller, state),
                ),
              ),
            ),
            20.ph,
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: myGradientColor),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  expansionTileTheme: const ExpansionTileThemeData(
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
                  gradient: myGradientColor),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  expansionTileTheme: const ExpansionTileThemeData(
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
            20.ph,
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: myGradientColor),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  expansionTileTheme: const ExpansionTileThemeData(
                    backgroundColor: Colors.transparent,
                  ),
                ),
                child: ExpansionTile(
                  iconColor: Colors.white,
                  collapsedIconColor: whiteColor,
                  backgroundColor: Colors.transparent,
                  title: Text(
                    'Industries Filter',
                    style: GoogleFonts.quicksand(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteColor),
                  ),
                  children: buildIndustriesFilter(controller, state),
                ),
              ),
            ),
          ],
        ),
      ),

      key: scaffoldKey,

      appBar: MyAppBar(
          showBell: false,
          showBackButton: true,
          title: "Bussiness Communities",
          filterOnPressed: () {
            scaffoldKey.currentState?.openEndDrawer();
          }),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => controller.BussinesCommunitiesViewApi(
          bearerToken: state.person.Bearer!,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            26.ph,
            Row(
              children: [
                Container(
                  width: 281.w,
                  height: 36.h,
                  margin: const EdgeInsets.only(left: 26).r,

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
                        contentPadding: const EdgeInsets.only(left: 20).r,
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
                            controller.bussinesCommunitySearchApi(
                                query: controller.searchController.text.trim());
                          },
                          child: Container(
                            padding: const EdgeInsets.only(right: 22).r,
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
                          borderSide:
                              const BorderSide(color: Color(0xffDEDEDE)),
                        ),
                        focusColor: blueColor),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      controller.searchController.clear();

                      controller.BussinesCommunitiesViewApi(
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
              // 20.ph,
              if (state.companiesApiList.isEmpty) ...[
                Center(
                  child: Text(
                    'No Community Found.',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: HexColor('#EB2F2F')),
                  ),
                ),
              ] else
                Expanded(
                    child: ListView.builder(
                  itemCount: state.companiesApiList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                            bussinesCommunityDetailPage,
                            pathParameters: {
                              'id': state.companiesApiList[index].id.toString()
                            },
                            extra: state.person.Bearer);
                      },
                      child: Container(
                        // width: 386.w,
                        // height: 171.h,
                        margin:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h)
                                .r,
                        padding: const EdgeInsets.only(
                                left: 20, top: 18, right: 0, bottom: 10)
                            .r,

                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: const Offset(
                                    0, 4), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(6.4.r),
                            color: HexColor('#FCFCFC')),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // SizedBox(
                                //   // width: double.infinity,
                                //   //height: 200.h,
                                //   child: Wrap(
                                //     children: [
                                //       if (state.companiesApiList[index]
                                //           .companyName.isNotEmpty) ...[
                                //         Container(
                                //           width: 10.w,
                                //           height: 10.h,
                                //           // margin: const EdgeInsets.symmetric(
                                //           //         horizontal: 10)
                                //           //     .r,
                                //           padding: const EdgeInsets.all(10).r,
                                //           decoration: BoxDecoration(
                                //               border: Border.all(
                                //                   color: HexColor('#08B783'))),
                                //           child: state.companiesApiList[index]
                                //                   .companyName.isNotEmpty
                                //               ? CachedNetworkImage(
                                //                   imageUrl: Api
                                //                           .originalImageBaseUrl +
                                //                       state
                                //                           .companiesApiList[index]
                                //                           .logoPath
                                //                           .toString() +
                                //                       state
                                //                           .companiesApiList[index]
                                //                           .logoPath
                                //                           .toString(),
                                //                   fit: BoxFit.fill,
                                //                 )
                                //               : SvgPicture.asset(
                                //                   'assets/images/building.svg',
                                //                   // width: 100.w,
                                //                   // height: 100.h,
                                //                 ),
                                //         ),
                                //       ] else
                                //         Container(
                                //           width: 10.w,
                                //           height: 10.h,
                                //           // margin: const EdgeInsets.symmetric(
                                //           //         horizontal: 10)
                                //           //     .r,
                                //           padding: const EdgeInsets.all(10).r,
                                //           decoration: BoxDecoration(
                                //             border: Border.all(
                                //                 color: HexColor('#08B783')),
                                //           ),
                                //           child: SvgPicture.asset(
                                //             'assets/images/bccard.svg',
                                //             fit: BoxFit.contain,
                                //             width: 10.w,
                                //             height: 10.h,
                                //           ),
                                //         ),
                                //     ],
                                //   ),
                                // ),
                                // SvgPicture.asset('assets/images/bccard.svg'),
                                // 28.pw,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 200.w,
                                          child: Text(
                                            state.companiesApiList[index]
                                                .companyName
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.ubuntu(
                                                color: HexColor('#404345'),
                                                letterSpacing: 0.0015,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        20.pw,
                                        SvgPicture.asset(
                                            'assets/images/bccard.svg'),
                                      ],
                                    ),
                                    9.ph,
                                    SizedBox(
                                      width: 150.w,
                                      child: Text(
                                        'CompanyId - 100002A',
                                        style: GoogleFonts.ubuntu(
                                            color: HexColor('#AAAAAA'),
                                            letterSpacing: 0.0015,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    4.ph,
                                    SizedBox(
                                      width: 150.w,
                                      child: Text(
                                        'Industries - Agriculture',
                                        style: GoogleFonts.ubuntu(
                                            color: HexColor('#AAAAAA'),
                                            letterSpacing: 0.0015,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    4.ph,
                                    SizedBox(
                                      width: 220.w,
                                      child: Text(
                                        'Business Activities - Energy (Oil & Gas, Power)',
                                        style: GoogleFonts.ubuntu(
                                            color: HexColor('#AAAAAA'),
                                            letterSpacing: 0.0015,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                  ],
                                ),
                                13.pw,
                                // Container(
                                //   constraints: BoxConstraints(
                                //     minWidth: 79.w,
                                //     maxWidth: 79.w,
                                //   ),
                                //   height: 22.h,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(10).r,
                                //     // color: (state.companiesApiList[index]
                                //     //             .primaryActivity ==
                                //     //         'buyer')
                                //     //     ? Color(0xff47A7CA)
                                //     //     : Color(0xff3067AB),
                                //   ),
                                //   child: Center(
                                //     child: AutoSizeText(
                                //       state.companiesApiList[index]
                                //           .primaryActivity
                                //           .toString()
                                //           .toUpperCase(),
                                //       maxLines: 1,
                                //       textAlign: TextAlign.center,
                                //       style: GoogleFonts.poppins(
                                //         fontSize: 12.sp,
                                //         fontWeight: FontWeight.w500,
                                //         letterSpacing: 0.5,
                                //         color: Colors.black,
                                //       ),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                            14.ph,
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: const Color(0xff33A7ED),
                                  size: 16.h,
                                ),
                                10.pw,
                                SizedBox(
                                  width: 80.w,
                                  child: AutoSizeText(
                                    state.companiesApiList[index].mobileNo
                                        .toString(),
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5,
                                      color: HexColor('#1F3996'),
                                    ),
                                  ),
                                ),
                                10.pw,
                                // Icon(
                                //   Icons.email_outlined,
                                //   color: const Color(0xff33A7ED),
                                //   size: 16.h,
                                // ),
                                // 5.pw,
                                // SizedBox(
                                //   width: 50.w,
                                //   child: AutoSizeText(
                                //     state.companiesApiList[index].email
                                //         .toString(),
                                //     maxLines: 1,
                                //     overflow: TextOverflow.ellipsis,
                                //     style: GoogleFonts.poppins(
                                //       fontSize: 12.sp,
                                //       fontWeight: FontWeight.w400,
                                //       color: HexColor('#1F3996'),
                                //     ),
                                //   ),
                                // ),
                                // 10.pw,
                                Icon(
                                  Icons.location_city,
                                  color: const Color(0xff33A7ED),
                                  size: 16.h,
                                ),
                                //10.pw,
                                SizedBox(
                                  width: 80.w,
                                  child: AutoSizeText(
                                    'Al Khobar',
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5,
                                      color: HexColor('#1F3996'),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.local_activity_sharp,
                                  color: const Color(0xff33A7ED),
                                  size: 16.h,
                                ),
                                //10.pw,
                                SizedBox(
                                  width: 80.w,
                                  child: Text(
                                    (state.companiesApiList[index]
                                                .primaryActivity ==
                                            'service-provider')
                                        ? 'S-Provider'
                                        : state.companiesApiList[index]
                                            .primaryActivity
                                            .toString()
                                            .toUpperCase(),
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5,
                                      color: HexColor('#1F3996'),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // 27.ph,
                            // Divider(
                            //   indent: 25,
                            //   endIndent: 25,
                            // ),
                            // 15.ph,
                            // Container(
                            //   width: 300.w,
                            //   height: 27.h,
                            //   decoration: BoxDecoration(
                            //       color: HexColor('#F6F6F6'),
                            //       borderRadius: BorderRadius.circular(16),
                            //       border:
                            //           Border.all(color: HexColor('#E1E3E6'))),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceEvenly,
                            //     children: [
                            //       SvgPicture.asset(
                            //         'assets/images/bc_chat.svg',
                            //         height: 14.h,
                            //         width: 15.01.w,
                            //       ),
                            //       Text(
                            //         'Chat',
                            //         style: GoogleFonts.quicksand(
                            //             fontWeight: FontWeight.w600,
                            //             fontSize: 12.sp,
                            //             color: HexColor('#4B6FFF')),
                            //       ),
                            //       VerticalDivider(
                            //         color: HexColor('#E1E3E6'),
                            //       ),
                            //       SvgPicture.asset(
                            //         'assets/images/bc_share.svg',
                            //         height: 14.h,
                            //         width: 15.01.w,
                            //       ),
                            //       Text('Share',
                            //           style: GoogleFonts.quicksand(
                            //               fontWeight: FontWeight.w600,
                            //               fontSize: 12.sp,
                            //               color: HexColor('#4B6FFF'))),
                            //       VerticalDivider(
                            //         color: HexColor('#E1E3E6'),
                            //       ),
                            //       SvgPicture.asset(
                            //         'assets/images/bc_detail.svg',
                            //         height: 14.h,
                            //         width: 15.01.w,
                            //       ),
                            //       Text('Details',
                            //           style: GoogleFonts.quicksand(
                            //               fontWeight: FontWeight.w600,
                            //               fontSize: 12.sp,
                            //               color: HexColor('#4B6FFF'))),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                ))
            ] else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    "No Search Query Data Found",
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: HexColor('#EB2F2F')),
                  ),
                ),
              ),
          ],
        ),
      ),

      // ),
    );
  }
}

List<Widget> buildBusinessActivitiesFilter(
    BussinesCommunitiesController controller, BussinesCommunitiesState state) {
  return [
    Container(
      width: double.infinity,
      // height: 437,
      padding: const EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: HexColor('#FFFFFF'),
          border: Border.all(color: HexColor('#7F7F8A4D'))),
      child: Wrap(
        spacing: 8.0, // Gap between adjacent chips.
        runSpacing: 4.0, // Gap between lines.
        children: state.isic4MainActivities!.map((sector) {
          bool isSelected = sector.id == state.selectedSectorId;

          // int index = businessSectors.indexOf(sector);
          // bool isSelected = sector['isChecked'];

          return GestureDetector(
            onTap: () {
              controller.setSelectedSectorId(sector.id!);
            },
            child: FilterButton(
                name: sector.mainActivityName!, isSelected: isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}

List<Widget> buildIndustriesFilter(
    BussinesCommunitiesController controller, BussinesCommunitiesState state) {
  return [
    Container(
      width: double.infinity,
      // height: 437,
      padding: const EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: HexColor('#FFFFFF'),
          border: Border.all(color: HexColor('#7F7F8A4D'))),
      child: Wrap(
        spacing: 8.0, // Gap between adjacent chips.
        runSpacing: 4.0, // Gap between lines.
        children: state.industries!.map((sector) {
          bool isSelected = sector.id == state.selectedIndustryId;

          // int index = businessSectors.indexOf(sector);
          // bool isSelected = sector['isChecked'];

          return GestureDetector(
            onTap: () {
              controller.setSelectedIndustryId(sector.id!);
            },
            child: FilterButton(name: sector.name!, isSelected: isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}

List<Widget> buildBusinessProvidersFilter(
    BussinesCommunitiesController controller, BussinesCommunitiesState state) {
  return [
    Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: HexColor('#FFFFFF'),
          border: Border.all(color: HexColor('#7F7F8A4D'))),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: controller.businessProviders.map((sector) {
          //bool isSelected = sector['id'] == state.selectedProviderId;
          bool isSelected = sector['isChecked'];

          return GestureDetector(
            onTap: () {
              // Check if the tapped button is already selected
              if (sector['isChecked']) {
                // If yes, revert its state
                sector['isChecked'] = false;

                controller.BussinesCommunitiesViewApi(
                    bearerToken: state.person.Bearer);
              } else {
                // If no, unselect all other buttons
                for (var s in controller.businessProviders) {
                  s['isChecked'] = false;
                }
                // Select the tapped button
                sector['isChecked'] = true;

                // Trigger the first API call with the selected sector's ID
                controller.companyBussinesFilterApi(
                    bussinestype: sector['name']);
              }
            },
            child: FilterButton(name: sector['name'], isSelected: isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}

List<Widget> buildSortFilter(
    BussinesCommunitiesController controller, BussinesCommunitiesState state) {
  return [
    Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),
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

                controller.BussinesCommunitiesViewApi(
                    bearerToken: state.person.Bearer);
              } else {
                // If no, unselect all other buttons
                for (var s in sortList) {
                  s['isChecked'] = false;
                }
                // Select the tapped button
                sector['isChecked'] = true;

                // Trigger the first API call with the selected sector's ID
                controller.companyFilterApi(filtertype: sector['name']);
              }
            },
            child: FilterButton(name: sector['name'], isSelected: isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}
