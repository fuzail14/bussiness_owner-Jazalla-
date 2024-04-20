import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
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
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/CustomButton/custom_button.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../../../../Widgets/StarRating/star_rating.dart';
import '../Controller/service_detail_controller.dart';

class ServiceDetailPage extends ConsumerWidget {
  const ServiceDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(servicePageProvider.notifier);
    final state = ref.watch(servicePageProvider);
    return Scaffold(
      appBar: MyAppBar(
        title: "Detail",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            20.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    var services = state.serviceDetail.first;
                    services.id;
                    controller.person.data!.id;
                    services.companyId;
                    controller.person.data!.companyId;
                    print(services.id);
                    print("user id ${controller.person.data!.id}");
                    print(services.companyId);
                    print("buyer id ${controller.person.data!.companyId}");

                    final quoteData = {
                      'serviceId': controller.serviceId,
                      'serviceCompanyId': services.companyId,
                      'userId': controller.person.data!.id,
                      'userCompanyId': controller.person.data!.companyId
                    };

                    GoRouter.of(context).pushNamed(
                      requestProposalScreen,
                      extra: quoteData,
                    );
                  },
                  child: CustomButton(
                    height: 28.h,
                    width: 120.w,
                    borderColor: HexColor('#27BCEB'),
                    text: 'Request Proposal',
                    textColor: HexColor('#27BCEB'),
                  ),
                ),
                //30.pw,
                GestureDetector(
                  onTap: () {
                    var services = state.serviceDetail.first;
                    services.id;
                    controller.person.data!.id;
                    services.companyId;

                    final inquiryData = {
                      'serviceId': services.id,
                      'title': services.name,
                      'userId': controller.person.data!.id,
                      'userCompanyId': controller.person.data!.companyId,
                      'companyId': services.companyId,
                    };

                    GoRouter.of(context).pushNamed(
                      serviceinquiryScreen,
                      extra: inquiryData,
                    );
                  },
                  child: CustomButton(
                    height: 28.h,
                    width: 120.w,
                    color: HexColor('#1F3996'),
                    text: 'Send Inquiry',
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: state.serviceDetail.length,
              shrinkWrap: true,
              itemBuilder: (context, outerIndex) {
                var product = state.serviceDetail[outerIndex];
                return Padding(
                  padding: const EdgeInsets.only(left: 31, top: 29, right: 31),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          product.name.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: HexColor('5A5A5A')),
                        ),
                        5.ph,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StarRating(
                              color: HexColor('#FBC02D'),
                              rating: 3.5,
                            ),
                            5.pw,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("4.9 (531 reviews)",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: HexColor('#B8B8B8'))),
                                Text(product.minPrice.toString(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: HexColor('#B8B8B8')))
                              ],
                            ),
                          ],
                        ),
                        20.ph,
                        SizedBox(
                          width: double.infinity,
                          //height: 200.h,
                          child: Wrap(
                            children: [
                              if (product.photos!.isNotEmpty) ...[
                                Container(
                                  width: double.infinity,
                                  height: 131.h,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 10)
                                          .r,
                                  padding: const EdgeInsets.all(10).r,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: detailCradBorderColor)),
                                  child: PageView.builder(
                                    controller: state.pageController,
                                    itemCount: product.photos!.length,
                                    itemBuilder: (context, innerIndex) {
                                      var photo = product.photos![innerIndex];
                                      return CachedNetworkImage(
                                        imageUrl: Api.originalImageBaseUrl +
                                            photo.imagePath.toString() +
                                            photo.imageName.toString(),
                                        fit: BoxFit.fill,
                                      );
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_back_ios,
                                      color: HexColor('#414141')),
                                  onPressed: () {
                                    state.pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: HexColor('#414141')),
                                  onPressed: () {
                                    state.pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                              ] else
                                Container(
                                  width: double.infinity,
                                  height: 131.h,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 10)
                                          .r,
                                  padding: const EdgeInsets.all(10).r,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: HexColor('#08B783')),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/building.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        27.ph,
                        Text("Description",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        6.ph,
                        Container(
                          width: 362.w,
                          //height: 242.h,
                          padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 18, bottom: 17)
                              .r,
                          decoration: BoxDecoration(
                              border: Border.all(color: detailCradBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xfffbfffd)),
                          child: AutoSizeText(product.description.toString(),
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff414141))),
                        ),
                        20.ph,
                        Text("Details",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        6.ph,
                        Container(
                          width: 362.w,
                          //height: 242.h,
                          padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 18, bottom: 17)
                              .r,
                          decoration: BoxDecoration(
                              border: Border.all(color: detailCradBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xfffbfffd)),
                          child: AutoSizeText(product.pDetails.toString(),
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff414141))),
                        ),
                        20.ph,
                        Text("Services Classification (UNSPSC)",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        6.ph,
                        Container(
                          width: 362.w,
                          //height: 242.h,
                          padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 18, bottom: 17)
                              .r,
                          decoration: BoxDecoration(
                              border: Border.all(color: detailCradBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xfffbfffd)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Flexible(
                              //   child: AutoSizeText(
                              //       product.unspscCommodity!.commodityName
                              //           .toString(),
                              //       maxLines: 8,
                              //       overflow: TextOverflow.ellipsis,
                              //       textScaleFactor: 1.2,
                              //       textAlign: TextAlign.left,
                              //       style: GoogleFonts.poppins(
                              //           fontSize: 12,
                              //           fontWeight: FontWeight.w400,
                              //           color: Color(0xff414141))),
                              // ),
                              // Flexible(
                              //   child: AutoSizeText(
                              //       product.unspscCommodity!.commodityCode
                              //           .toString(),
                              //       maxLines: 8,
                              //       overflow: TextOverflow.ellipsis,
                              //       textScaleFactor: 1.2,
                              //       textAlign: TextAlign.left,
                              //       style: GoogleFonts.poppins(
                              //           fontSize: 12,
                              //           fontWeight: FontWeight.w400,
                              //           color: Color(0xff414141))),
                              // ),
                            ],
                          ),
                        ),
                        20.ph,
                        Text("Terms & Condition",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        6.ph,
                        Container(
                          width: 362.w,
                          //height: 242.h,
                          padding: const EdgeInsets.only(
                                  left: 21, right: 21, top: 18, bottom: 17)
                              .r,
                          decoration: BoxDecoration(
                              border: Border.all(color: detailCradBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xfffbfffd)),
                          child: AutoSizeText(
                              product.termsAndConditions.toString(),
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff414141))),
                        ),
                        20.ph,
                        Text("Review&Ratings",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        6.ph,
                        Container(
                            width: double.infinity,
                            // height: 437.h,

                            padding: const EdgeInsets.only(
                                    bottom: 36, left: 38, top: 10, right: 15)
                                .r,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14).r,
                                color: HexColor('#FFFFFF'),
                                border:
                                    Border.all(color: detailCradBorderColor)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  // margin: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: detailCradBorderColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Comment',
                                            labelStyle: TextStyle(
                                                color: detailCradBorderColor),
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
                                  padding: const EdgeInsets.only(left: 210).r,
                                  child: Container(
                                    width: 60.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                        color: HexColor('#E2F5ED'),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Text(
                                      'submit',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.quicksand(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff504B4B)),
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
                      ]),
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
