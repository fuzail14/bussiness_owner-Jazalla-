import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/Person/person_controller.dart';
import '../Notifier/employee_center_notifier.dart';
import '../Widget/employee_center_custom_card.dart';

class EmployeeCenterPage extends ConsumerWidget {
  const EmployeeCenterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.read(personProvider);
    final notifier = ref.read(employeeCenterProvider.notifier);

    final state = ref.read(employeeCenterProvider);

    print(person!.data!.id!);
    print(person.Bearer);
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: MyAppBar(
          title: 'Employee Center',
          showBackButton: false,
        ),
        //backgroundColor: Colors.red,
        body: Container(
          width: width,
          // padding: EdgeInsets.only(left: 35, right: 35).r,
          margin: const EdgeInsets.only(left: 35, right: 35).r,
          // color: Colors.red,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.ph,
              GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .pushNamed(attendanceManagmentScreen, extra: person);
                },
                child: Container(
                  width: 345.w,

                  padding: const EdgeInsets.only(
                          left: 0, right: 0, bottom: 38, top: 37)
                      .r,

                  // margin: const EdgeInsets.only(
                  //         left: 35, right: 0, bottom: 0, top: 0)
                  //     .r,

                  //margin: EdgeInsets.only(left: 10),

                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(16).r,
                  //   color: whiteColor,
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.2),
                  //       spreadRadius: 0,
                  //       blurRadius: 2,
                  //       offset: Offset(0, 3), // changes position of shadow
                  //     ),
                  //   ],
                  // ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(
                        color: const Color(0xff449FC6).withOpacity(0.6)),
                    borderRadius: BorderRadius.circular(8).r,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
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
                      //12.ph,
                      Container(
                        height: 60.22.h,
                        width: 60.22.w,
                        // decoration: const BoxDecoration(
                        //   shape: BoxShape.circle,
                        //   // color: Color(0xffF9F9F9),
                        //   gradient: LinearGradient(
                        //     stops: [0.01, 0.5],
                        //     // begin: Alignment.bottomRight,
                        //     // end: Alignment.bottomLeft,

                        //     begin: Alignment
                        //         .bottomCenter, // Begin gradient from top right
                        //     end: Alignment.topCenter,
                        //     colors: <Color>[
                        //       Color(0xff1F3996),
                        //       Color(0xffFFFFFF),
                        //     ],
                        //   ),

                        //   //borderRadius: BorderRadius.circular(8.0).r,
                        // ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xff1F3996),
                          ),
                          // color: Color(0xffF9F9F9),
                          // gradient: LinearGradient(
                          //   stops: [0.01, 0.5],
                          //   // begin: Alignment.bottomRight,
                          //   // end: Alignment.bottomLeft,

                          //   begin:
                          //       Alignment.bottomCenter, // Begin gradient from top right
                          //   end: Alignment.topCenter,
                          //   colors: <Color>[
                          //     Color(0xff1F3996),
                          //     Color(0xffFFFFFF),
                          //   ],
                          // ),

                          //borderRadius: BorderRadius.circular(8.0).r,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/employee_center_card_icon.svg',
                          fit: BoxFit.none,
                        ),
                      ),
                      10.ph,
                      Text(
                        'Attendance Management',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            color: const Color(0xff1F3996),
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
              ),
              28.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 16.pw,
                  CardEmployeeCenter(
                    //margin: const EdgeInsets.only(left: 31).r,
                    textColor: const Color(0xffFCAB10),
                    svgPath: 'assets/images/employee_center_card_icon2.svg',
                    headingText: 'Leave Management',
                    onTap: () {
                      GoRouter.of(context)
                          .pushNamed(leaveManagmentScreen, extra: person);
                      // GoRouter.of(context)
                      //     .pushNamed(onlineStoreScreen, extra: person);
                    },
                  ),
                  //20.pw,
                  CardEmployeeCenter(
                    //margin: const EdgeInsets.only(right: 33).r,
                    textColor: const Color(0xffFCAB10),
                    svgPath: 'assets/images/employee_center_card_icon3.svg',
                    headingText: 'Salary Payslip',
                    onTap: () {
                      GoRouter.of(context)
                          .pushNamed(salaryPaySlipScreen, extra: person);
                    },
                  ),
                ],
              ),
              28.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardEmployeeCenter(
                    textColor: const Color(0xff188F71),
                    svgPath: 'assets/images/employee_center_card_icon4.svg',
                    headingText: 'Appraisal',
                    onTap: () {
                      GoRouter.of(context)
                          .pushNamed(apprisalScreen, extra: person);
                    },
                  ),
                  //20.pw,
                  CardEmployeeCenter(
                    textColor: const Color(0xffFCAB10),
                    svgPath: 'assets/images/employee_center_card_icon5.svg',
                    headingText: 'General Information',
                    onTap: () {},
                  ),
                ],
              ),
              //  20.ph,
            ],
          ),
        ));
  }
}
