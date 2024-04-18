import 'package:animate_do/animate_do.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Widgets/AppBar/my_app_bar.dart';
import '../../../Widgets/HomeAppBar/home_app_bar.dart';
import '../Widget/market_place_screen_card.dart';

class MarketPlaceScreen extends ConsumerWidget {
  int buildCheck = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.read(personProvider);

    print('marketplace');
    print(person!.data!.lastName!);
    print(person!.data!.mobileNo!);
    print('market place build check ${buildCheck++}');

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: MyAppBar(
          title: 'MarketPlace',
          showFilter: false,
          showBackButton: false,
          bellOnTap: () {
            GoRouter.of(context).pushNamed(notificationsScreen, extra: person);
          },
        ),
        body: Column(
          children: [
            50.ph,
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 15, right: 15).r,
                child: Column(
                  children: [
                    20.ph,
                    // Text("Business Insight",
                    //     style: GoogleFonts.poppins(
                    //       fontSize: 24,
                    //       color: Color(0xff5A5A5A),
                    //       fontWeight: FontWeight.w600,
                    //     )),

                    Row(
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
                                'It serves as a comprehensive directory, showcasing company profiles with industry, locations, products, services, and contact details for easy access and networking.'),
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
                    20.ph,
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                'It hosts an online store providing a platform for suppliers to showcase and sell their products online, catering to diverse customers worldwide.'),
                        20.pw,
                        CardMakretPlace(
                          textColor: Color(0xff4B6FFF),
                          svgPath: 'assets/images/general_service.svg',
                          headingText: 'General Services',
                          boxText: '5',
                          onTap: () {
                            GoRouter.of(context)
                                .pushNamed(generalServiceView, extra: person);
                          },
                          subHeadingText:
                              'It offers a general services catalog for service providers to showcase and sell their services online, catering to diverse customers worldwide.',
                        ),
                      ],
                    ),
                    20.ph,
                    Row(
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
                          textColor: Color(0xff4B6FFF),
                          svgPath: 'assets/images/investment_opportunities.svg',
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
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
