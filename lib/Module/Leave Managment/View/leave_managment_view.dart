import 'dart:ui';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
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
import '../../../Constants/Person/person_controller.dart';
import '../../../Widgets/AppBar/my_app_bar.dart';
import '../Notifier/leave_managment_notifier.dart';

// ignore: must_be_immutable
class LeaveManagmentScreen extends ConsumerWidget {
  int buildcheck = 0;

  LeaveManagmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(leaveManagmentProvider.notifier);
    final state = ref.watch(leaveManagmentProvider);
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
            padding: const EdgeInsets.only(top: 25, right: 30, left: 112).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Leave Management',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                  ),
                ),
                InkWell(
                    onTap: () {
                      GoRouter.of(context).pushNamed(leaveCreateScreen,
                          extra: controller.person);
                    },
                    child: SvgPicture.asset('assets/images/plus_button.svg'))
              ],
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
                                  left: 28, right: 27, bottom: 21, top: 19)
                              .r,

                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(14).r,
                              border: Border.all(color: Color(0xffDCE2EF))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pending',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.sp,
                                  color: Color(0xffFC0000),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              5.ph,
                              Text(
                                'Abdullah',
                                style: GoogleFonts.montserrat(
                                  fontSize: 24.sp,
                                  color: blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              15.ph,
                              Column(
                                children: [
                                  leaveManagmentCardText(
                                      title: 'Leave Type',
                                      subTitle: 'Casual Leave'),
                                  10.ph,
                                  leaveManagmentCardText(
                                    title: 'Applied On',
                                    subTitle: '02 January 2024',
                                  ),
                                  10.ph,
                                  leaveManagmentCardText(
                                    title: 'Start Date',
                                    subTitle: '02 January 2024',
                                  ),
                                  10.ph,
                                  leaveManagmentCardText(
                                    title: 'End Date',
                                    subTitle: '02 March 2024',
                                  ),
                                  10.ph,
                                  leaveManagmentCardText(
                                    title: 'Total Days',
                                    subTitle: '15 Days',
                                  ),
                                  10.ph,
                                  leaveManagmentCardText(
                                    title: 'Reason',
                                    subTitle: 'Some',
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

Widget leaveManagmentCardText(
    {required String title, required String subTitle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 13.sp,
          color: Color(0xff9FA2AB),
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        subTitle,
        style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            color: Color(0xff313131),
            fontWeight: FontWeight.bold),
      ),
    ],
  );
}
