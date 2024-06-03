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
import '../Notifier/employee_information_notifier.dart';

// ignore: must_be_immutable
class EmployeeInformationView extends ConsumerWidget {
  int buildcheck = 0;

  EmployeeInformationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(employeeInformationProvider.notifier);
    final state = ref.watch(employeeInformationProvider);
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showFilter: false,
        title: "General Information",
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
            child: Text('Manage Employee',
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
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,
                          margin: const EdgeInsets.only(
                                  bottom: 20, left: 26, right: 25, top: 5)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 28, right: 27, bottom: 27, top: 18)
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Employee ID',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.sp,
                                      color: const Color(0xff9FA2AB),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      "#Emp000001",
                                      maxLines: 1,
                                      textDirection: TextDirection.rtl,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14.sp,
                                        color: const Color(0xff313131),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              8.ph,
                              const Divider(
                                color: Color(0xffDBDBDB),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Name',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.sp,
                                      color: const Color(0xff9FA2AB),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      "Abu Ahmad",
                                      maxLines: 1,
                                      textDirection: TextDirection.rtl,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14.sp,
                                        color: const Color(0xff313131),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              8.ph,
                              const Divider(
                                color: Color(0xffDBDBDB),
                              ),
                              8.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Email',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.sp,
                                      color: const Color(0xff9FA2AB),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      "dammam@procurement.com",
                                      maxLines: 1,
                                      textDirection: TextDirection.rtl,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14.sp,
                                        color: const Color(0xff313131),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              8.ph,
                              const Divider(
                                color: Color(0xffDBDBDB),
                              ),
                              8.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Department',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.sp,
                                      color: const Color(0xff9FA2AB),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      "Procurement Department",
                                      maxLines: 1,
                                      textDirection: TextDirection.rtl,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14.sp,
                                        color: const Color(0xff313131),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              8.ph,
                              const Divider(
                                color: Color(0xffDBDBDB),
                              ),
                              8.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Designation',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.sp,
                                      color: const Color(0xff9FA2AB),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text(
                                      "Procurement Manager",
                                      maxLines: 1,
                                      textDirection: TextDirection.rtl,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14.sp,
                                        color: const Color(0xff313131),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
