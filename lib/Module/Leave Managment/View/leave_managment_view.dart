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
import '../../../Widgets/AppBar/my_app_bar.dart';
import '../Notifier/leave_managment_notifier.dart';

// ignore: must_be_immutable
class LeaveManagmentScreen extends ConsumerWidget {
  int buildcheck = 0;

  LeaveManagmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print(state.person!.data!.id!);

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
            padding: const EdgeInsets.only(top: 25, right: 0, left: 0).r,
            child: Row(
              mainAxisAlignment: (controller.person!.data!.type == 'company')
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceAround,
              children: [
                Text('Leave Management',
                    style: FontManagment()
                        .montserrat18HeadingEmployeeCenterAllModules),
                (controller.person!.data!.type == 'company')
                    ? Container()
                    : InkWell(
                        onTap: () {
                          GoRouter.of(context).pushNamed(leaveCreateScreen,
                              extra: controller.person);
                        },
                        child:
                            SvgPicture.asset('assets/images/plus_button.svg'))
              ],
            ),
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            10.ph,
            if (state.employeeleave.isEmpty) ...[
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
                    itemCount: state.employeeleave.length,
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
                              border:
                                  Border.all(color: const Color(0xffDCE2EF))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.employeeleave[index].status.toString(),
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.sp,
                                  color: (state.employeeleave[index].status ==
                                          'Approved')
                                      ? const Color(0xff22A527)
                                      : const Color(0xffFC0000),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              5.ph,
                              Text(
                                state.employeeleave[index].employee!.name ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
                                    subTitle: state
                                        .employeeleave[index].leaveType!.title
                                        .toString(),
                                  ),
                                  10.ph,
                                  leaveManagmentCardText(
                                    title: 'Applied On',
                                    subTitle: state
                                        .employeeleave[index].appliedOn
                                        .toString(),
                                  ),
                                  10.ph,
                                  leaveManagmentCardText(
                                    title: 'Start Date',
                                    subTitle: state
                                        .employeeleave[index].startDate
                                        .toString(),
                                  ),
                                  10.ph,
                                  leaveManagmentCardText(
                                    title: 'End Date',
                                    subTitle: state.employeeleave[index].endDate
                                        .toString(),
                                  ),
                                  10.ph,
                                  leaveManagmentCardText(
                                    title: 'Total Days',
                                    subTitle: state
                                        .employeeleave[index].totalLeaveDays
                                        .toString(),
                                  ),
                                  10.ph,
                                  leaveManagmentCardText(
                                    title: 'Reason',
                                    subTitle: state
                                        .employeeleave[index].leaveReason
                                        .toString(),
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
                "No Leave Found",
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
        maxLines: 1,
        style: GoogleFonts.montserrat(
          fontSize: 13.sp,
          color: const Color(0xff9FA2AB),
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(
        width: 150.w,
        child: Text(
          subTitle,
          maxLines: 1,
          textDirection: TextDirection.rtl,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              color: const Color(0xff313131),
              fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
