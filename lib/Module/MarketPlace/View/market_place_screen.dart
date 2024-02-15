import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/Person/person_controller.dart';
import '../Widget/market_place_screen_card.dart';

class MarketPlaceScreen extends ConsumerWidget {
  const MarketPlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.read(personProvider);

    return Scaffold(
        //backgroundColor: Colors.red,
        body: Stack(
      children: [
        Container(
          height: 195.h,
          padding: EdgeInsets.only(
            left: 43,
          ).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36).r,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Color(0xff23c2ea), Color(0xff792efd)],
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                    child: SvgPicture.asset('assets/images/drawer.svg')),
              ),
              83.pw,
              Text(
                'MarketPlace',
                style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              25.pw,
              Container(child: SvgPicture.asset('assets/images/bellicon.svg')),
              15.pw,
              SizedBox(
                  width: 32.w,
                  height: 32.h,
                  child: CircleAvatar(
                      child: SvgPicture.asset(
                          'assets/images/mobile_circle1.svg'))),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 128,
          ).r,
          padding: EdgeInsets.only(
            top: 31,
            left: 25,
          ).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36).r,
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("your business insights",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )),
              14.ph,
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardMakretPlace(
                    color: Color(0x14ff6d17),
                    textColor: Color(0xffFF6D17),
                    svgPath: 'assets/images/building.svg',
                    headingText: 'Bussines Community',
                    boxText: '1',
                    onTap: () {
                      // Get.toNamed(bussinesCommunitiesScreen,
                      //     arguments: controller.arguments);
                      // context.goNamed(bussinesCommunitiesScreen, extra: person);
                      GoRouter.of(context)
                          .pushNamed(bussinesCommunitiesScreen, extra: person);
                    },
                    subHeadingText:
                        'It serves as a comprehensive directory, showcasing company profiles with industry, locations, products, services, and contact details for easy access and networking.',
                  ),
                  20.pw,
                  CardMakretPlace(
                    color: Color(0x14fcab10),
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
              20.ph,
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardMakretPlace(
                    color: Color(0x14fcab10),
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
                    color: Color(0x14188f71),
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
                    color: Color(0x144b6fff),
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
                    color: Color(0x14ff4bcc),
                    textColor: Color(0xff4B6FFF),
                    svgPath: 'assets/images/investment_opportunities.svg',
                    headingText: 'Invesetment Opportunities',
                    boxText: '6',
                    onTap: () {
                      GoRouter.of(context)
                          .pushNamed(investMentOpportunityView, extra: person);
                    },
                    subHeadingText:
                        'It presents investment opportunities listed by business owners aiming for partnerships, growth, franchising, and more attracting interested investors and potential collaborators.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
