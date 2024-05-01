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
import '../Notifier/approval_authority_notifier.dart';

// ignore: must_be_immutable
class ApprovalAuthorityScreen extends ConsumerWidget {
  int buildcheck = 0;

  ApprovalAuthorityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(approvalAuthorityProvider.notifier);
    final state = ref.watch(approvalAuthorityProvider);
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showFilter: false,
        title: "Administrator Center",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, right: 0, left: 0).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Approval Authority',
                    style: FontManagment()
                        .montserrat18HeadingEmployeeCenterAllModules),
                InkWell(
                    onTap: () {
                      GoRouter.of(context).pushNamed(
                          approvalAuthorityCreateScreen,
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
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CheckInDialog(
                                    title: 'Approval Details',
                                    svgPath:
                                        'assets/images/attendance_managment_dialog_icon.svg',
                                  ));
                        },
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,
                          margin: const EdgeInsets.only(
                                  bottom: 20, left: 26, right: 25, top: 10)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 28, right: 27, bottom: 27, top: 18)
                              .r,

                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(14).r,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
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
                                'Module',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.sp,
                                  color: const Color(0xff9FA2AB),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              3.ph,
                              Text(
                                'Procurememt Management',
                                maxLines: 1,
                                style: GoogleFonts.montserrat(
                                  fontSize: 18.sp,
                                  color: const Color(0xff181818),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              10.ph,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Function',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 13.sp,
                                          color: const Color(0xff9FA2AB),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150.w,
                                        child: Text(
                                          'Order Management',
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
                                        'User',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 13.sp,
                                          color: const Color(0xff9FA2AB),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150.w,
                                        child: Text(
                                          'Fuzail Fuzail',
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
                                        '1st Approval',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 13.sp,
                                          color: const Color(0xff9FA2AB),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150.w,
                                        child: Text(
                                          'Muhammad Ahmed',
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
                                        'Final Approval',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 13.sp,
                                          color: const Color(0xff9FA2AB),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150.w,
                                        child: Text(
                                          'Ahmed Ahmed',
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

class CheckInDialog extends StatelessWidget {
  String title;
  String svgPath;
  CheckInDialog({super.key, required this.title, required this.svgPath});
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(left: 0.0, right: 0.0),
          width: 320.w,
          //  height: 403.h,
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  // height: 403.h,
                  // padding: const EdgeInsets.only(
                  //         top: 18.0, right: 23, left: 22.4, bottom: 30)
                  //     .r,
                  margin:
                      const EdgeInsets.only(top: 50.0, right: 8.0, bottom: 0).r,

                  decoration: BoxDecoration(
                      color: whiteColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      40.2.ph,
                      Center(
                        child: Text(
                          title,
                          style: GoogleFonts.montserrat(
                              fontSize: 18.22.sp,
                              color: const Color(0xff5F5656),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      // padding: const EdgeInsets.only(
                      //         top: 18.0, right: 23, left: 22.4, bottom: 30)
                      //     .r,
                      33.4.ph,
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18.0, right: 23, left: 22.4, bottom: 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Module',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    color: const Color(0xff4B4F54),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 175.w,
                                  child: Text(
                                    'Procurement Management',
                                    maxLines: 1,
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      color: const Color(0xff4B4F54),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            6.ph,
                            const Divider(
                              color: Color(0xffDBDBDB),
                            ),
                            6.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Function',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    color: const Color(0xff4B4F54),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 175.w,
                                  child: Text(
                                    'Order Management',
                                    maxLines: 1,
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      color: const Color(0xff4B4F54),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            6.ph,
                            const Divider(
                              color: Color(0xffDBDBDB),
                            ),
                            6.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'User',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    color: const Color(0xff4B4F54),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 175.w,
                                  child: Text(
                                    'Abu Aban (CPO)',
                                    maxLines: 1,
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      color: const Color(0xff4B4F54),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            6.ph,
                            const Divider(
                              color: Color(0xffDBDBDB),
                            ),
                            6.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Action',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    color: const Color(0xff4B4F54),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 175.w,
                                  child: Text(
                                    'Purchase Order',
                                    maxLines: 1,
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      color: const Color(0xff4B4F54),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            6.ph,
                            const Divider(
                              color: Color(0xffDBDBDB),
                            ),
                            6.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Condition',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    color: const Color(0xff4B4F54),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 175.w,
                                  child: Text(
                                    'Amount > 500.00',
                                    maxLines: 1,
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      color: const Color(0xff4B4F54),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            6.ph,
                            const Divider(
                              color: Color(0xffDBDBDB),
                            ),
                            6.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Amount',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    color: const Color(0xff4B4F54),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 175.w,
                                  child: Text(
                                    '\$ 5000.00',
                                    maxLines: 1,
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      color: const Color(0xff4B4F54),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                      17.ph,
                      Container(
                        color: const Color(0xffF9F9F9),
                        padding: const EdgeInsets.only(
                                left: 21, right: 21, top: 21, bottom: 21)
                            .r,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0).r,
                              child: SvgPicture.asset(
                                'assets/images/approval_authority_full_divider.svg',
                              ),
                            ),
                            8.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'INITIATOR',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 11.sp,
                                        color: const Color(0xff4B4F54),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 60.w,
                                      child: Text('Abdullah Abdullah',
                                          maxLines: 2,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 9.sp,
                                            color: const Color(0xff4B4F54),
                                            fontWeight: FontWeight.w400,
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SvgPicture.asset(
                                    //   'assets/images/dialog_tick.svg',
                                    // ),
                                    // 8.ph,
                                    Text(
                                      '1st Approval',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 11.sp,
                                        color: const Color(0xff4B4F54),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70.w,
                                      child: Text('Muhammad(Services Manager)',
                                          maxLines: 2,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 9.sp,
                                            color: const Color(0xff4B4F54),
                                            fontWeight: FontWeight.w400,
                                          )),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    // SvgPicture.asset(
                                    //   'assets/images/dialog_tick.svg',
                                    // ),
                                    // 8.ph,
                                    Text(
                                      'Final Approval',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 11.sp,
                                        color: const Color(0xff4B4F54),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70.w,
                                      child: Text('Muhammad(Sales Manager)',
                                          maxLines: 2,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 9.sp,
                                            color: const Color(0xff4B4F54),
                                            fontWeight: FontWeight.w400,
                                          )),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      31.ph,
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 30.h,
                          width: 147.w,
                          margin: const EdgeInsets.symmetric(horizontal: 75).r,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16).r,
                              gradient: const LinearGradient(colors: [
                                Color(0xff2751A1),
                                Color(0xff4BB3CF)
                              ])),
                          child: Center(
                            child: Text(
                              'Done',
                              style: FontManagment().montserrat14White,
                            ),
                          ),
                        ),
                      ),
                      30.ph,
                    ],
                  ),
                ),
                Positioned(
                  top: 10
                      .h, // This positions the top of the CircleAvatar at the top edge of the Stack.
                  left: (280.w / 2) -
                      (41.8.w /
                          2), // This centers the CircleAvatar horizontally in the Stack.
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      radius: 61.8.h /
                          2, // This sets the radius of the CircleAvatar.
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset(svgPath),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
