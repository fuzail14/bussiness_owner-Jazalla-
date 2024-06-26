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
import 'package:http/http.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../../Widgets/Loader/loader.dart';
import '../../../../Constants/Font/fonts.dart';
import '../../../../Widgets/AppBar/my_app_bar.dart';
import '../Model/CompanyPolicy.dart';
import '../Notifier/company_policy_notifier.dart';

// ignore: must_be_immutable
class CompanyPolicyScreen extends ConsumerWidget {
  int buildcheck = 0;

  CompanyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(companyPolicyProvider.notifier);
    final state = ref.watch(companyPolicyProvider);
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
            child: Text('Company Policy',
                style: FontManagment()
                    .montserrat18HeadingEmployeeCenterAllModules),
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            10.ph,
            if (state.companypolicies.isEmpty) ...[
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
                    itemCount: state.companypolicies.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CheckInDialog(
                                    title: 'Company Policy Details',
                                    svgPath:
                                        'assets/images/company_policy_popup_icon.svg',
                                    companypolicies:
                                        state.companypolicies[index],
                                  ));
                        },
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,
                          margin: const EdgeInsets.only(
                                  bottom: 10, left: 26, right: 27, top: 10)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 27, right: 0, bottom: 20, top: 20)
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
                              Text(
                                'Department',
                                maxLines: 1,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  color: const Color(0xff212121),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              10.ph,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/company_policy_icon1.svg'),
                                      10.pw,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 150.w,
                                            child: Text(
                                              state.companypolicies[index]
                                                      .title ??
                                                  '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 14.sp,
                                                color: const Color(0xff212121),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 150.w,
                                            child: Text(
                                              'Title',
                                              maxLines: 1,
                                              textDirection: TextDirection.ltr,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 10.sp,
                                                color: const Color(0xff979797),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  8.ph,
                                  const Divider(color: Color(0xffB7C9E2)),
                                  8.ph,
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/company_policy_icon2.svg'),
                                      10.pw,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 150.w,
                                            child: Text(
                                              state.companypolicies[index]
                                                      .description ??
                                                  '',
                                              maxLines: 1,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 14.sp,
                                                color: const Color(0xff212121),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 150.w,
                                            child: Text(
                                              'Description',
                                              maxLines: 2,
                                              textDirection: TextDirection.ltr,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 10.sp,
                                                color: const Color(0xff979797),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      45.1.pw,
                                      SvgPicture.asset(
                                        'assets/images/forward_arrow.svg',
                                        color: Color(0xff181818),
                                      ),
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

class CheckInDialog extends StatelessWidget {
  String title;
  String svgPath;
  Companypolicies companypolicies;
  CheckInDialog(
      {super.key,
      required this.title,
      required this.svgPath,
      required this.companypolicies});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
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
                                  'Department',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    color: const Color(0xff4B4F54),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.4,
                                  child: Text(
                                    companypolicies.departments!.name ?? "",
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
                                  'Titles',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    color: const Color(0xff4B4F54),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.4,
                                  child: Text(
                                    companypolicies.title ?? "",
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
                            14.ph,
                            Text(
                              'Description',
                              maxLines: 1,
                              textDirection: TextDirection.rtl,
                              style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                color: const Color(0xff4B4F54),
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),

                      7.ph,
                      Container(
                        width: 301.w,
                        color: const Color(0xffF9F9F9),
                        padding: const EdgeInsets.only(
                                left: 21, right: 0, top: 21, bottom: 21)
                            .r,
                        margin: const EdgeInsets.only(
                            top: 0, right: 23, left: 22.4, bottom: 0),
                        child: Text(
                          companypolicies.description ?? "",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontSize: 10.sp,
                            color: const Color(0xff979797),
                            fontWeight: FontWeight.w600,
                          ),
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
