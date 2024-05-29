import 'dart:ui';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Widgets/AppBar/my_app_bar.dart';
import '../../../Widgets/CustomGlassCardScreen/custom_glass_card_screen.dart';
import '../Widget/market_place_screen_card.dart';
import 'package:badges/badges.dart' as badges;

class MarketPlaceScreen extends ConsumerWidget {
  int buildCheck = 0;

  MarketPlaceScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.read(personProvider);

    print('marketplace');
    print(person!.data!.lastName!);
    print(person.data!.mobileNo!);
    print('market place build check ${buildCheck++}');

    return Scaffold(
      body: CustomGlassCardScreen(
        mainTitle: 'Market Place',
        children: [
          Center(
            child: Text(
              'All in One Solution',
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffFFFFFF).withOpacity(0.5)),
            ),
          ),
          13.ph,
          Divider(color: const Color(0xffFFFFFF).withOpacity(0.5)),
          15.ph,
          Text(
            'Jazalla',
            style: FontManagment().poppins16WithColor(
                color: const Color(0xffFFFFFF), fontWeight: FontWeight.bold),
          ),
          20.ph,
          CardMakretPlace(
            svgPath: 'assets/images/tenders1.svg',
            headingText: 'Tenders',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(tendersView, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/building.svg',
            headingText: 'Bussiness Community',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              // Get.toNamed(bussinesCommunitiesScreen,
              //     arguments: controller.arguments);
              // context.goNamed(bussinesCommunitiesScreen, extra: person);
              GoRouter.of(context).pushNamed(
                bussinesCommunitiesScreen,
                //extra: person
              );
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/online_store.svg',
            headingText: 'Online Store',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(onlineStoreScreen, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/general_service.svg',
            headingText: 'General Services',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(generalServiceView, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/bussines_sale.svg',
            headingText: 'Bussiness For Sale',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context).pushNamed(bussinesForSale, extra: person);
            },
          ),
          15.ph,
          CardMakretPlace(
            svgPath: 'assets/images/investment_opportunities.svg',
            headingText: 'Investment Oppurtunities',
            subHeadingText:
                'It serves as a comprehensive directory, showcasing company profiles.mon',
            onTap: () {
              GoRouter.of(context)
                  .pushNamed(investMentOpportunityView, extra: person);
            },
          ),
        ],
      ),
    );
    // return Scaffold(
    //     backgroundColor: const Color(0xffF9F9F9),
    //     // appBar: MyAppBar(
    //     //   title: 'MarketPlace',
    //     //   showFilter: false,
    //     //   showBackButton: false,
    //     //   bellOnTap: () {
    //     //     GoRouter.of(context).pushNamed(notificationsScreen);
    //     //   },
    //     // ),
    //     body: SingleChildScrollView(
    //       child: Container(
    //         padding: const EdgeInsets.only(top: 63, right: 0).r,
    //         decoration: const BoxDecoration(
    //             gradient: LinearGradient(
    //                 begin: Alignment.topCenter,
    //                 end: Alignment.bottomCenter,
    //                 colors: [Color(0xff2751A1), Color(0xff4BB3CF)])),
    //         child: Column(
    //           children: [
    //             Stack(
    //               children: [
    //                 Align(
    //                   alignment: Alignment.center,
    //                   child: Text(
    //                     'MarketPlace',
    //                     style: FontManagment().poppins18,
    //                   ),
    //                 ),
    //                 Positioned(
    //                   right: 24,
    //                   child: InkWell(
    //                     onTap: () {
    //                       GoRouter.of(context).pushNamed(notificationsScreen);
    //                     },
    //                     child: badges.Badge(
    //                         badgeContent: Text('3',
    //                             style: GoogleFonts.roboto(
    //                                 fontSize: 12.sp,
    //                                 fontWeight: FontWeight.w600,
    //                                 color: const Color(0xffFFFFFF))),
    //                         position:
    //                             badges.BadgePosition.topEnd(top: -10, end: -12),
    //                         showBadge: true,
    //                         ignorePointer: false,
    //                         child: SvgPicture.asset(
    //                           'assets/images/bellicon.svg',
    //                         )),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             35.ph,
    //             ClipRRect(
    //               borderRadius: const BorderRadius.all(Radius.circular(30)).r,
    //               child: BackdropFilter(
    //                 filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
    //                 child: Container(
    //                   width: 327.w,
    //                   // height: 643,
    //                   padding: const EdgeInsets.only(
    //                           left: 17, top: 22, right: 20, bottom: 56)
    //                       .r,

    //                   margin: const EdgeInsets.only(
    //                           left: 24, top: 0, right: 24, bottom: 30)
    //                       .r,

    //                   decoration: BoxDecoration(
    //                       color: const Color(0xffF6F6F6).withOpacity(0.15),
    //                       border: Border.all(
    //                           width: 1,
    //                           color: const Color(0xffF6F6F6).withOpacity(0.5)),
    //                       borderRadius:
    //                           const BorderRadius.all(Radius.circular(40)).r),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Center(
    //       child: Text(
    //         'All in One Solution',
    //         style: GoogleFonts.poppins(
    //             fontSize: 18,
    //             fontWeight: FontWeight.w600,
    //             color:
    //                 const Color(0xffFFFFFF).withOpacity(0.5)),
    //       ),
    //     ),
    //     13.ph,
    //     Divider(
    //         color: const Color(0xffFFFFFF).withOpacity(0.5)),
    //     15.ph,
    //     Text(
    //       'Jazalla',
    //       style: FontManagment().poppins16WithColor(
    //           color: const Color(0xffFFFFFF),
    //           fontWeight: FontWeight.bold),
    //     ),
    //     20.ph,
    //     CardMakretPlace(
    //       svgPath: 'assets/images/tenders1.svg',
    //       headingText: 'Tenders',
    //       subHeadingText:
    //           'It serves as a comprehensive directory, showcasing company profiles.mon',
    //       onTap: () {
    //         GoRouter.of(context)
    //             .pushNamed(tendersView, extra: person);
    //       },
    //     ),
    //     15.ph,
    //     CardMakretPlace(
    //       svgPath: 'assets/images/building.svg',
    //       headingText: 'Bussiness Community',
    //       subHeadingText:
    //           'It serves as a comprehensive directory, showcasing company profiles.mon',
    //       onTap: () {
    //         // Get.toNamed(bussinesCommunitiesScreen,
    //         //     arguments: controller.arguments);
    //         // context.goNamed(bussinesCommunitiesScreen, extra: person);
    //         GoRouter.of(context).pushNamed(
    //           bussinesCommunitiesScreen,
    //           //extra: person
    //         );
    //       },
    //     ),
    //     15.ph,
    //     CardMakretPlace(
    //       svgPath: 'assets/images/online_store.svg',
    //       headingText: 'Online Store',
    //       subHeadingText:
    //           'It serves as a comprehensive directory, showcasing company profiles.mon',
    //       onTap: () {
    //         GoRouter.of(context)
    //             .pushNamed(onlineStoreScreen, extra: person);
    //       },
    //     ),
    //     15.ph,
    //     CardMakretPlace(
    //       svgPath: 'assets/images/general_service.svg',
    //       headingText: 'General Services',
    //       subHeadingText:
    //           'It serves as a comprehensive directory, showcasing company profiles.mon',
    //       onTap: () {
    //         GoRouter.of(context)
    //             .pushNamed(generalServiceView, extra: person);
    //       },
    //     ),
    //     15.ph,
    //     CardMakretPlace(
    //       svgPath: 'assets/images/bussines_sale.svg',
    //       headingText: 'Bussiness For Sale',
    //       subHeadingText:
    //           'It serves as a comprehensive directory, showcasing company profiles.mon',
    //       onTap: () {
    //         GoRouter.of(context)
    //             .pushNamed(bussinesForSale, extra: person);
    //       },
    //     ),
    //     15.ph,
    //     CardMakretPlace(
    //       svgPath:
    //           'assets/images/investment_opportunities.svg',
    //       headingText: 'Investment Oppurtunities',
    //       subHeadingText:
    //           'It serves as a comprehensive directory, showcasing company profiles.mon',
    //       onTap: () {
    //         GoRouter.of(context).pushNamed(
    //             investMentOpportunityView,
    //             extra: person);
    //       },
    //     ),
    //   ],
    // ),

    //                   // child: SingleChildScrollView(
    //                   //   child: Padding(
    //                   //     padding:
    //                   //         const EdgeInsets.only(top: 0, left: 15, right: 15)
    //                   //             .r,
    //                   //     child: Column(
    //                   //       children: [
    //                   //         20.ph,
    //                   //         // Text("Business Insight",
    //                   //         //     style: GoogleFonts.poppins(
    //                   //         //       fontSize: 24,
    //                   //         //       color: Color(0xff5A5A5A),
    //                   //         //       fontWeight: FontWeight.w600,
    //                   //         //     )),

    //                   //         Row(
    //                   //           //mainAxisAlignment: MainAxisAlignment.center,
    //                   //           children: [
    //                   //             CardMakretPlace(
    //                   //                 textColor: const Color(0xffFF6D17),
    //                   //                 svgPath: 'assets/images/building.svg',
    //                   //                 headingText: 'Bussines Community',
    //                   //                 boxText: '1',
    //                   //                 onTap: () {
    //                   //                   // Get.toNamed(bussinesCommunitiesScreen,
    //                   //                   //     arguments: controller.arguments);
    //                   //                   // context.goNamed(bussinesCommunitiesScreen, extra: person);
    //                   //                   GoRouter.of(context).pushNamed(
    //                   //                     bussinesCommunitiesScreen,
    //                   //                     //extra: person
    //                   //                   );
    //                   //                 },
    //                   //                 subHeadingText:
    //                   //                     'It serves as a comprehensive directory, showcasing company profiles with industry, locations, products, services, and contact details for easy access and networking.'),
    //                   //             20.pw,
    //                   //             CardMakretPlace(
    //                   //               textColor: const Color(0xff188F71),
    //                   //               svgPath: 'assets/images/tenders.svg',
    //                   //               headingText: 'Tenders',
    //                   //               boxText: '4',
    //                   //               onTap: () {
    //                   //                 GoRouter.of(context)
    //                   //                     .pushNamed(tendersView, extra: person);
    //                   //               },
    //                   //               subHeadingText:
    //                   //                   'It presents a list of tenders for companies to bid on projects, contracts, and procurements, offered by buyers, fostering engagement and collaboration with various industries.',
    //                   //             ),
    //                   //           ],
    //                   //         ),
    //                   //         20.ph,
    //                   //         Row(
    //                   //           //mainAxisAlignment: MainAxisAlignment.center,
    //                   //           children: [
    //                   //             CardMakretPlace(
    //                   //                 textColor: const Color(0xffFCAB10),
    //                   //                 svgPath: 'assets/images/online_store.svg',
    //                   //                 headingText: 'Online Store',
    //                   //                 boxText: '2',
    //                   //                 onTap: () {
    //                   //                   GoRouter.of(context).pushNamed(
    //                   //                       onlineStoreScreen,
    //                   //                       extra: person);
    //                   //                 },
    //                   //                 subHeadingText:
    //                   //                     'It hosts an online store providing a platform for suppliers to showcase and sell their products online, catering to diverse customers worldwide.'),
    //                   //             20.pw,
    //                   //             CardMakretPlace(
    //                   //               textColor: const Color(0xff4B6FFF),
    //                   //               svgPath: 'assets/images/general_service.svg',
    //                   //               headingText: 'General Services',
    //                   //               boxText: '5',
    //                   //               onTap: () {
    //                   //                 GoRouter.of(context).pushNamed(
    //                   //                     generalServiceView,
    //                   //                     extra: person);
    //                   //               },
    //                   //               subHeadingText:
    //                   //                   'It offers a general services catalog for service providers to showcase and sell their services online, catering to diverse customers worldwide.',
    //                   //             ),
    //                   //           ],
    //                   //         ),
    //                   //         20.ph,
    //                   //         Row(
    //                   //           //mainAxisAlignment: MainAxisAlignment.center,
    //                   //           children: [
    //                   //             CardMakretPlace(
    //                   //               textColor: const Color(0xffFCAB10),
    //                   //               svgPath: 'assets/images/bussines_sale.svg',
    //                   //               headingText: 'Bussines For Sale',
    //                   //               boxText: '3',
    //                   //               onTap: () {
    //                   //                 GoRouter.of(context).pushNamed(
    //                   //                     bussinesForSale,
    //                   //                     extra: person);
    //                   //               },
    //                   //               subHeadingText:
    //                   //                   'To facilitate the sale of existing business to potential buyers. Business owners looking to sell their ventures can list their opportunities in this section.',
    //                   //             ),
    //                   //             20.pw,
    //                   //             CardMakretPlace(
    //                   //               textColor: const Color(0xff4B6FFF),
    //                   //               svgPath:
    //                   //                   'assets/images/investment_opportunities.svg',
    //                   //               headingText: 'Invesetment Opportunities',
    //                   //               boxText: '6',
    //                   //               onTap: () {
    //                   //                 GoRouter.of(context).pushNamed(
    //                   //                     investMentOpportunityView,
    //                   //                     extra: person);
    //                   //               },
    //                   //               subHeadingText:
    //                   //                   'It presents investment opportunities listed by business owners aiming for partnerships, growth, franchising, and more attracting interested investors and potential collaborators.',
    //                   //             ),
    //                   //           ],
    //                   //         ),
    //                   //       ],
    //                   //     ),
    //                   //   ),
    //                   // ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ));
  }
}
