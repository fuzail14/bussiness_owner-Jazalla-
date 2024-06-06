import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../../Widgets/Loader/loader.dart';
import '../../../../Constants/Font/fonts.dart';
import '../../../../Widgets/AppBar/my_app_bar.dart';
import '../../Event/Model/EmployeeEvenyt.dart';
import '../Notifier/promotion_notifier.dart';

// ignore: must_be_immutable
class PromotionView extends ConsumerWidget {
  int buildcheck = 0;

  PromotionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(promotionProvider.notifier);
    final state = ref.watch(promotionProvider);
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
            child: Text('Promotion',
                style: FontManagment()
                    .montserrat18HeadingEmployeeCenterAllModules),
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            //10.ph,
            if (state.event.isEmpty) ...[
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
                    itemCount: state.event.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CheckInDialog(
                                    title: 'Details',
                                    svgPath:
                                        'assets/images/event_popup_icon.svg',
                                    employeeevent: state.event[index],
                                  ));
                        },
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,
                          margin: const EdgeInsets.only(
                                  bottom: 10, left: 26, right: 25, top: 10)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 19, right: 18, bottom: 15, top: 15)
                              .r,

                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(14).r,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
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
                                  Text('Employee',
                                      style:
                                          FontManagment().poppins13WithColor()),
                                  SizedBox(
                                    width: 150.w,
                                    child: Text("Abu Ahmad",
                                        maxLines: 1,
                                        textDirection: TextDirection.rtl,
                                        style: FontManagment()
                                            .poppins14WithColor()),
                                  )
                                ],
                              ),
                              //5.ph,
                              Divider(
                                color: Color(0xffDBDBDB),
                              ),
                              // 5.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Designation',
                                      style:
                                          FontManagment().poppins13WithColor()),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text("Project Manager",
                                        textDirection: TextDirection.rtl,
                                        maxLines: 1,
                                        style: FontManagment()
                                            .poppins14WithColor()),
                                  )
                                ],
                              ),
                              //5.ph,
                              Divider(
                                color: Color(0xffDBDBDB),
                              ),
                              // 5.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Promotion Title',
                                      style:
                                          FontManagment().poppins13WithColor()),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text("Senior CEO",
                                        textDirection: TextDirection.rtl,
                                        maxLines: 1,
                                        style: FontManagment()
                                            .poppins14WithColor()),
                                  )
                                ],
                              ),
                              //5.ph,
                              Divider(
                                color: Color(0xffDBDBDB),
                              ),
                              // 5.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Promotion Date',
                                      style:
                                          FontManagment().poppins13WithColor()),
                                  SizedBox(
                                    width: 100.w,
                                    child: Text("05 April 2024",
                                        textDirection: TextDirection.rtl,
                                        maxLines: 1,
                                        style: FontManagment()
                                            .poppins14WithColor()),
                                  )
                                ],
                              ),
                              // 5.ph,
                              Divider(
                                color: Color(0xffDBDBDB),
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

class CheckInDialog extends StatelessWidget {
  String title;
  String svgPath;
  Employeeevent employeeevent;
  CheckInDialog(
      {super.key,
      required this.title,
      required this.svgPath,
      required this.employeeevent});
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
                      20.4.ph,

                      Container(
                        width: 301.w,
                        color: const Color(0xffF9F9F9),
                        padding: const EdgeInsets.only(
                                left: 21, right: 0, top: 21, bottom: 21)
                            .r,
                        margin: const EdgeInsets.only(
                            top: 0, right: 23, left: 22.4, bottom: 0),
                        child: Text(
                            'Through the "Award" feature, you can specify the type of award, provide a description of why the recipient is being recognized, and even attach any relevant documents or files. Additionally.',
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: FontManagment().poppins13WithColor()),
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
