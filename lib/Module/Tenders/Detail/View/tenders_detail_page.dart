import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Constants/api_routes.dart';
import '../../../../Constants/constants.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/CustomButton/custom_button.dart';
import '../../../../Widgets/Loader/loader.dart';

import '../../../../Widgets/StarRating/star_rating.dart';
import '../../Widget/custom_tiles.dart';
import '../Controller/tenders_detail_controller.dart';

class TendersDetailPage extends ConsumerWidget {
  const TendersDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(tenderDetailProvider.notifier);
    final state = ref.watch(tenderDetailProvider);
    return Scaffold(
      appBar: MyAppBar(
        title: "Tender Detail",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          26.ph,
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            //20.ph,
            CustomButton(
              onTap: () {
                // tenders.id;
                // controller.person.data!.id;
                // tenders.companyId;
                // controller.person.data!.companyId;
                // print(tenders.id);
                // print("user id ${controller.person.data!.id}");
                // print(tenders.companyId);
                // print(
                //     "buyer id ${controller.person.data!.companyId}");

                // final quoteData = {
                //   'tenderId': tenders.id,
                //   'tenderCompanyId': tenders.companyId,
                //   'userId': controller.person.data!.id,
                //   'userCompanyId':
                //       controller.person.data!.companyId
                // };

                GoRouter.of(context).pushNamed(
                  tenderResponseScreen,
                  // extra: quoteData,
                );
              },
              width: 140.w,
              height: 32.h,
              text: 'Response',
              color: HexColor('#1F3996'),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: state.tenderDetail.length,
              shrinkWrap: true,
              itemBuilder: (context, outerIndex) {
                var tender = state.tenderDetail[outerIndex];
                return Column(
                  children: [
                    20.ph,

                    //GENERAL INFORMATION

                    Container(
                      width: 333.6700134277344.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
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
                          collapsedIconColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          title: const Text(
                            'General Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 230.h,
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 19)
                                          .r,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14).r,
                                      color: HexColor('#FFFFFF'),
                                      border: Border.all(
                                          color: HexColor('#7F7F8A4D'))),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 22.w,
                                              height: 22.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  color:
                                                      const Color(0x33e1e1e2)),
                                              child: (state
                                                          .tenderDetail[
                                                              outerIndex]
                                                          .companies!
                                                          .logo ==
                                                      null)
                                                  ? SvgPicture.asset(
                                                      'assets/images/building.svg')
                                                  : CachedNetworkImage(
                                                      imageUrl: Api
                                                              .imageBaseUrl +
                                                          tender.companies!.logo
                                                              .toString(),
                                                      fit: BoxFit.contain,
                                                    ),
                                            ),
                                            16.pw,
                                            Text('Details',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        HexColor('#0D0B0C'))),
                                          ],
                                        ),
                                        22.ph,
                                        _generalInfoTileRow(
                                          Icons.location_city,
                                          'Title - ',
                                          tender.title.toString(),
                                        ),
                                        10.ph,
                                        _generalInfoTileRow(
                                          Icons.date_range_sharp,
                                          'Tender End Date - ',
                                          tender.endDate.toString(),
                                        ),
                                        10.ph,
                                        _generalInfoTileRow(
                                          Icons.timer_sharp,
                                          'Tender End Time - ',
                                          tender.endTime.toString(),
                                        ),
                                        10.ph,
                                        _generalInfoTileRow(
                                          Icons.post_add_rounded,
                                          'Posted By - ',
                                          tender.companies!.companyName
                                              .toString(),
                                        ),
                                        11.ph,
                                        const Divider(),
                                        //7.ph,
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.data_exploration_sharp,
                                              size: 12.h,
                                              color: HexColor('#19A3A3'),
                                            ),
                                            9.pw,
                                            if (tender.status == '0') ...[
                                              Text.rich(TextSpan(
                                                  text: 'Status - ',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color:
                                                          HexColor('#757A8E')),
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                      text: 'In-Active',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: HexColor(
                                                              '#0D0B0C')),
                                                    )
                                                  ])),
                                            ] else
                                              Text.rich(TextSpan(
                                                  text: 'Status - ',
                                                  style: GoogleFonts.ubuntu(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color:
                                                          HexColor('#757A8E')),
                                                  children: <InlineSpan>[
                                                    TextSpan(
                                                      text: 'Active',
                                                      style: GoogleFonts.ubuntu(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: HexColor(
                                                              '#0D0B0C')),
                                                    )
                                                  ])),
                                            13.pw,
                                            Text(
                                              'Qualified',
                                              style: GoogleFonts.ubuntu(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: HexColor('#08B71A')),
                                            ),
                                            13.pw,
                                            Text(
                                              'Product',
                                              style: GoogleFonts.ubuntu(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: HexColor('#19A3A3')),
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                                Positioned(
                                  bottom:
                                      0, // Position at the bottom of the Stack
                                  left: 0,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    'assets/images/bc_detailpage_giCard.svg', // Replace with your asset path
                                    width: 333.6700134277344.w,
                                    height: 29.717.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Quailified Sectors
                    20.ph,

                    Container(
                      width: 333.6700134277344.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: myGradientColor),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                          expansionTileTheme: const ExpansionTileThemeData(
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        child: ExpansionTile(
                          title: const Text(
                            'Qualified Sectors',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 200.h,
                                  // padding: EdgeInsets.only(
                                  //         left: 16, top: 12, right: 20)
                                  //   .r,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14).r,
                                      color: HexColor('#FFFFFF'),
                                      border: Border.all(
                                          color: HexColor('#7F7F8A4D'))),

                                  child: DefaultTabController(
                                    length: 2,
                                    child: Column(
                                      children: [
                                        const TabBar(
                                          tabs: [
                                            Tab(text: 'Main Activity'),
                                            Tab(text: 'Sub Category'),
                                          ],
                                        ),
                                        Container(
                                          height: 100.h,
                                          padding: const EdgeInsets.only(
                                            left: 22,
                                            top: 14,
                                          ).r,
                                          child: TabBarView(
                                            children: [
                                              ListView.builder(
                                                // itemCount: tender
                                                //     .qualifiedSectorDetails!
                                                //     .length,
                                                itemCount: tender
                                                        .qualifiedSectorDetails
                                                        ?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  if (tender
                                                          .qualifiedSectorDetails !=
                                                      null) {
                                                    final sectorDetail = tender
                                                            .qualifiedSectorDetails![
                                                        index];
                                                    return Column(
                                                      children: [
                                                        15.ph,
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/images/tick.svg',
                                                              height: 14.h,
                                                              width: 14.w,
                                                            ),
                                                            10.pw,
                                                            SizedBox(
                                                              //height: 100,
                                                              width: 200.w,
                                                              child:
                                                                  AutoSizeText(
                                                                sectorDetail
                                                                    .mainActivity!
                                                                    .customActivityName
                                                                    .toString(),
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.inter(
                                                                    fontSize:
                                                                        8.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: HexColor(
                                                                        '#606060')),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  } else {
                                                    return Container(
                                                      color: Colors.red,
                                                    );
                                                  }
                                                },
                                              ),
                                              ListView.builder(
                                                // Sub Category tab content
                                                // itemCount: tender
                                                //     .qualifiedSectorDetails!
                                                //     .length,
                                                itemCount: tender
                                                        .qualifiedSectorDetails
                                                        ?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  if (tender
                                                          .qualifiedSectorDetails !=
                                                      null) {
                                                    final sectorDetail = tender
                                                            .qualifiedSectorDetails![
                                                        index];
                                                    return Column(
                                                      children: [
                                                        15.ph,
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/images/tick.svg',
                                                              height: 14.h,
                                                              width: 14.w,
                                                            ),
                                                            10.pw,
                                                            SizedBox(
                                                              //height: 100,
                                                              width: 200.w,
                                                              child:
                                                                  AutoSizeText(
                                                                sectorDetail
                                                                    .subCategory!
                                                                    .customCategoryName
                                                                    .toString(),
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.inter(
                                                                    fontSize:
                                                                        8.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: HexColor(
                                                                        '#606060')),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom:
                                      0, // Position at the bottom of the Stack
                                  left: 0,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    'assets/images/bc_detailpage_giCard.svg', // Replace with your asset path
                                    width: 333.6700134277344.w,
                                    height: 29.717.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Bussines Activites
                    20.ph,

                    Container(
                      width: 333.6700134277344.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
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
                          collapsedIconColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          title: const Text(
                            'Business Activites',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          children: [
                            Stack(
                              children: [
                                Container(
                                    width: double.infinity,
                                    // height: 437.h,

                                    padding:
                                        const EdgeInsets.only(bottom: 36).r,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14).r,
                                        color: HexColor('#FFFFFF'),
                                        border: Border.all(
                                            color: HexColor('#7F7F8A4D'))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        custom_tile(
                                          'Tender Type',
                                          tender.tenderType.toString(),
                                        ),
                                        Container(
                                          color: HexColor('#FFFFFF'),
                                          width: double.infinity,
                                          height: 39.h,
                                          padding: const EdgeInsets.only(
                                                  left: 27, right: 27)
                                              .r,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Payment Mode',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: HexColor('#3F3939')),
                                              ),
                                              if (tender.paymentMode ==
                                                  'AP') ...[
                                                Text(
                                                  tender.paymentMode.toString(),
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          HexColor('#3F3939')),
                                                ),
                                              ] else if (tender.paymentMode ==
                                                  '30') ...[
                                                Text(
                                                  'Payment After 30 Days',
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          HexColor('#3F3939')),
                                                ),
                                              ] else if (tender.paymentMode ==
                                                  '60') ...[
                                                Text(
                                                  'Payment After 60 Days',
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          HexColor('#3F3939')),
                                                ),
                                              ] else if (tender.paymentMode ==
                                                  'PoD') ...[
                                                Text(
                                                  'Payment On Delivery',
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          HexColor('#3F3939')),
                                                ),
                                              ]
                                            ],
                                          ),
                                        ),
                                        custom_tile(
                                          'Purchase Type',
                                          tender.type.toString(),
                                        ),
                                        Container(
                                          color: HexColor('#FFFFFF'),
                                          width: double.infinity,
                                          height: 39.h,
                                          padding: const EdgeInsets.only(
                                                  left: 27, right: 27)
                                              .r,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Shipping Location',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: HexColor('#3F3939')),
                                              ),
                                              Text(
                                                tender.locationPreference
                                                    .toString(),
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: HexColor('#3F3939')),
                                              ),
                                            ],
                                          ),
                                        ),
                                        13.ph,
                                        productandServiceInfoCard(
                                          heading: 'Item Summary',
                                          // height: 149.h,
                                          child: AutoSizeText(
                                            tender.description.toString(),
                                            maxLines: 7,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w300,
                                                color: HexColor('#414141')),
                                          ),
                                        ),
                                        productandServiceInfoCard(
                                            heading: 'SEGMENT',
                                            // height: 110.h,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                tender.segment != null
                                                    ? rowText(
                                                        'SEGMENT-',
                                                        tender.segment!
                                                            .segmentName)
                                                    : Container(),

                                                // rowText(
                                                //     'SEGMENT-',
                                                //     tender
                                                //         .segment!.segmentName),

                                                5.ph,
                                                // rowText('FAMILY - ',
                                                //     tender.family!.familyName),
                                                tender.family != null
                                                    ? rowText(
                                                        'FAMILY -',
                                                        tender
                                                            .family!.familyName)
                                                    : Container(),

                                                5.ph,
                                                // rowText('CLASS - ',
                                                //     tender.classObj!.className),
                                                tender.classObj != null
                                                    ? rowText(
                                                        'CLASS -',
                                                        tender.classObj!
                                                            .className)
                                                    : Container(),
                                              ],
                                            )),
                                        productandServiceInfoCard(
                                            heading: 'UNSPSC',
                                            // height: 110.h,
                                            width: 279.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 100.h,
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    // itemCount: tender
                                                    //     .commodities!.length,

                                                    itemCount: tender
                                                            .qualifiedSectorDetails
                                                            ?.length ??
                                                        0,

                                                    itemBuilder:
                                                        (context, index) {
                                                      if (tender
                                                              .qualifiedSectorDetails !=
                                                          null) {
                                                        var commodity =
                                                            tender.commodities![
                                                                index];
                                                        return Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            rowText(
                                                                'Name - ',
                                                                commodity
                                                                    .commodityName
                                                                    .toString()),
                                                            rowText(
                                                                'Code - ',
                                                                commodity
                                                                    .commodityCode
                                                                    .toString()),
                                                          ],
                                                        );
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    )),
                                Positioned(
                                  bottom:
                                      0, // Position at the bottom of the Stack
                                  left: 0,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    'assets/images/bc_detailpage_giCard.svg', // Replace with your asset path
                                    width: 333.6700134277344.w,
                                    height: 29.717.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Quailified Sectors
                    20.ph,

                    Container(
                      width: 333.6700134277344.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: myGradientColor),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                          expansionTileTheme: const ExpansionTileThemeData(
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        child: ExpansionTile(
                          title: const Text(
                            'Required Documents',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 220.h,
                                  // padding: EdgeInsets.only(
                                  //         left: 16, top: 12, right: 20)
                                  //   .r,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14).r,
                                      color: HexColor('#FFFFFF'),
                                      border: Border.all(
                                          color: HexColor('#7F7F8A4D'))),

                                  child: DefaultTabController(
                                    length: 2,
                                    child: Column(
                                      children: [
                                        const TabBar(
                                          tabs: [
                                            Tab(text: 'Government Documents'),
                                            Tab(text: 'Company Documents'),
                                          ],
                                        ),
                                        Container(
                                          height: 120.h,
                                          padding: const EdgeInsets.only(
                                                  left: 12, top: 14, right: 12)
                                              .r,
                                          margin: const EdgeInsets.only(
                                                  left: 12,
                                                  top: 14,
                                                  right: 12,
                                                  bottom: 13)
                                              .r,
                                          decoration: BoxDecoration(
                                            color: HexColor('#F9F9F9'),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.blueAccent
                                                    .withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: TabBarView(
                                            children: [
                                              Column(
                                                children: [
                                                  15.ph,
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/images/tick.svg',
                                                        height: 14.h,
                                                        width: 14.w,
                                                      ),
                                                      10.pw,
                                                      SizedBox(
                                                        //height: 100,
                                                        width: 200.w,
                                                        child: AutoSizeText(
                                                          tender.govtRequirement
                                                              .toString(),
                                                          maxLines: 5,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts.inter(
                                                              fontSize: 8.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: HexColor(
                                                                  '#606060')),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  15.ph,
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/images/tick.svg',
                                                        height: 14.h,
                                                        width: 14.w,
                                                      ),
                                                      10.pw,
                                                      SizedBox(
                                                        //height: 100,
                                                        width: 200.w,
                                                        child: AutoSizeText(
                                                          tender
                                                              .companyRequirement
                                                              .toString(),
                                                          maxLines: 5,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts.inter(
                                                              fontSize: 8.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: HexColor(
                                                                  '#606060')),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom:
                                      0, // Position at the bottom of the Stack
                                  left: 0,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    'assets/images/bc_detailpage_giCard.svg', // Replace with your asset path
                                    width: 333.6700134277344.w,
                                    height: 29.717.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    //ATTACHMENTS
                    20.ph,

                    Container(
                      width: 333.6700134277344.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
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
                          collapsedIconColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          title: const Text(
                            'Attachments',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          children: [
                            Stack(
                              children: [
                                Container(
                                    width: double.infinity,
                                    // height: 437.h,

                                    padding:
                                        const EdgeInsets.only(bottom: 36).r,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14).r,
                                        color: HexColor('#FFFFFF'),
                                        border: Border.all(
                                            color: HexColor('#F9F9F9'))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          color: HexColor('#F9F9F9'),
                                          width: double.infinity,
                                          height: 39.h,
                                          padding: const EdgeInsets.only(
                                                  left: 27, right: 27)
                                              .r,
                                          margin:
                                              const EdgeInsets.only(top: 10).r,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Name',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: HexColor('#3F3939')),
                                              ),
                                              Text(
                                                'UPLOADED AT',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: HexColor('#3F3939')),
                                              ),
                                              Text(
                                                'SIZE',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: HexColor('#3F3939')),
                                              ),
                                              Text(
                                                'DOWNLOAD',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: HexColor('#3F3939')),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: HexColor('#F2F2F2')),
                                            color: HexColor('#FFFFF'),
                                          ),
                                          width: double.infinity,
                                          height: 39.h,
                                          padding: const EdgeInsets.only(
                                                  left: 27, right: 27)
                                              .r,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'index.html',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: HexColor('#3F3939')),
                                              ),
                                              Text(
                                                tender.contractStartDate
                                                    .toString(),
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: HexColor('#3F3939')),
                                              ),
                                              Text(
                                                '01 MB',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: HexColor('#3F3939')),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.download_rounded),
                                                onPressed: () {},
                                                iconSize: 15.w,
                                                color: HexColor('#4E4949'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                                Positioned(
                                  bottom:
                                      0, // Position at the bottom of the Stack
                                  left: 0,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    'assets/images/bc_detailpage_giCard.svg', // Replace with your asset path
                                    width: 333.6700134277344.w,
                                    height: 29.717.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    20.ph,

                    Container(
                      width: 333.6700134277344.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
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
                          collapsedIconColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          title: const Text(
                            'Comments',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          children: [
                            Stack(
                              children: [
                                Container(
                                    width: double.infinity,
                                    // height: 437.h,

                                    padding: const EdgeInsets.only(
                                            bottom: 36,
                                            left: 38,
                                            top: 10,
                                            right: 15)
                                        .r,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14).r,
                                        color: HexColor('#FFFFFF'),
                                        border: Border.all(
                                            color: HexColor('#F9F9F9'))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Comments*',
                                          style: GoogleFonts.poppins(
                                              color: HexColor('#414141'),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        20.ph,
                                        Container(
                                          width: 278.w,
                                          height: 75.h,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          // margin: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xFF08B783),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: const Row(
                                            children: [
                                              Expanded(
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    labelText: 'Comment',
                                                    labelStyle: TextStyle(
                                                        color:
                                                            Color(0xFF08B783)),
                                                    border: InputBorder
                                                        .none, // Remove underline
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        20.ph,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 210)
                                                  .r,
                                          child: Container(
                                            width: 70.w,
                                            height: 20.h,
                                            decoration: BoxDecoration(
                                                color: HexColor('#08B783'),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Text(
                                              'submit',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        15.ph,
                                        Text(
                                          'AL-YAMAMMA',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.quicksand(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                              color: HexColor('#242E42')),
                                        ),
                                        7.ph,
                                        Text(
                                          'If several languages coalesce, the grammar of the resulting language.',
                                          style: GoogleFonts.quicksand(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor('#414141')),
                                        ),
                                        7.ph,
                                        StarRating(
                                          color: HexColor('#FCAB10'),
                                          rating: 4,
                                        ),
                                        31.ph,
                                        Text(
                                          'AL-AJMI',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.quicksand(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                              color: HexColor('#242E42')),
                                        ),
                                        7.ph,
                                        Text(
                                          'If several languages coalesce, the grammar of the resulting language.',
                                          style: GoogleFonts.quicksand(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor('#414141')),
                                        ),
                                        7.ph,
                                        StarRating(
                                          color: HexColor('#FCAB10'),
                                          rating: 3,
                                        ),
                                      ],
                                    )),
                                Positioned(
                                  bottom:
                                      0, // Position at the bottom of the Stack
                                  left: 0,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    'assets/images/bc_detailpage_giCard.svg', // Replace with your asset path
                                    width: 333.6700134277344.w,
                                    height: 29.717.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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

      // ),
    );
  }
}

Widget _generalInfoTileRow(icon, firstText, SecondText) {
  return Row(
    children: [
      Icon(
        icon,
        size: 12.h,
        color: HexColor('#19A3A3'),
      ),
      16.pw,
      Text.rich(TextSpan(
          text: firstText,
          style: GoogleFonts.ubuntu(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: HexColor('#757A8E')),
          children: <InlineSpan>[
            TextSpan(
              text: SecondText,
              style: GoogleFonts.ubuntu(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: HexColor('#0D0B0C')),
            )
          ])),
    ],
  );
}

Widget _generalInfoCard(firstText, SecondText) {
  return Container(
    width: 130.w,
    height: 56.h,
    decoration: BoxDecoration(boxShadow: const [
      BoxShadow(
        color: Colors.grey,
        offset: Offset(0.5, 0.5),
        blurRadius: 1.0,
      ),
    ], borderRadius: BorderRadius.circular(6), color: Colors.white),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SvgPicture.asset(
            'assets/images/bc_detailpage_giCard.svg', // Replace with your asset path
            width: 130.w,
            fit: BoxFit.fitWidth,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 23.065.w,
                height: 22.h,
                margin: const EdgeInsets.only(left: 10.48, top: 10).r,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [HexColor('19A3A3'), HexColor('132F75')])),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/person_icon.svg',
                    fit: BoxFit.contain,
                    height: 12.h,
                    width: 12.58.w,
                  ),
                )),
            6.29.pw,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  firstText,
                  style: GoogleFonts.inter(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: HexColor('#6B6363')),
                ),
                5.ph,
                Text(
                  SecondText,
                  style: GoogleFonts.inter(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: HexColor('#413B3B')),
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}

// Custom list item widget
Widget customListItem(String leadingText, String trailingText, int index) {
  return Container(
    //width: 100,
    height: 39.h,
    padding: const EdgeInsets.only(top: 12, left: 16, right: 20).r,
    margin: const EdgeInsets.only(left: 1, top: 12).r,
    color: index % 2 == 0 ? const Color(0xFFF9F9F9) : const Color(0xFFFFFFFF),
    //color: Colors.amber,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 186.w,
          //color: Colors.amber,
          child: AutoSizeText(
            leadingText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.quicksand(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: HexColor('#4E4949')),
          ),
        ),
        Text(
          trailingText,
          style: GoogleFonts.quicksand(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: HexColor('#292525')),
        ),
      ],
    ),
  );
}

// Example activities list
List<Map<String, dynamic>> activities = [
  {
    'name': 'Activity Name',
    'code': 'Activity Code',
  },
  {
    'name':
        'Wholesale of other electrical material such as electrical motors, transformers',
    'code': '465950',
  },
  {
    'name': 'Wholesale of measuring instruments and equipment',
    'code': '465950',
  },
  {
    'name':
        'Wholesale of other electrical material such as electrical motors, transformers',
    'code': '453220',
  },
  {
    'name': 'Wholesale of measuring instruments and equipment',
    'code': '464120',
  },
  {
    'name':
        'Wholesale of other electrical material such as electrical motors, transformers',
    'code': '464120',
  },
  {
    'name': 'Wholesale of measuring instruments and equipment',
    'code': '464120',
  },
  {
    'name':
        'Wholesale of other electrical material such as electrical motors, transformers',
    'code': '464120',
  },
];
Widget _reviewNRatingRow(firstText, SecondText) {
  return Row(
    children: [
      Text(
        firstText,
        style: GoogleFonts.ubuntu(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: HexColor('#757A8E')),
      ),
      7.pw,
      Container(
        height: 15.h,
        //width: 172.w,
        color: HexColor('#EDFFE9'),
        child: AutoSizeText(
          SecondText,
          maxLines: 1,
          style: GoogleFonts.ubuntu(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: HexColor('#0D0B0C')),
        ),
      )
    ],
  );
}
