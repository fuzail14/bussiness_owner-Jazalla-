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
import '../../../../Constants/Global/GlobalList/global_lists.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Routes/set_routes.dart';
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
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    print('build check  ${buildcheck++}');

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
                  trailing: Icon(
                    Icons.add,
                    color: whiteColor,
                  ),
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
                  children: buildBusinessActivitiesFilter(controller, state),
                ),
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

      key: _scaffoldKey,

      appBar: MyAppBar(
          showBell: false,
          title: "Bussiness Communities",
          filterOnPressed: () {
            _scaffoldKey.currentState?.openEndDrawer();
          }),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => controller.BussinesCommunitiesViewApi(
          bearerToken: state.person.Bearer!,
        ),
        child: Column(
          children: [
            26.ph,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        // onChanged: (value) => controller.debounce(
                        //   () async {
                        //     print('ab aya');
                        //     if (value == '') {
                        //       print('please enter something');
                        //     } else {
                        //       print('idhr aya');
                        //       controller.bussinesCommunitySearchApi(query: value);
                        //     }
                        //   },
                        // ),
                        onChanged: (query) {
                          controller.debounce(() {
                            controller.bussinesCommunitySearchApi(query: query);
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "What are you looking for?",
                          hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: HexColor('#75788D')),
                          suffixIcon: GestureDetector(
                            onTap: () {},
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

                // 20.ph,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     CustomButton(
                //       onTap: () {
                //         controller.showBusinessSectorsSheet(context, ref);
                //       },
                //       text: 'Business Sectors',
                //       height: 25.h,
                //       width: 117.w,
                //       color: Color(0xffFBFBFB),
                //       borderColor: Color(0xffDEDEDE),
                //       textColor: Color(0xff75788D),
                //       margin: EdgeInsets.symmetric(horizontal: 26).r,
                //     ),
                //     CustomButton(
                //       text: 'Response Filter',
                //       height: 25.h,
                //       width: 117.w,
                //       color: Color(0xff23C2EA),
                //       borderColor: Color(0xffDEDEDE),
                //       textColor: Color(0xffFFFFFF),
                //     ),
                //   ],
                // )
              ],
            ),
            if (state.responseStatus == Status.loading)
              const Loader()
            else if (state.responseStatus == Status.completed) ...[
              20.ph,
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
                        width: 386.w,
                        height: 177.h,
                        margin: EdgeInsets.only(
                          left: 24.w,
                          right: 24.w,
                          top: 12.h,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.4.r),
                            color: HexColor('#FCFCFC')),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                      left: 17, top: 18, right: 30)
                                  .r,
                              child: Row(
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
                                  SvgPicture.asset('assets/images/bccard.svg'),
                                  20.pw,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: AutoSizeText(
                                          state.companiesApiList[index]
                                              .companyName,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.ubuntu(
                                              color: HexColor('#404345'),
                                              fontStyle: FontStyle.normal,
                                              letterSpacing: 0.0015,
                                              fontSize: ScreenUtil().setSp(16),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        state.companiesApiList[index].mobileNo
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.ubuntu(
                                            color: HexColor('#AAAAAA'),
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: 0.0015,
                                            fontSize: ScreenUtil().setSp(12),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  20.pw,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/phone_email_location.svg'),
                                      20.ph,
                                      Container(
                                        constraints: BoxConstraints(
                                          minWidth: 79.w,
                                          maxWidth: 79.w,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w),
                                        height: 22.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10).r,
                                          color: (state.companiesApiList[index]
                                                      .primaryActivity ==
                                                  'buyer')
                                              ? Color(0x5933a7ed)
                                              : Color(0x594b6fff),
                                        ),
                                        child: Center(
                                          child: AutoSizeText(
                                              state.companiesApiList[index]
                                                  .primaryActivity
                                                  .toString(),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.5,
                                                color: HexColor('#2984BB'),
                                              ),
                                              minFontSize: 8),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            27.ph,
                            Divider(
                              indent: 25,
                              endIndent: 25,
                            ),
                            15.ph,
                            Container(
                              width: 300.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                  color: HexColor('#F6F6F6'),
                                  borderRadius: BorderRadius.circular(16),
                                  border:
                                      Border.all(color: HexColor('#E1E3E6'))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/bc_chat.svg',
                                    height: 14.h,
                                    width: 15.01.w,
                                  ),
                                  Text(
                                    'Chat',
                                    style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: HexColor('#4B6FFF')),
                                  ),
                                  VerticalDivider(
                                    color: HexColor('#E1E3E6'),
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/bc_share.svg',
                                    height: 14.h,
                                    width: 15.01.w,
                                  ),
                                  Text('Share',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          color: HexColor('#4B6FFF'))),
                                  VerticalDivider(
                                    color: HexColor('#E1E3E6'),
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/bc_detail.svg',
                                    height: 14.h,
                                    width: 15.01.w,
                                  ),
                                  Text('Details',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          color: HexColor('#4B6FFF'))),
                                ],
                              ),
                            ),
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
      padding: EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: HexColor('#FFFFFF'),
          border: Border.all(color: HexColor('#7F7F8A4D'))),
      child: Wrap(
        spacing: 8.0, // Gap between adjacent chips.
        runSpacing: 4.0, // Gap between lines.
        children: state.isic4MainActivities!.map((sector) {
          bool isSelected = sector.id == state.selectedSectorId;
          print(isSelected.runtimeType);
          print(isSelected);

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
    BussinesCommunitiesController controller, BussinesCommunitiesState state) {
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
        children: industriesFilter.map((sector) {
          int index = industriesFilter.indexOf(sector);
          bool isSelected = sector['isChecked'];

          return GestureDetector(
              onTap: () {
                // Unselect all other buttons
                for (var s in industriesFilter) {
                  s['isChecked'] = false;
                }
                // Select the tapped button
                sector['isChecked'] = true;

                // Trigger the API call with the selected sector's ID
                controller.companyBussinesIndustryFilterApi(sector['id']);
              },
              child: buttonForFilter(sector['name'], isSelected)
              // Container(
              //   margin: EdgeInsets.only(
              //     top: 10,
              //   ),
              //   decoration: BoxDecoration(
              //     shape: BoxShape.rectangle,
              //     borderRadius: BorderRadius.circular(6),
              //     border: Border.all(color: Color(0xffD9D9D9)),
              //     color: isSelected ? Color(0xff23C2EA) : Colors.white,
              //   ),
              //   height: 33,
              //   //width: 120,
              //   child: Center(
              //     child: AutoSizeText(
              //       sector['name'],
              //       maxLines: 1,
              //       textAlign: TextAlign.center,
              //       style: GoogleFonts.montserrat(
              //           fontSize: 10,
              //           fontWeight: FontWeight.w400,
              //           color: Color(0xff454544)),
              //     ),
              //   ),
              // ),
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
      // height: 437,
      padding: EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: HexColor('#FFFFFF'),
          border: Border.all(color: HexColor('#7F7F8A4D'))),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: controller.businessProviders.map((sector) {
          int index = controller.businessProviders.indexOf(sector);
          bool isSelected = sector['isChecked'];

          return GestureDetector(
              onTap: () {
                // Unselect all other buttons
                for (var s in controller.businessProviders) {
                  s['isChecked'] = false;
                }
                // Select the tapped button
                sector['isChecked'] = true;

                controller.companyBussinesFilterApi(
                    bussinestype: sector['name']);
              },
              child: buttonForFilter(sector['name'], isSelected)
              // Container(
              //   margin: EdgeInsets.only(
              //     top: 10,
              //   ),
              //   decoration: BoxDecoration(
              //     shape: BoxShape.rectangle,
              //     borderRadius: BorderRadius.circular(6),
              //     border: Border.all(color: Color(0xffD9D9D9)),
              //     color: isSelected ? Color(0xff28B9EB) : Colors.white,
              //   ),
              //   height: 33.h,
              //   //width: 120,
              //   child: Center(
              //     child: AutoSizeText(
              //       sector['name'],
              //       maxLines: 1,
              //       textAlign: TextAlign.center,
              //       style: GoogleFonts.montserrat(
              //           fontSize: 10,
              //           fontWeight: FontWeight.w600,
              //           color: isSelected ? whiteColor : Color(0xff454544)),
              //     ),
              //   ),
              // ),
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
      // height: 437,
      padding: EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: HexColor('#FFFFFF'),
          border: Border.all(color: HexColor('#7F7F8A4D'))),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: sortList.map((sector) {
          int index = sortList.indexOf(sector);
          bool isSelected = sector['isChecked'];

          return GestureDetector(
              onTap: () {
                // Unselect all other buttons
                for (var s in sortList) {
                  s['isChecked'] = false;
                }
                // Select the tapped button
                sector['isChecked'] = true;

                // Trigger the API call with the selected sector's ID
                // companyBussinesFilterApi(bussinestype: sector['name']);
                controller.companyFilterApi(filtertype: sector['name']);
              },
              child: buttonForFilter(sector['name'], isSelected)
              // Container(
              //   margin: EdgeInsets.only(
              //     top: 10,
              //   ),
              //   decoration: BoxDecoration(
              //     shape: BoxShape.rectangle,
              //     borderRadius: BorderRadius.circular(6),
              //     border: Border.all(color: Color(0xffD9D9D9)),
              //     color: isSelected ? Color(0xff28B9EB) : Colors.white,
              //   ),
              //   height: 33,
              //   //width: 120,
              //   child: Center(
              //     child: AutoSizeText(
              //       sector['name'],
              //       maxLines: 1,
              //       textAlign: TextAlign.center,
              //       style: GoogleFonts.montserrat(
              //           fontSize: 10,
              //           fontWeight: FontWeight.w600,
              //           color: isSelected ? whiteColor : Color(0xff454544)),
              //     ),
              //   ),
              // ),
              );
        }).toList(),
      ),
    ),
  ];
}

Widget buttonForFilter(name, isSelected) {
  return Container(
    margin: EdgeInsets.only(
      top: 10,
    ),
    decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Color(0xffD9D9D9)),
        color: isSelected ? Color(0xff28B9EB) : whiteColor),
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
                color: isSelected ? whiteColor : Color(0xff454544)),
          ),
        ),
        Icon(
          isSelected ? Icons.close : Icons.add,
          color: isSelected ? whiteColor : Color(0xff28B9EB),
          size: 18,
        )
      ],
    ),
  );
}
