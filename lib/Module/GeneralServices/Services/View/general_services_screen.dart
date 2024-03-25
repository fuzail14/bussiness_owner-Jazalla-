import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
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
import '../../../../Constants/api_routes.dart';
import '../../../../Constants/constants.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Widgets/CustomButton/custom_button.dart';
import '../../../../Widgets/CustomDialog/custom_dialog.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../../../../Widgets/StarRating/star_rating.dart';
import '../Controller/general_service_controller.dart';

class GeneralServiceView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(generalServiceStateProvider.notifier);
    final state = ref.watch(generalServiceStateProvider);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                  gradient: myGradientColor),
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
                    'Product Classification Filter',
                    style: GoogleFonts.quicksand(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: whiteColor),
                  ),
                  children: buildBusinessActivitiesFilter(controller, state),
                ),
              ),
            ),
          ],
        ),
      ),
      key: _scaffoldKey,
      appBar: MyAppBar(
          title: 'General Service',
          size: 50.h,
          showBell: false,
          filterOnPressed: () {
            _scaffoldKey.currentState?.openEndDrawer();
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
                            controller.serviceSearchApi(
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
                      controller.loadServices();
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
              if (state.servicesList.isEmpty) ...[
                Center(
                  child: Text(
                    'No Services Found.',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: HexColor('#EB2F2F')),
                  ),
                ),
              ] else
                Expanded(
                    child: ListView.builder(
                  itemCount: state.servicesList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var services = state.servicesList[index];
                    return InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(serviceDetailPage,
                            pathParameters: {'id': services.id.toString()},
                            extra: controller.person);
                      },
                      child: Container(
                        // height: 325.h,
                        margin: const EdgeInsets.only(
                                top: 15, left: 27, right: 27, bottom: 15)
                            .r,
                        padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 23, bottom: 20)
                            .r,
                        color: HexColor('#F3F4F5'),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //first card
                            Container(
                              width: 328.w,
                              height: 166.h,
                              padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10)
                                  .r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16).r,
                                color: Colors.white,
                              ),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    //height: 200.h,
                                    child: Wrap(
                                      children: [
                                        if (services.photos!.isNotEmpty) ...[
                                          Container(
                                            width: 100.w,
                                            height: 100.h,
                                            // margin: const EdgeInsets.symmetric(
                                            //         horizontal: 10)
                                            //     .r,
                                            padding: const EdgeInsets.all(10).r,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        detailCradBorderColor)),
                                            child: services.photos!.isNotEmpty
                                                ? CachedNetworkImage(
                                                    imageUrl:
                                                        Api.originalImageBaseUrl +
                                                            services.photos!
                                                                .first.imagePath
                                                                .toString() +
                                                            services.photos!
                                                                .first.imageName
                                                                .toString(),
                                                    fit: BoxFit.fill,
                                                  )
                                                : SvgPicture.asset(
                                                    'assets/images/building.svg',
                                                    width: 100.w,
                                                    height: 100.h,
                                                  ),
                                          ),
                                        ] else
                                          Container(
                                            width: 100.w,
                                            height: 100.h,
                                            // margin: const EdgeInsets.symmetric(
                                            //         horizontal: 10)
                                            //     .r,
                                            padding: const EdgeInsets.all(10).r,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: HexColor('#08B783')),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/images/building.svg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 110,
                                    ).r,
                                    child: StarRating(
                                      color: HexColor('#FCAB10'),
                                      rating: 4,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 110,
                                      top: 10,
                                      right: 30,
                                    ).r,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          services.name.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                        5.ph,
                                        AutoSizeText(
                                          services.companies!.companyName
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: HexColor('#6A7380')),
                                        ),
                                        AutoSizeText(
                                          services.unitPrice.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color: HexColor('#6A7380')),
                                        ),
                                        AutoSizeText(
                                          services.salePrice.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                        5.ph,
                                        AutoSizeText(
                                          services.companies!.companyCode
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.favorite_border,
                                      size: 20.h,
                                      color: HexColor('#6A7380'),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            12.ph,
                            //detail

                            Text(
                              'Description',
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: HexColor('#000000')),
                            ),
                            5.ph,

                            AutoSizeText(
                              services.description.toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: HexColor('#0D0B0C')),
                            ),
                            // 20.ph,
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () {
                            //         services.id;
                            //         controller.person.data!.id;
                            //         services.companyId;
                            //         controller.person.data!.companyId;
                            //         print(services.id);
                            //         print(
                            //             "user id ${controller.person.data!.id}");
                            //         print(services.companyId);
                            //         print(
                            //             "buyer id ${controller.person.data!.companyId}");

                            //         final quoteData = {
                            //           'serviceId': services.id,
                            //           'serviceCompanyId': services.companyId,
                            //           'userId': controller.person.data!.id,
                            //           'userCompanyId':
                            //               controller.person.data!.companyId
                            //         };

                            //         GoRouter.of(context).pushNamed(
                            //           requestProposalScreen,
                            //           extra: quoteData,
                            //         );
                            //       },
                            //       child: CustomButton(
                            //         height: 28.h,
                            //         width: 120.w,
                            //         borderColor: HexColor('#27BCEB'),
                            //         text: 'Request Proposal',
                            //         textColor: HexColor('#27BCEB'),
                            //       ),
                            //     ),
                            //     //30.pw,
                            //     GestureDetector(
                            //       onTap: () {
                            //         services.id;
                            //         controller.person.data!.id;
                            //         services.companyId;

                            //         final inquiryData = {
                            //           'serviceId': services.id,
                            //           'title': services.name,
                            //           'userId': controller.person.data!.id,
                            //           'userCompanyId':
                            //               controller.person.data!.companyId,
                            //           'companyId': services.companyId,
                            //         };

                            //         GoRouter.of(context).pushNamed(
                            //           serviceinquiryScreen,
                            //           extra: inquiryData,
                            //         );
                            //       },
                            //       child: CustomButton(
                            //         height: 28.h,
                            //         width: 120.w,
                            //         color: HexColor('#27BCEB'),
                            //         text: 'Send Inquiry',
                            //       ),
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
    );
  }
}

List<Widget> buildBusinessActivitiesFilter(
    GeneralServiceController controller, GeneralServiceState state) {
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

List<Widget> buildSortFilter(
    GeneralServiceController controller, GeneralServiceState state) {
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
                //controller.companyFilterApi(filtertype: sector['name']);
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
