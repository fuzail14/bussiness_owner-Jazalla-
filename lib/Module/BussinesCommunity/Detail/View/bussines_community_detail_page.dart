import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Constants/api_routes.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../../../../Widgets/StarRating/star_rating.dart';
import '../Controller/bussines_community_detail_controller.dart';

class BussinesCommunityDetailPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(bussinesCommunityPageProvider.notifier);
    final state = ref.watch(bussinesCommunityPageProvider);
    return Scaffold(
      appBar: MyAppBar(
        title: "Detail",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          26.ph,
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            20.ph,
            Expanded(
                child: ListView.builder(
              itemCount: state.companyDetail.length,
              shrinkWrap: true,
              itemBuilder: (context, outerIndex) {
                var companyDetail = state.companyDetail[outerIndex];
                return Column(
                  children: [
                    //GENERAL INFORMATION
                    Container(
                      width: 333.6700134277344.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
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
                          collapsedIconColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          title: Text(
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
                                  height: 437.h,
                                  padding: EdgeInsets.only(left: 30, top: 19).r,
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
                                                  color: Color(0x33e1e1e2)),
                                              child: (state
                                                          .companyDetail[
                                                              outerIndex]
                                                          .logo ==
                                                      null)
                                                  ? SvgPicture.asset(
                                                      'assets/images/building.svg')
                                                  : Image.network(
                                                      Api.imageBaseUrl +
                                                          state
                                                              .companyDetail[
                                                                  outerIndex]
                                                              .logo
                                                              .toString(),
                                                      fit: BoxFit.contain,
                                                    ),
                                            ),
                                            16.pw,
                                            Text(
                                                state.companyDetail[outerIndex]
                                                    .companyName!,
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
                                          'Company ID - ',
                                          state.companyDetail[outerIndex].id!
                                              .toString(),
                                        ),
                                        10.ph,
                                        _generalInfoTileRow(
                                          Icons.location_history,
                                          'Location - ',
                                          'Saudi Arabia',
                                        ),
                                        10.ph,
                                        _generalInfoTileRow(
                                          Icons.phone_callback_outlined,
                                          'Contact - ',
                                          state.companyDetail[outerIndex]
                                              .mobileNo!
                                              .toString(),
                                        ),
                                        10.ph,
                                        _generalInfoTileRow(
                                          Icons.email,
                                          'Email - ',
                                          state.companyDetail[outerIndex].email!
                                              .toString(),
                                        ),
                                        23.ph,
                                        Container(
                                          width: 271.w,
                                          height: 77.h,
                                          child: GoogleMap(
                                            onMapCreated:
                                                controller.onMapCreated,
                                            initialCameraPosition:
                                                CameraPosition(
                                              target: controller.center,
                                              zoom: 10.0,
                                            ),
                                            myLocationButtonEnabled: false,
                                            markers: {
                                              Marker(
                                                markerId:
                                                    MarkerId('some_marker'),
                                                position: controller.center,
                                              ),
                                            },
                                          ),
                                        ),
                                        22.ph,
                                        Row(
                                          children: [
                                            _generalInfoCard(
                                                'Connected Supplier', '38599'),
                                            11.pw,
                                            _generalInfoCard(
                                                'Connected Supplier', '38599'),
                                          ],
                                        ),
                                        13.ph,
                                        _generalInfoCard(
                                            'Connected Supplier', '38599'),
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

                    //BUSSINES ACTIITIES
                    20.ph,

                    Container(
                      width: 333.6700134277344.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
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
                          collapsedIconColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          title: Text(
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
                                  height: 437.h,
                                  // padding: EdgeInsets.only(
                                  //         left: 16, top: 12, right: 20)
                                  //   .r,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14).r,
                                      color: HexColor('#FFFFFF'),
                                      border: Border.all(
                                          color: HexColor('#7F7F8A4D'))),
                                  child: ListView.builder(
                                    itemCount: activities
                                        .length, // Your number of activities
                                    itemBuilder: (context, index) {
                                      return customListItem(
                                        activities[index][
                                            'name'], // Replace with your activity name
                                        activities[index][
                                            'code'], // Replace with your activity code
                                        index, // Current index for alternating color
                                      );
                                    },
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

                    //Product Catalouge
                    20.ph,

                    Container(
                      width: 333.6700134277344.w,
                      //height: 469.93.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          tileMode: TileMode.mirror,
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
                          collapsedIconColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          title: Text(
                            'Products Catalogue',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          children: [
                            (companyDetail.products.isEmpty)
                                ? Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "No Products Found",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: HexColor('#FFFFFF')),
                                    ),
                                  )
                                : Container(
                                    height: 469.93.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14).r,
                                        color: HexColor('#FFFFFF'),
                                        border: Border.all(
                                            color: HexColor('#7F7F8A4D'))),
                                    child: ListView.builder(
                                        itemCount:
                                            companyDetail.products.length,
                                        itemBuilder: (context, innerIndex) {
                                          var product = companyDetail
                                              .products[innerIndex];

                                          return Stack(
                                            children: [
                                              Container(
                                                width: 294.w,
                                                //height: 176.h,
                                                margin: const EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        top: 21,
                                                        bottom: 50)
                                                    .r,

                                                padding: const EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        top: 21,
                                                        bottom: 10)
                                                    .r,

                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                                14)
                                                            .r,
                                                    color: HexColor('#F9F9F9'),
                                                    border: Border.all(
                                                        color: HexColor(
                                                            '#7F7F8A4D'))),
                                                child: Stack(
                                                  children: [
                                                    // SvgPicture.asset(
                                                    //   'assets/images/building.svg',
                                                    //   width: 100.w,
                                                    //   height: 100.h,
                                                    // ),
                                                    (product.photos
                                                                ?.imagePath ==
                                                            null)
                                                        ? SvgPicture.asset(
                                                            'assets/images/building.svg')
                                                        : Image.network(
                                                            Api.originalImageBaseUrl +
                                                                product.photos!
                                                                    .imagePath! +
                                                                product.photos!
                                                                    .imageName
                                                                    .toString(),
                                                            fit: BoxFit.cover,
                                                            height: 80.h,
                                                            width: 80.w,
                                                          ),
                                                    (product.photos
                                                                ?.imagePath ==
                                                            null)
                                                        ? SvgPicture.asset(
                                                            'assets/images/building.svg')
                                                        : Container(
                                                            height: 90.h,
                                                            width: 90.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                          .circular(
                                                                              16)
                                                                      .r,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  "${Api.originalImageBaseUrl}${product.photos!.imagePath!}${product.photos!.imageName}",
                                                                ),
                                                              ),
                                                            ),
                                                            child:
                                                                CachedNetworkImage(
                                                              fit: BoxFit.cover,
                                                              imageUrl:
                                                                  "${Api.originalImageBaseUrl}${product.photos!.imagePath!}${product.photos!.imageName}",
                                                              fadeInCurve:
                                                                  Curves
                                                                      .bounceIn,
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(Icons
                                                                      .error), // Optional: Handle error state
                                                            ),
                                                          ),

                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 110,
                                                      ).r,
                                                      child: StarRating(
                                                        color:
                                                            HexColor('#FCAB10'),
                                                        rating: 4,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 110,
                                                        top: 10,
                                                        right: 30,
                                                      ).r,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          AutoSizeText(
                                                            product.name
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 16.sp,
                                                                color: HexColor(
                                                                    '#0D0B0C')),
                                                          ),
                                                          5.ph,
                                                          AutoSizeText(
                                                            companyDetail
                                                                .companyName
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12.sp,
                                                                color: HexColor(
                                                                    '#6A7380')),
                                                          ),
                                                          AutoSizeText(
                                                            '${product.unitPrice} (Price/item)'
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12.sp,
                                                                color: HexColor(
                                                                    '#6A7380')),
                                                          ),
                                                          AutoSizeText(
                                                            product.salePrice
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12.sp,
                                                                color: HexColor(
                                                                    '#0D0B0C')),
                                                          ),
                                                          5.ph,
                                                          AutoSizeText(
                                                            companyDetail
                                                                .companyCode
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12.sp,
                                                                color: HexColor(
                                                                    '#0D0B0C')),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        size: 20.h,
                                                        color:
                                                            HexColor('#6A7380'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                right: 0,
                                                child: SvgPicture.asset(
                                                  'assets/images/bc_detailpage_giCard.svg',
                                                  width: 333.6700134277344.w,
                                                  height: 29.717.h,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                          ],
                        ),
                      ),
                    ),

                    //Service Catalouge
                    20.ph,

                    Container(
                      width: 333.6700134277344.w,
                      //height: 469.93.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          tileMode: TileMode.mirror,
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
                          collapsedIconColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          title: Text(
                            'Services Catalogue',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          children: [
                            (companyDetail.products.isEmpty)
                                ? Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "No Services Found",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: HexColor('#FFFFFF')),
                                    ),
                                  )
                                : Container(
                                    height: 469.93.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14).r,
                                        color: HexColor('#FFFFFF'),
                                        border: Border.all(
                                            color: HexColor('#7F7F8A4D'))),
                                    child: ListView.builder(
                                        itemCount:
                                            companyDetail.services.length,
                                        itemBuilder: (context, innerIndex) {
                                          var service = companyDetail
                                              .services[innerIndex];

                                          return Stack(
                                            children: [
                                              Container(
                                                width: 294.w,
                                                //height: 176.h,
                                                margin: const EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        top: 21,
                                                        bottom: 50)
                                                    .r,

                                                padding: const EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        top: 21,
                                                        bottom: 10)
                                                    .r,

                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                                14)
                                                            .r,
                                                    color: HexColor('#F9F9F9'),
                                                    border: Border.all(
                                                        color: HexColor(
                                                            '#7F7F8A4D'))),
                                                child: Stack(
                                                  children: [
                                                    (service.latestPhotos
                                                                ?.imagePath ==
                                                            null)
                                                        ? SvgPicture.asset(
                                                            'assets/images/building.svg')
                                                        : ClipOval(
                                                            child:
                                                                CachedNetworkImage(
                                                              height: 90.h,
                                                              width: 90.w,
                                                              fit: BoxFit
                                                                  .contain,
                                                              imageUrl:
                                                                  "${Api.originalImageBaseUrl}${service.latestPhotos!.imagePath!}${service.latestPhotos!.imageName}",
                                                              fadeInCurve:
                                                                  Curves
                                                                      .bounceIn,

                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  const Icon(Icons
                                                                      .error), // Optional: Handle error state
                                                            ),
                                                          ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 110,
                                                      ).r,
                                                      child: StarRating(
                                                        color:
                                                            HexColor('#FCAB10'),
                                                        rating: 4,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 110,
                                                        top: 10,
                                                        right: 30,
                                                      ).r,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          AutoSizeText(
                                                            service.name
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 16.sp,
                                                                color: HexColor(
                                                                    '#0D0B0C')),
                                                          ),
                                                          5.ph,
                                                          AutoSizeText(
                                                            companyDetail
                                                                .companyName
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12.sp,
                                                                color: HexColor(
                                                                    '#6A7380')),
                                                          ),
                                                          AutoSizeText(
                                                            '${service.unitPrice} (Price/item)'
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12.sp,
                                                                color: HexColor(
                                                                    '#6A7380')),
                                                          ),
                                                          AutoSizeText(
                                                            service.salePrice
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12.sp,
                                                                color: HexColor(
                                                                    '#0D0B0C')),
                                                          ),
                                                          5.ph,
                                                          AutoSizeText(
                                                            companyDetail
                                                                .companyCode
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts.quicksand(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12.sp,
                                                                color: HexColor(
                                                                    '#0D0B0C')),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Icon(
                                                        Icons.favorite_border,
                                                        size: 20.h,
                                                        color:
                                                            HexColor('#6A7380'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                left: 0,
                                                right: 0,
                                                child: SvgPicture.asset(
                                                  'assets/images/bc_detailpage_giCard.svg',
                                                  width: 333.6700134277344.w,
                                                  height: 29.717.h,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                          ],
                        ),
                      ),
                    ),

                    //Review And Ratings
                    20.ph,

                    Container(
                      width: 333.6700134277344.w,
                      //height: 469.93.h,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          tileMode: TileMode.mirror,
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
                          collapsedIconColor: Colors.black,
                          backgroundColor: Colors.transparent,
                          title: Text(
                            'Review & Rating',
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
                                  height: 325.93.h,
                                  width: double.maxFinite,
                                  padding: EdgeInsets.only(
                                    left: 27,
                                    top: 16,
                                    right: 30,
                                  ).r,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14).r,
                                      color: HexColor('#FFFFFF'),
                                      border: Border.all(
                                          color: HexColor('#7F7F8A4D'))),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 22.w,
                                            height: 22.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: Color(0x33e1e1e2)),
                                            child: (state
                                                        .companyDetail[
                                                            outerIndex]
                                                        .logo ==
                                                    null)
                                                ? SvgPicture.asset(
                                                    'assets/images/building.svg')
                                                : Image.network(
                                                    Api.imageBaseUrl +
                                                        state
                                                            .companyDetail[
                                                                outerIndex]
                                                            .logo
                                                            .toString(),
                                                    fit: BoxFit.contain,
                                                  ),
                                          ),
                                          16.pw,
                                          Text(
                                              state.companyDetail[outerIndex]
                                                  .companyName!,
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: HexColor('#0D0B0C'))),
                                        ],
                                      ),
                                      6.ph,
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 36).r,
                                        child: AutoSizeText(
                                            'A Performance review is a formal, regulated assessment mechanism in which managers and other key stakeholders evaluate an employees work performance. The purpose is to learn more about their strengths and weaknesses, offer constructive feedback for skill development in the future, and assist with goal setting.',
                                            maxLines: 6,
                                            style: GoogleFonts.quicksand(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w300,
                                                color: HexColor('##000000'))),
                                      ),
                                      15.ph,
                                      Divider(),
                                      _reviewNRatingRow(
                                        'On-time Delivery - ',
                                        'Consistently meets delivery time',
                                      ),
                                      8.ph,
                                      Row(
                                        children: [
                                          Text.rich(TextSpan(
                                              text: 'Quality of Products - ',
                                              style: GoogleFonts.ubuntu(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300,
                                                  color: HexColor('#0D0B0C')),
                                              children: [
                                                TextSpan(
                                                    text: '   Good',
                                                    style: GoogleFonts.ubuntu(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ])),
                                          7.pw,
                                          StarRating(
                                              rating: 4,
                                              color: HexColor('#FCAB10'))
                                        ],
                                      ),
                                      8.ph,
                                      Row(
                                        children: [
                                          Text.rich(TextSpan(
                                              text:
                                                  'Responsiveness and Communication -',
                                              style: GoogleFonts.ubuntu(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w300,
                                                  color: HexColor('#0D0B0C')),
                                              children: [])),
                                          StarRating(
                                              rating: 4,
                                              color: HexColor('#FCAB10'))
                                        ],
                                      ),
                                      8.ph,
                                      _reviewNRatingRow(
                                        'Pricing and Cost-Effectiveness - ',
                                        'Fair Value',
                                      ),
                                      8.ph,
                                      _reviewNRatingRow(
                                        'Reliability and Consistency - ',
                                        'Frequent Inconsistencies',
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    'assets/images/bc_detailpage_giCard.svg',
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
    decoration: BoxDecoration(boxShadow: [
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
                margin: EdgeInsets.only(left: 10.48, top: 10).r,
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
    padding: EdgeInsets.only(top: 12, left: 16, right: 20).r,
    margin: EdgeInsets.only(left: 1, top: 12).r,
    color: index % 2 == 0 ? Color(0xFFF9F9F9) : Color(0xFFFFFFFF),
    //color: Colors.amber,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
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
