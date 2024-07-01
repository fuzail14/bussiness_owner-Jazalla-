import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../../Constants/Font/fonts.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Routes/set_routes.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../Notifier/bid_management_service_detail_notifier.dart';

class BidManagementServiceDetailPage extends ConsumerWidget {
  const BidManagementServiceDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(bidManagementDetailServiceProvider.notifier);
    final state = ref.watch(bidManagementDetailServiceProvider);
    return Scaffold(
      appBar: MyAppBar(
        title: "Bid Detail",
        bellOnTap: () {
          GoRouter.of(context).pushNamed(notificationsScreen);
        },
      ),
      backgroundColor: whiteColor,
      body: Column(
        children: [
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            25.ph,
            Expanded(
                child: ListView(
              //itemCount: state.invoice.length,
              padding: const EdgeInsets.only(left: 26, right: 26, bottom: 50),
              shrinkWrap: true,
              children: [
                Text('Bid Details',
                    style: FontManagment()
                        .montserrat18HeadingEmployeeCenterAllModules),
                20.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('General Information',
                        style: GoogleFonts.montserrat(
                            color: const Color(0xff181818),
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                          bidServiceResponseRecieveView,
                          pathParameters: {'id': '${1}'},
                        );
                      },
                      child: Container(
                        height: 23.h,
                        width: 85.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4).r,
                            color: Color(0xffF6F6F6)),
                        child: Center(
                          child: Text(
                            'Response List',
                            style: GoogleFonts.poppins(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff504A4A)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                10.ph,
                Container(
                  padding:
                      EdgeInsets.only(left: 28, top: 20, right: 27, bottom: 23)
                          .r,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(14).r,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(
                          1.0,
                          3.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bid Title',
                            style: FontManagment().montserrat13WithColor(),
                          ),
                          Text(
                            'Test Bid',
                            style: FontManagment().montserrat14WithColor(),
                          )
                        ],
                      ),
                      8.ph,
                      const Divider(
                        color: Color(0xffDBDBDB),
                      ),
                      8.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bid End Date',
                            style: FontManagment().montserrat13WithColor(),
                          ),
                          Text(
                            '02 January 2024',
                            style: FontManagment().montserrat14WithColor(),
                          )
                        ],
                      ),
                      8.ph,
                      const Divider(
                        color: Color(0xffDBDBDB),
                      ),
                      8.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bid End Time',
                            style: FontManagment().montserrat13WithColor(),
                          ),
                          Text(
                            '09:40 PM',
                            style: FontManagment().montserrat14WithColor(),
                          )
                        ],
                      ),
                      8.ph,
                      const Divider(
                        color: Color(0xffDBDBDB),
                      ),
                      8.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bid Status',
                            style: FontManagment().montserrat13WithColor(),
                          ),
                          Text(
                            'Expired',
                            style: FontManagment().montserrat14WithColor(),
                          )
                        ],
                      ),
                      8.ph,
                      const Divider(
                        color: Color(0xffDBDBDB),
                      ),
                      8.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bid Type',
                            style: FontManagment().montserrat13WithColor(),
                          ),
                          Text(
                            'Product',
                            style: FontManagment().montserrat14WithColor(),
                          )
                        ],
                      ),
                      8.ph,
                      const Divider(
                        color: Color(0xffDBDBDB),
                      ),
                      8.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status',
                            style: FontManagment().montserrat13WithColor(),
                          ),
                          Text(
                            'Published Bid',
                            style: FontManagment().montserrat14WithColor(),
                          )
                        ],
                      ),
                      8.ph,
                      const Divider(
                        color: Color(0xffDBDBDB),
                      ),
                      8.ph,
                    ],
                  ),
                ),
                20.ph,
                Text('Product Information',
                    style: FontManagment()
                        .montserrat18HeadingEmployeeCenterAllModules),
                10.ph,
                Container(
                  // padding:
                  //     EdgeInsets.only(left: 28, top: 20, right: 27, bottom: 23)
                  //         .r,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(14).r,
                    border: Border.all(color: Color(0xffE4DFDF), width: 0.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: const Offset(
                          1.0,
                          3.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(left: 19, top: 15, bottom: 14)
                                .r,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffFDFDFD),
                            border: Border.all(
                              color: Color(0xffE4DFDF),
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14))),
                        child: Text('Product Classification',
                            style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1F1F1F))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                                left: 18.2, right: 17.2, top: 13)
                            .r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Segment',
                              style: FontManagment().montserrat13WithColor(),
                            ),
                            Text(
                              'Family',
                              style: FontManagment().montserrat13WithColor(),
                            ),
                            Text(
                              'Segment',
                              style: FontManagment().montserrat13WithColor(),
                            ),
                            Text(
                              'Family',
                              style: FontManagment().montserrat13WithColor(),
                            ),
                          ],
                        ),
                      ),
                      8.ph,
                      // const Divider(
                      //   color: Color(0xffDBDBDB),
                      // ),
                      Container(
                        padding: const EdgeInsets.only(
                                left: 19, top: 15, bottom: 14, right: 10)
                            .r,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffFDFDFD),
                            border: Border.all(
                              color: Color(0xffE4DFDF),
                            ),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 70,
                              child: Text(
                                'Commercial and Military and Private Vehicles and their.... ',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: FontManagment().montserrat13WithColor(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Text(
                                'Motor Vehicles',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: FontManagment().montserrat13WithColor(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Text(
                                'Passenger motor vehicles',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: FontManagment().montserrat13WithColor(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Text(
                                'Automobiles or cars - 25101503',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: FontManagment().montserrat13WithColor(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      17.2.ph,
                      Container(
                        padding:
                            const EdgeInsets.only(left: 19, top: 15, bottom: 14)
                                .r,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffFDFDFD),
                            border: Border.all(
                              color: Color(0xffE4DFDF),
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14))),
                        child: Text('Shipping Location',
                            style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff1F1F1F))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                                left: 18.2, right: 17.2, top: 13)
                            .r,
                        child: Text(
                          'Primary Address',
                          style: FontManagment().montserrat13WithColor(
                              color: blackColor, fontWeight: FontWeight.w500),
                        ),
                      ),
                      8.ph,
                      // const Divider(
                      //   color: Color(0xffDBDBDB),
                      // ),
                      Container(
                        padding: const EdgeInsets.only(
                                left: 19, top: 15, bottom: 14, right: 10)
                            .r,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffFDFDFD),
                            border: Border.all(
                              color: Color(0xffE4DFDF),
                            ),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14))),
                        child: SizedBox(
                          width: 70,
                          child: Text(
                            'Office no - 406, Olaya- 34448, Khobar, Saudi Arabia ',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: FontManagment().montserrat13WithColor(
                                fontSize: 9,
                                fontWeight: FontWeight.w300,
                                color: blackColor),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                20.ph,
                Text('Selected Vendor',
                    style: FontManagment()
                        .montserrat18HeadingEmployeeCenterAllModules),
                20.ph,
                Container(
                  padding:
                      EdgeInsets.only(left: 28, top: 20, right: 27, bottom: 18),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(14).r,
                    //   border: Border.all(color: Color(0xffE4DFDF), width: 0.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: const Offset(
                          1.0,
                          3.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selected Suppliers',
                          style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1F1F1F))),
                      10.ph,
                      Text(
                        'Khobar Company (A0053)',
                        style: FontManagment().montserrat13WithColor(),
                      ),
                      5.ph,
                      const Divider(
                        color: Color(0xffDBDBDB),
                      ),
                    ],
                  ),
                )
              ],
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
