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
import '../../../Tenders/Widget/custom_tiles.dart';
import '../../Widget/custom_widgets.dart';
import '../Controller/online_store_detail_controller.dart';

class OnlineStoreDetailPage extends ConsumerWidget {
  const OnlineStoreDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(onlineStoreDetailProvider.notifier);
    final state = ref.watch(onlineStoreDetailProvider);
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
                    // product.id;
                    // controller.person.data!.id;
                    // product.companyId;
                    // controller.person.data!.companyId;
                    // print(product.id);
                    // print(controller.person.data!.id);
                    // print(product.companyId);

                    //print(controller.person.data!.companyId);

                    final quoteData = {
                      'productId': controller.productId,
                      'userId': controller.person.data!.id,
                      'userCompanyId': controller.person.data!.companyId
                    };

                    GoRouter.of(context).pushNamed(
                      requestQuoteScreen,
                      extra: quoteData,
                    );
                  },
                  child: CustomButton(
                    height: 28.h,
                    width: 120.w,
                    borderColor: HexColor('#27BCEB'),
                    text: 'Request Qoute',
                    textColor: HexColor('#27BCEB'),
                  ),
                ),
                //30.pw,
                GestureDetector(
                  onTap: () {
                    var product = state.productDetail.first;
                    product.id;
                    controller.person.data!.id;
                    product.companyId;
                    print(product.id);
                    print(controller.person.data!.id);
                    print(product.companyId);

                    final inquiryData = {
                      'productId': controller.productId,
                      'productTitle': product.name,
                      'userId': controller.person.data!.id,
                      'userCompanyId': controller.person.data!.companyId,
                      'companyId': product.companyId,
                    };

                    GoRouter.of(context).pushNamed(
                      inquiryScreen,
                      extra: inquiryData,
                    );
                  },
                  child: CustomButton(
                    height: 28.h,
                    width: 120.w,
                    color: const Color(0xff1F3996),
                    text: 'Send Inquiry',
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: state.productDetail.length,
              shrinkWrap: true,
              itemBuilder: (context, outerIndex) {
                var product = state.productDetail[outerIndex];
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
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios,
                                    color: HexColor('#414141')),
                                onPressed: () {
                                  state.pageController.nextPage(
                                    duration: const Duration(milliseconds: 400),
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
                                      Border.all(color: detailCradBorderColor),
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/building.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                          ],
                        ),
                      ),
                      35.ph,
                      Text('Specification',
                          style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: HexColor('#5A5A5A'))),
                      16.ph,
                      specificationContainer(
                        'Model',
                        product.modelNo.toString(),
                      ),
                      8.ph,
                      specificationContainer(
                        'Manufacturer Part No',
                        product.manufacturerPartNo.toString(),
                      ),
                      8.ph,
                      specificationContainer(
                        'Type',
                        product.productType.toString(),
                      ),
                      8.ph,
                      specificationContainer(
                        'Payment Mode',
                        product.paymentMode.toString(),
                      ),
                      22.ph,
                      Text("More Details",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                      14.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          moreDetailsButton(
                              'assets/images/building.svg',
                              controller.moreDetails[0],
                              state.selectedOptionIndex == 0
                                  ? const Color(0xffE2F5ED)
                                  : const Color(0xffFBFFFD), () {
                            controller.moreDetailBuild(0);
                          }),
                          moreDetailsButton(
                              'assets/images/building.svg',
                              controller.moreDetails[1],
                              state.selectedOptionIndex == 1
                                  ? const Color(0xffE2F5ED)
                                  : const Color(0xffFBFFFD), () {
                            controller.moreDetailBuild(1);
                          }),
                          moreDetailsButton(
                              'assets/images/building.svg',
                              controller.moreDetails[2],
                              state.selectedOptionIndex == 2
                                  ? const Color(0xffE2F5ED)
                                  : const Color(0xffFBFFFD), () {
                            controller.moreDetailBuild(2);
                          }),
                          moreDetailsButton(
                              'assets/images/building.svg',
                              controller.moreDetails[3],
                              state.selectedOptionIndex == 3
                                  ? const Color(0xffE2F5ED)
                                  : const Color(0xffFBFFFD), () {
                            controller.moreDetailBuild(3);
                          }),
                        ],
                      ),
                      22.ph,
                      if (state.selectedOptionIndex == 0) ...[
                        Text("Details",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        16.ph,
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
                        )
                      ],
                      if (state.selectedOptionIndex == 1) ...[
                        productandServiceInfoCard(
                          heading: 'UNSPSC',
                          width: 362.w,
                          child: Column(
                            children: [
                              if (product.unspscCommodity != null) ...[
                                rowText(
                                    'Name - ',
                                    product.unspscCommodity!.commodityName ??
                                        'Not Available'),
                                20.ph,
                                rowText(
                                    'Code - ',
                                    product.unspscCommodity!.commodityCode ??
                                        'Not Available'),
                              ] else ...[
                                rowText('Commodity', 'Not Available'),
                              ],
                            ],
                          ),
                        ),
                      ],
                      if (state.selectedOptionIndex == 3) ...[
                        Text("Refund&Shipping Policy",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        16.ph,
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
                          child: AutoSizeText(product.refundPolicy.toString(),
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff414141))),
                        )
                      ],
                      if (state.selectedOptionIndex == 2) ...[
                        Text("Comments",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        16.ph,
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
                      ]
                    ],
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

      // ),
    );
  }
}
