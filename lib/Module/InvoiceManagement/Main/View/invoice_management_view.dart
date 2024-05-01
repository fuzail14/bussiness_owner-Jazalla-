import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:bussines_owner/Widgets/StarRating/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../../Widgets/Loader/loader.dart';
import '../../../../Constants/Font/fonts.dart';
import '../../../../Widgets/AppBar/my_app_bar.dart';
import '../Notifier/invoice_management_notifier.dart';

// ignore: must_be_immutable
class InvoiceManagementScreen extends ConsumerWidget {
  int buildcheck = 0;

  InvoiceManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(invoiceManagementProvider.notifier);
    final state = ref.watch(invoiceManagementProvider);
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showFilter: false,
        title: "Invoice Mangement",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
            ).r,
            child: Text('Invoice Payable',
                style: FontManagment()
                    .montserrat18HeadingEmployeeCenterAllModules),
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            15.ph,
            if (state.request4Informatio.isEmpty) ...[
              Center(
                child: Text(
                  'No Requests Found.',
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#EB2F2F')),
                ),
              ),
            ] else
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.request4Informatio.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                            invoiceManagementDetailPage,
                            pathParameters: {'id': '4'},
                          );
                        },
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,
                          margin: const EdgeInsets.only(
                                  bottom: 20, left: 26, right: 25, top: 0)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 27.5, right: 26, bottom: 10, top: 14)
                              .r,

                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(12).r,
                              border: Border.all(color: Color(0xffB7C9E2))),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 180.w,
                                        child: Text(
                                          'Invoice',
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 20.sp,
                                            color: Color(0xff181818),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '#INV0004444000000',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12.sp,
                                          color: const Color(0xff909090),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Paid',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14.sp,
                                      color: const Color(0xff22A527),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              11.ph,
                              const Divider(
                                color: Color(0xffEEEEEE),
                              ),
                              11.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Issue Date',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14.sp,
                                          color: const Color(0xff212121),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Mar 23,2024',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12.sp,
                                          color: const Color(0xff909090),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Due Date',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14.sp,
                                          color: const Color(0xff212121),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'Mar 23,2024',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12.sp,
                                          color: const Color(0xff909090),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Due Amount',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14.sp,
                                          color: const Color(0xff212121),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '\$0.00',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12.sp,
                                          color: const Color(0xff909090),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
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
