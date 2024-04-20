
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
import '../../../../Constants/constants.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../../../../Widgets/StarRating/star_rating.dart';
import '../Controller/online_store_controller.dart';

class OnlineStoreScreen extends ConsumerWidget {
  const OnlineStoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(onlineStoreProvider.notifier);
    final state = ref.watch(onlineStoreProvider);
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
                  expansionTileTheme: const ExpansionTileThemeData(
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
      key: scaffoldKey,
      appBar: MyAppBar(
          title: 'Online Store',
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
                            controller.productSearchApi(
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
                          borderSide: const BorderSide(color: Color(0xffDEDEDE)),
                        ),
                        focusColor: blueColor),
                  ),
                ),
                10.pw,
                IconButton(
                    onPressed: () {
                      controller.searchController.clear();
                      controller.onlineStoreViewApi(
                          bearerToken: controller.person.Bearer!);
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
                        // GoRouter.of(context).pushNamed(onlineStoreDetailPage,
                        //     pathParameters: {'id': product.id.toString()},
                        //     extra: controller.person.Bearer);

                        // When navigating to the new route
                        GoRouter.of(context).pushNamed(
                          onlineStoreDetailPage,
                          pathParameters: {'id': product.id.toString()},
                          extra: controller.person,
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
                                  SvgPicture.asset(
                                    'assets/images/bussines_sale.svg',
                                    width: 100.w,
                                    height: 105.h,
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

List<Widget> buildBusinessActivitiesFilter(
    OnlineStoreController controller, OnlineStoreState state) {
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
        children: controller.businessSectors.map((sector) {
          int index = controller.businessSectors.indexOf(sector);
          bool isSelected = sector['isChecked'];

          return GestureDetector(
              onTap: () {
                // Unselect all other buttons
                for (var s in controller.businessSectors) {
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
    OnlineStoreController controller, OnlineStoreState state) {
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
        spacing: 8.0,
        runSpacing: 4.0,
        children: controller.sortList.map((sector) {
          int index = controller.sortList.indexOf(sector);
          bool isSelected = sector['isChecked'];

          return GestureDetector(
              onTap: () {
                // Unselect all other buttons
                for (var s in controller.sortList) {
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
    margin: const EdgeInsets.only(
      top: 10,
    ),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: const Color(0xffD9D9D9)),
      color: isSelected ? const Color(0xff28B9EB) : Colors.white,
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
            color: isSelected ? whiteColor : const Color(0xff454544)),
      ),
    ),
  );
}
