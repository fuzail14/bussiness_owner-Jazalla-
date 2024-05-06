import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Routes/set_routes.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../../../../../Widgets/My Button/my_button.dart';
import '../Controller/sales_managment_rfq_detail_controller.dart';

class SalesManagmentRFQDetailPage extends ConsumerWidget {
  const SalesManagmentRFQDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(salesManagmentRFQDetailProvider.notifier);
    final state = ref.watch(salesManagmentRFQDetailProvider);
    return Scaffold(
      appBar: MyAppBar(
        showBell: false,
        showFilter: false,
        title: "RFQ Detail",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          24.ph,
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            Expanded(
                child: ListView.builder(
              itemCount: state.salesManagmentRFQDetail.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13).r,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'RFQ DETAILS',
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff414141)),
                          ),
                          20.ph,
                          Container(
                            // height: 360,

                            padding: const EdgeInsets.only(bottom: 20).r,

                            decoration: BoxDecoration(
                              color: const Color(0xff707070).withOpacity(0.08),
                              borderRadius: BorderRadius.circular(8).r,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 17)
                                      .r,
                                  child: AutoSizeText(
                                    'RFQ-${state.salesManagmentRFQDetail[index].title.toString()}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff000000)),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12).r,
                                      border: Border.all(
                                          color: const Color(0xffE1E3E8))),
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 12)
                                      .r,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Quantity Needed',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w300,
                                                color: const Color(0xff777777)),
                                          ),
                                          10.pw,
                                          Flexible(
                                            child: AutoSizeText(
                                              state
                                                  .salesManagmentRFQDetail[
                                                      index]
                                                  .quantity
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff3A3A3A)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      10.ph,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Delivery Date',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w300,
                                                color: const Color(0xff777777)),
                                          ),
                                          10.pw,
                                          Flexible(
                                            child: AutoSizeText(
                                              state
                                                  .salesManagmentRFQDetail[
                                                      index]
                                                  .deliveryDate
                                                  .toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff3A3A3A)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      10.ph,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Payment Mode',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w300,
                                                color: const Color(0xff777777)),
                                          ),
                                          10.pw,
                                          Flexible(
                                            child: AutoSizeText(
                                              state
                                                  .salesManagmentRFQDetail[
                                                      index]
                                                  .paymentMode
                                                  .toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff3A3A3A)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      10.ph,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Shipping Mode',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w300,
                                                color: const Color(0xff777777)),
                                          ),
                                          10.pw,
                                          Flexible(
                                            child: AutoSizeText(
                                              state
                                                  .salesManagmentRFQDetail[
                                                      index]
                                                  .shippingMode
                                                  .toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff3A3A3A)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Issue Date',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w300,
                                                color: const Color(0xff777777)),
                                          ),
                                          10.pw,
                                          Flexible(
                                            child: AutoSizeText(
                                              state
                                                  .salesManagmentRFQDetail[
                                                      index]
                                                  .startDate
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff3A3A3A)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      10.ph,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Issued By',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w300,
                                                color: const Color(0xff777777)),
                                          ),
                                          10.pw,
                                          Flexible(
                                            child: AutoSizeText(
                                              'Daharan Company',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff3A3A3A)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                      10.ph,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            'Unit',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w300,
                                                color: const Color(0xff777777)),
                                          ),
                                          10.pw,
                                          Flexible(
                                            child: AutoSizeText(
                                              state
                                                  .salesManagmentRFQDetail[
                                                      index]
                                                  .unit
                                                  .toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xff3A3A3A)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 17)
                                      .r,
                                  child: AutoSizeText(
                                    'Request-Details',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff000000)),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(12).r,
                                      border: Border.all(
                                          color: const Color(0xffE1E3E8))),
                                  padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 12)
                                      .r,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        state.salesManagmentRFQDetail[index]
                                            .details
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff3A3A3A)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          20.ph,
                          Center(
                            child: MyButton(
                              width: 275.w,

                              height: 50.h,
                              name: 'Send RFQ Response',
                              color: HexColor('#4CB5D0'),
                              //textColor: HexColor('#8518FF'),

                              onPressed: () {
                                GoRouter.of(context).pushNamed(sendRFQResponse);
                                // if (controller.key.currentState!.validate()) {
                                //   state.phoneNumber =
                                //       "+${state.countryCode}${controller.phoneNumberController.text}";
                                //   if (!state.isLoading) {
                                //     controller.verifyUserPhoneNumber(context);
                                //   }
                                // }
                              },
                            ),
                          ),
                        ]));
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
    );
  }
}
