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
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../../../Widgets/AppBar/my_app_bar.dart';
import '../Notifier/apprisal_notifier.dart';

// ignore: must_be_immutable
class ApprisalScreen extends ConsumerWidget {
  int buildcheck = 0;

  ApprisalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(apprisalProvider.notifier);
    final state = ref.watch(apprisalProvider);
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showFilter: false,
        title: "Employee Center",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
            ).r,
            child: Text(
              'Apprisal',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            10.ph,
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
                        onTap: () {},
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,
                          margin: const EdgeInsets.only(
                                  bottom: 20, left: 26, right: 25, top: 10)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 19, right: 18, bottom: 23, top: 9)
                              .r,

                          decoration: BoxDecoration(
                            color: Color(0xffF9F9F9),
                            borderRadius: BorderRadius.circular(10).r,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
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
                              Text(
                                'Department',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.sp,
                                  color: const Color(0xff453F3F),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              6.ph,
                              Container(
                                padding: EdgeInsets.only(
                                        left: 21,
                                        right: 22,
                                        bottom: 13.7,
                                        top: 12)
                                    .r,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(6).r,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Designation',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: const Color(0xff4B4F54),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          'Department',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: const Color(0xff4B4F54),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                    9.ph,
                                    Divider(
                                      color: Color(0xffDBDBDB),
                                    ),
                                    9.ph,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Employee',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: const Color(0xff4B4F54),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          'Appraisal Date',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            color: const Color(0xff4B4F54),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                    9.ph,
                                    Divider(
                                      color: Color(0xffDBDBDB),
                                    ),
                                    9.ph,
                                    Text(
                                      'Overall Rating',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        color: const Color(0xff4B4F54),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    5.1.ph,
                                    StarRating(
                                      color:
                                          Color(0xffD4983E).withOpacity(0.80),
                                      rating: 3,
                                    )
                                  ],
                                ),
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
