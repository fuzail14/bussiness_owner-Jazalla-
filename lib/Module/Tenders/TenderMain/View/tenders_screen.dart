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
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Widgets/CustomButton/custom_button.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../Controller/tenders_controller.dart';

class TendersView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(tendersProvider.notifier);
    final state = ref.watch(tendersProvider);
    return Scaffold(
      //backgroundColor: HexColor('#F5F5F5'),
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'Tenders',
        size: 50.h,
      ),

      body: Column(
        children: [
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed)
            Expanded(
                child: ListView.builder(
              itemCount: state.tendersList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var tenders = state.tendersList[index];
                return Container(
                  //height: 686.h,
                  //width: 386.w,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color(0xfff3f4f5)),
                  margin: EdgeInsets.only(top: 10, left: 14, right: 14).r,
                  padding: EdgeInsets.only(
                          left: 16, top: 22, right: 16, bottom: 61.75)
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
                                            value: downloadProgress.progress),
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
                                        tenders.companies!.mobileNo.toString(),
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
                                  border:
                                      Border.all(color: HexColor('#E1E3E6'))),
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
                                      borderRadius: BorderRadius.circular(16),
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
                        'Description'.toString(), // Replace with actual title
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
                                    left: 20, top: 10, right: 20, bottom: 20)
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
                                      tenders.companies!.companyName.toString(),
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
                      51.25.ph,
                      Row(
                        children: [
                          CustomButton(
                            onTap: () {
                              GoRouter.of(context).pushNamed(tendersDetailPage,
                                  pathParameters: {
                                    'id': state.tendersList[index].id.toString()
                                  },
                                  extra: controller.person.Bearer);
                            },
                            width: 140.w,
                            height: 32.h,
                            text: 'Detail',
                            textColor: HexColor('#27BCEB'),
                            borderColor: HexColor('#27BCEB'),
                          ),
                          21.23.pw,
                          CustomButton(
                            onTap: () {
                              tenders.id;
                              controller.person.data!.id;
                              tenders.companyId;
                              controller.person.data!.companyId;
                              print(tenders.id);
                              print("user id ${controller.person.data!.id}");
                              print(tenders.companyId);
                              print(
                                  "buyer id ${controller.person.data!.companyId}");

                              final quoteData = {
                                'tenderId': tenders.id,
                                'tenderCompanyId': tenders.companyId,
                                'userId': controller.person.data!.id,
                                'userCompanyId':
                                    controller.person.data!.companyId
                              };

                              GoRouter.of(context).pushNamed(
                                tenderResponseScreen,
                                extra: quoteData,
                              );
                            },
                            width: 140.w,
                            height: 32.h,
                            text: 'Response',
                            color: HexColor('#27BCEB'),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ))
          else
            const Text("SomeThing went Wrong"),
        ],
      ),
    );
  }
}
