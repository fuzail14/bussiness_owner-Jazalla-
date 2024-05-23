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
import '../Notifier/holidays_notifier.dart';

// ignore: must_be_immutable
class HolidaysScreen extends ConsumerWidget {
  int buildcheck = 0;

  HolidaysScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(holidaysProvider.notifier);
    final state = ref.watch(holidaysProvider);
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showFilter: false,
        title: "Employee Center",
        bellOnTap: () {
          GoRouter.of(context).pushNamed(notificationsScreen);
        },
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
            ).r,
            child: Text('Holidays',
                style: FontManagment()
                    .montserrat18HeadingEmployeeCenterAllModules),
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            10.ph,
            if (state.holidays.isEmpty) ...[
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
                    itemCount: state.holidays.length,
                    itemBuilder: (context, index) {
                      // Parse start and end dates
                      DateTime startDate =
                          DateTime.parse(state.holidays[index].date ?? "");
                      DateTime endDate =
                          DateTime.parse(state.holidays[index].endDate ?? "");

                      // Calculate the difference in days
                      int differenceInDays =
                          endDate.difference(startDate).inDays;
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,
                          margin: const EdgeInsets.only(
                                  bottom: 10, left: 27, right: 26, top: 10)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 17, right: 16, bottom: 9, top: 9)
                              .r,

                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(7).r,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: const Offset(
                                  1.0,
                                  8.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.holidays[index].occasion ?? "",
                                    maxLines: 1,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16.sp,
                                      color: const Color(0xff181818),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      '${differenceInDays + 1} Day Holiday',
                                      maxLines: 1,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        color: const Color(0xff262627),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              5.ph,
                              Text(
                                state.holidays[index].date ?? "",
                                maxLines: 1,
                                style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  color: const Color(0xff262627),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                state.holidays[index].endDate ?? "",
                                maxLines: 1,
                                style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  color: const Color(0xff262627),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
