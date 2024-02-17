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
import '../../../../Constants/Global/GlobalList/global_lists.dart';
import '../../../../Constants/constants.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../Controller/investMent_Opportunity_controller.dart';

class InvestMentOpportunityView extends ConsumerWidget {
  const InvestMentOpportunityView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(investMentOpportunityStateProvider.notifier);
    final state = ref.watch(investMentOpportunityStateProvider);
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
      key: scaffoldKey,
      appBar: MyAppBar(
          title: 'Investment Opportunities',
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
                      // controller.debounce(() {
                      //   controller.bussinesCommunitySearchApi(query: query);

                      // });
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
                      // controller.BussinesCommunitiesViewApi(
                      //     bearerToken: state.person.Bearer);
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
            else if (state.responseStatus == Status.completed)
              Expanded(
                  child: ListView.builder(
                itemCount: state.investmentsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var investments = state.investmentsList[index];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      height: 461.h,
                      margin:
                          const EdgeInsets.only(top: 26, left: 27, right: 27).r,
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 21,
                        right: 25,
                      ).r,
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
                              investments.title.toString(),
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
                              investments.interest.toString(),
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
                                investments.interest.toString(),
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
                            investments.postedDesignation.toString(),
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
                              AutoSizeText(
                                investments.locationPreference.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: HexColor('#707070')),
                              ),
                              AutoSizeText(
                                investments.companies!.primaryActivity
                                    .toString(),
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
                                investments.companies!.companyName.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: HexColor('#707070')),
                              ),
                              AutoSizeText(
                                investments.establishedDate.toString(),
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
                            investments.targetSellingPrice.toString(),
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
                              investments.businessOverview.toString(),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: HexColor('#707070')),
                            ),
                          ),
                          20.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  GoRouter.of(context).pushNamed(
                                      investmentDetailPage,
                                      pathParameters: {
                                        'id': state.investmentsList[index].id
                                            .toString()
                                      },
                                      extra: controller.person!.Bearer);
                                },
                                child: Container(
                                  height: 32.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(16).r,
                                      border: Border.all(
                                          color: HexColor('#27BCEB'))),
                                  child: Center(
                                    child: Text(
                                      'Detail',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10.sp,
                                          color: HexColor('#27BCEB')),
                                    ),
                                  ),
                                ),
                              ),
                              //30.pw,
                              Container(
                                width: 120.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  color: HexColor('#27BCEB'),
                                  borderRadius: BorderRadius.circular(16).r,
                                ),
                                child: Center(
                                  child: Text(
                                    'Respond',
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
                  );
                },
              ))
            else
              const Text("SomeThing went Wrong"),
          ],
        ),
      ),
    );
  }
}

List<Widget> buildBusinessActivitiesFilter(
    InvestMentOpportunityController controller,
    InvestMentOpportunityState state) {
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
        children: businessSectors.map((sector) {
          int index = businessSectors.indexOf(sector);
          bool isSelected = sector['isChecked'];

          return GestureDetector(
              onTap: () {
                // Unselect all other buttons
                for (var s in businessSectors) {
                  s['isChecked'] = false;
                }
                // Select the tapped button
                sector['isChecked'] = true;

                // Trigger the API call with the selected sector's ID
                // controller
                //     .companyBussinesIsic4mainActivityFilterApi(sector['id']);
              },
              child: buttonForFilter(sector['main_activity_name'], isSelected)
              //  Container(
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
              //       sector['main_activity_name'],
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

List<Widget> buildIndustriesFilter(InvestMentOpportunityController controller,
    InvestMentOpportunityState state) {
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
                //controller.companyBussinesIndustryFilterApi(sector['id']);
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

List<Widget> buildSortFilter(InvestMentOpportunityController controller,
    InvestMentOpportunityState state) {
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
                // controller.companyFilterApi(filtertype: sector['name']);
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
      color: isSelected ? Color(0xff28B9EB) : Colors.white,
    ),
    height: 33.h,
    //width: 120,
    child: Center(
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
  );
}
