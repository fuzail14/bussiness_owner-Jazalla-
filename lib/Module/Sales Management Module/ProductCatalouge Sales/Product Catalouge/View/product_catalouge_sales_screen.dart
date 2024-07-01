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

import '../../../../../Constants/Font/fonts.dart';
import '../../../../../Constants/api_routes.dart';
import '../../../../../Constants/constants.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../../../../../Widgets/StarRating/star_rating.dart';
import '../Notifier/product_catalouge_sales_notifier.dart';

class ProductCatalougeSalesScreen extends ConsumerWidget {
  const ProductCatalougeSalesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(productCatalougeSalesProvider.notifier);
    final state = ref.watch(productCatalougeSalesProvider);

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
        title: 'Product Catalouge',
        showBell: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ).r,
              child: Text('Product Catalouge',
                  style: FontManagment()
                      .montserrat18HeadingEmployeeCenterAllModules),
            ),
            if (state.responseStatus == Status.loading)
              const Loader()
            else if (state.responseStatus == Status.completed) ...[
              if (state.productsApiList.isEmpty) ...[
                Center(
                  child: Text(
                    'No Products Found.',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: HexColor('#EB2F2F')),
                  ),
                ),
              ] else
                Expanded(
                    child: ListView.builder(
                  itemCount: state.productsApiList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var product = state.productsApiList[index];
                    return InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                          productCatalougeDetailSalesPage,
                          pathParameters: {'id': product.id.toString()},
                        );
                      },
                      child: Container(
                        // height: 325.h,
                        margin: const EdgeInsets.only(
                                top: 15, left: 27, right: 27, bottom: 15)
                            .r,
                        padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 23, bottom: 15)
                            .r,
                        color: HexColor('#F3F4F5'),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //first card
                            Container(
                              width: 328.w,
                              height: 132.h,
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 10,
                              ).r,
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
                                        if (product.photos!.isNotEmpty) ...[
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
                                            child: product.photos!.isNotEmpty
                                                ? CachedNetworkImage(
                                                    imageUrl:
                                                        Api.originalImageBaseUrl +
                                                            product
                                                                .photos!
                                                                .first
                                                                .image_path
                                                                .toString() +
                                                            product
                                                                .photos!
                                                                .first
                                                                .image_name
                                                                .toString(),
                                                    fit: BoxFit.fill,
                                                  )
                                                : SvgPicture.asset(
                                                    'assets/images/bussines_sale.svg',
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
                                              'assets/images/bussines_sale.svg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),

                                  // SvgPicture.asset(
                                  //   'assets/images/bussines_sale.svg',
                                  //   width: 100.w,
                                  //   height: 105.h,
                                  // ),

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
                                          product.name.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                        5.ph,
                                        AutoSizeText(
                                          product.companies!.companyName
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: HexColor('#6A7380')),
                                        ),
                                        AutoSizeText(
                                          product.unitPrice.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color: HexColor('#6A7380')),
                                        ),
                                        AutoSizeText(
                                          product.salePrice.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                        5.ph,
                                        AutoSizeText(
                                          product.companies!.companyCode
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
                                  // Align(
                                  //   alignment: Alignment.bottomRight,
                                  //   child: AutoSizeText(
                                  //     product.productType.toString(),
                                  //     maxLines: 1,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     style: GoogleFonts.quicksand(
                                  //         fontWeight: FontWeight.w500,
                                  //         fontSize: 10.sp,
                                  //         color: HexColor('#0D0B0C')),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            21.ph,
                            //detail
                            Text(
                              '5 Box (Min Order QTY)',
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: HexColor('#0D0B0C')),
                            ),
                            5.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Made in Saudia Arabia ',
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: HexColor('#000000')),
                                ),
                                SvgPicture.asset(
                                    'assets/images/os_card_icon.svg')
                              ],
                            ),
                            9.ph,
                            Text(
                              'Manufacturer - Hp',
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: HexColor('#0D0B0C')),
                            ),
                            7.ph,
                            StarRating(
                              rating: 3,
                              color: HexColor('#FCAB10'),
                            ),
                            // 20.ph,
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () {
                            //         product.id;
                            //         controller.person.data!.id;
                            //         product.companyId;
                            //         controller.person.data!.companyId;
                            //         print(product.id);
                            //         print(controller.person.data!.id);
                            //         print(product.companyId);
                            //         print(controller.person.data!.companyId);

                            //         final quoteData = {
                            //           'productId': product.id,
                            //           'userId': controller.person.data!.id,
                            //           'userCompanyId':
                            //               controller.person.data!.companyId
                            //         };

                            //         GoRouter.of(context).pushNamed(
                            //           requestQuoteScreen,
                            //           extra: quoteData,
                            //         );
                            //       },
                            //       child: CustomButton(
                            //         height: 28.h,
                            //         width: 120.w,
                            //         borderColor: HexColor('#27BCEB'),
                            //         text: 'Request Qoute',
                            //         textColor: HexColor('#27BCEB'),
                            //       ),
                            //     ),
                            //     //30.pw,
                            //     GestureDetector(
                            //       onTap: () {
                            //         product.id;
                            //         controller.person.data!.id;
                            //         product.companyId;
                            //         final inquiryData = {
                            //           'productId': product.id,
                            //           'productTitle': product.name,
                            //           'userId': controller.person.data!.id,
                            //           'userCompanyId':
                            //               controller.person.data!.companyId,
                            //           'companyId': product.companyId,
                            //         };

                            //         GoRouter.of(context).pushNamed(
                            //           inquiryScreen,
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
