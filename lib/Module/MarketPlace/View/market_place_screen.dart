import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../Constants/Person/person_controller.dart';
import '../Widget/market_place_screen_card.dart';

class MarketPlaceScreen extends ConsumerWidget {
  const MarketPlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.read(personProvider);

    return Scaffold(
        //backgroundColor: Colors.red,
        body: Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity, // Ensure it fills the width of the screen
              height: 175.h, // Set the height you want

              child: SvgPicture.asset(
                'assets/images/marketplace_appbar.svg',
                fit: BoxFit.fill, // Make the picture fill the container
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 57).r,
                      child: SvgPicture.asset('assets/images/drawer.svg')),
                ),
                //83.pw,
                Text(
                  'MarketPlace',
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),

                Container(
                    child: SvgPicture.asset(
                  'assets/images/bellicon.svg',
                  color: Color(0xff8B97A8),
                )),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 120.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4EBBD3)),
                      color: Color(0xffF5F9F9),
                      shape: BoxShape.circle),
                  margin: EdgeInsets.symmetric(vertical: 117, horizontal: 30).r,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/images/jazalla_logo.svg',
                        fit: BoxFit.contain,
                      ),
                      SvgPicture.asset(
                        'assets/images/marketplace_appbar_sublogo.svg',
                        fit: BoxFit.contain,
                      ),

                      // SvgPicture.asset(
                      //   'assets/images/marketplace_appbar_sublogo.svg',
                      //   fit: BoxFit.contain,
                      // ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Jazalla',
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff595085)),
                    ),
                    Text(
                      'Business platform ',
                      style: GoogleFonts.mulish(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1F3996)),
                    ),
                    Text(
                      'Hi, Company',
                      style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff595085)),
                    ),
                  ],
                ),
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 260, left: 30).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("your business insights",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                    14.ph,
                    FadeInUp(
                      duration: const Duration(
                          milliseconds: 500), // You can adjust the duration
                      delay: const Duration(milliseconds: 100),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardMakretPlace(
                            textColor: const Color(0xffFF6D17),
                            svgPath: 'assets/images/building.svg',
                            headingText: 'Bussines Community',
                            boxText: '1',
                            onTap: () {
                              // Get.toNamed(bussinesCommunitiesScreen,
                              //     arguments: controller.arguments);
                              // context.goNamed(bussinesCommunitiesScreen, extra: person);
                              GoRouter.of(context).pushNamed(
                                  bussinesCommunitiesScreen,
                                  extra: person);
                            },
                            subHeadingText:
                                'It serves as a comprehensive directory, showcasing company profiles with industry, locations, products, services, and contact details for easy access and networking.',
                          ),
                          20.pw,
                          CardMakretPlace(
                            textColor: Color(0xffFCAB10),
                            svgPath: 'assets/images/online_store.svg',
                            headingText: 'Online Store',
                            boxText: '2',
                            onTap: () {
                              GoRouter.of(context)
                                  .pushNamed(onlineStoreScreen, extra: person);
                            },
                            subHeadingText:
                                'It hosts an online store providing a platform for suppliers to showcase and sell their products online, catering to diverse customers worldwide.',
                          ),
                        ],
                      ),
                    ),
                    20.ph,
                    FadeInUp(
                      duration: Duration(
                          milliseconds: 500), // You can adjust the duration
                      delay: Duration(milliseconds: 100),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardMakretPlace(
                            textColor: Color(0xffFCAB10),
                            svgPath: 'assets/images/bussines_sale.svg',
                            headingText: 'Bussines For Sale',
                            boxText: '3',
                            onTap: () {
                              GoRouter.of(context)
                                  .pushNamed(bussinesForSale, extra: person);
                            },
                            subHeadingText:
                                'To facilitate the sale of existing business to potential buyers. Business owners looking to sell their ventures can list their opportunities in this section.',
                          ),
                          20.pw,
                          CardMakretPlace(
                            textColor: Color(0xff188F71),
                            svgPath: 'assets/images/tenders.svg',
                            headingText: 'Tenders',
                            boxText: '4',
                            onTap: () {
                              GoRouter.of(context)
                                  .pushNamed(tendersView, extra: person);
                            },
                            subHeadingText:
                                'It presents a list of tenders for companies to bid on projects, contracts, and procurements, offered by buyers, fostering engagement and collaboration with various industries.',
                          ),
                        ],
                      ),
                    ),
                    20.ph,
                    FadeInDown(
                      duration: Duration(
                          milliseconds: 500), // You can adjust the duration
                      delay: Duration(milliseconds: 100),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CardMakretPlace(
                            textColor: Color(0xff4B6FFF),
                            svgPath: 'assets/images/general_service.svg',
                            headingText: 'Genral Services',
                            boxText: '5',
                            onTap: () {
                              GoRouter.of(context)
                                  .pushNamed(generalServiceView, extra: person);
                            },
                            subHeadingText:
                                'It offers a general services catalog for service providers to showcase and sell their services online, catering to diverse customers worldwide.',
                          ),
                          20.pw,
                          CardMakretPlace(
                            textColor: Color(0xff4B6FFF),
                            svgPath:
                                'assets/images/investment_opportunities.svg',
                            headingText: 'Invesetment Opportunities',
                            boxText: '6',
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                  investMentOpportunityView,
                                  extra: person);
                            },
                            subHeadingText:
                                'It presents investment opportunities listed by business owners aiming for partnerships, growth, franchising, and more attracting interested investors and potential collaborators.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
