import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
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
import '../../../../Widgets/Loader/loader.dart';
import '../Controller/sale_bussines_controller.dart';

class BussinesForSale extends ConsumerWidget {
  const BussinesForSale({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(businessForSaleControllerProvider.notifier);
    final state = ref.watch(businessForSaleControllerProvider);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
                              'sortBy':
                                  expanded, // Use unique keys for each tile, e.g., 'sortBy', 'providers'
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
          title: 'Bussines For Sale',
          showBell: false,
          filterOnPressed: () {
            scaffoldKey.currentState?.openEndDrawer();
          }),
      body: SafeArea(
        child: Column(
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
                            controller.bussinesForSaleSearchApi(
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
                10.pw,
                IconButton(
                    onPressed: () {
                      controller.searchController.clear();
                      controller.bussinesForSaleSearchApi();
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
              if (state.businesses.isEmpty) ...[
                Center(
                  child: Text(
                    'No Bussines Found.',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: HexColor('#EB2F2F')),
                  ),
                ),
              ] else
                Expanded(
                    child: ListView.builder(
                  itemCount: state.businesses.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var saleBussines = state.businesses[index];
                    print(saleBussines);
                    return InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(saleBussinesDetailPage,
                            pathParameters: {
                              'id': state.businesses[index].id.toString()
                            },
                            extra: controller.person!.Bearer);
                      },
                      child: Container(
                        // height: 461.h,
                        margin:
                            const EdgeInsets.only(top: 26, left: 27, right: 27)
                                .r,
                        padding: const EdgeInsets.only(
                                top: 15, left: 21, right: 25, bottom: 30)
                            .r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5).r,
                          border: Border.all(
                              color: const Color(0xff26BDEB), width: 2),
                          color: HexColor('#FFFFFF'),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: AutoSizeText(
                                saleBussines.title.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: HexColor('#707070')),
                              ),
                            ),
                            Center(
                              child: AutoSizeText(
                                saleBussines.interest.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: HexColor('#707070')),
                              ),
                            ),
                            19.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  saleBussines.interest.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                                SvgPicture.asset('assets/images/msg_phone.svg'),
                              ],
                            ),
                            AutoSizeText(
                              saleBussines.postedDesignation.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: HexColor('#707070')),
                            ),
                            17.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  'Location',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                                AutoSizeText(
                                  'Industries',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 140.w,
                                  child: AutoSizeText(
                                    'saleBussines.locationPreference.toString()',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: HexColor('#707070')),
                                  ),
                                ),
                                AutoSizeText(
                                  saleBussines.companies!.industry.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                              ],
                            ),
                            11.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  'Posted By',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                                AutoSizeText(
                                  'Established Date',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  saleBussines.companies!.companyName
                                      .toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                                AutoSizeText(
                                  saleBussines.establishedDate.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                              ],
                            ),
                            11.ph,
                            AutoSizeText(
                              'Business for Sale',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: HexColor('#707070')),
                            ),
                            AutoSizeText(
                              saleBussines.targetSellingPrice.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: HexColor('#707070')),
                            ),
                            18.ph,
                            AutoSizeText(
                              'Description',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: HexColor('#0D0B0C')),
                            ),
                            11.ph,
                            Container(
                              width: 307.w,
                              height: 82.h,
                              padding: const EdgeInsets.only(
                                      left: 16, top: 11, bottom: 11, right: 33)
                                  .r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xfff3f4f5)),
                              child: AutoSizeText(
                                saleBussines.businessOverview.toString(),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: HexColor('#707070')),
                              ),
                            ),
                            // 20.ph,
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () {
                            //         GoRouter.of(context).pushNamed(
                            //             saleBussinesDetailPage,
                            //             pathParameters: {
                            //               'id': state.businesses[index].id
                            //                   .toString()
                            //             },
                            //             extra: controller.person!.Bearer);
                            //       },
                            //       child: CustomButton(
                            //         height: 32.h,
                            //         width: 120.w,
                            //         borderColor: HexColor('#27BCEB'),
                            //         text: 'Detail',
                            //         textColor: HexColor('#27BCEB'),
                            //       ),
                            //     ),
                            //     //30.pw,
                            //     CustomButton(
                            //       height: 32.h,
                            //       width: 120.w,
                            //       color: HexColor('#27BCEB'),
                            //       text: 'Respond',
                            //     ),
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
                padding: const EdgeInsets.symmetric(vertical: 20).r,
                child: Center(
                  child: Text(
                    "No Bussines Found",
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
    );
  }
}

List<Widget> buildBusinessActivitiesFilter(
    BusinessForSaleController controller, BusinessForSaleState state) {
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
            child: buttonForFilter(sector.mainActivityName, isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}

List<Widget> buildIndustriesFilter(
    BusinessForSaleController controller, BusinessForSaleState state) {
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
            child: buttonForFilter(sector.name, isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}

List<Widget> buildSortFilter(
    BusinessForSaleController controller, BusinessForSaleState state) {
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

                controller.loadBusinessesForSale();
              } else {
                // If no, unselect all other buttons
                for (var s in sortList) {
                  s['isChecked'] = false;
                }
                // Select the tapped button
                sector['isChecked'] = true;

                // Trigger the first API call with the selected sector's ID
                controller.bussinesSortApi(filtertype: sector['name']);
              }
            },
            child: buttonForFilter(sector['name'], isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}

Widget buttonForFilter(name, isSelected) {
  return Container(
    margin: const EdgeInsets.only(
      top: 10,
    ),
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xffD9D9D9)),
        color: isSelected ? const Color(0xff28B9EB) : whiteColor),
    height: 33.h,
    //width: 120,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AutoSizeText(
            name,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: isSelected ? whiteColor : const Color(0xff454544)),
          ),
        ),
        Icon(
          isSelected ? Icons.close : Icons.add,
          color: isSelected ? whiteColor : const Color(0xff28B9EB),
          size: 18,
        )
      ],
    ),
  );
}
