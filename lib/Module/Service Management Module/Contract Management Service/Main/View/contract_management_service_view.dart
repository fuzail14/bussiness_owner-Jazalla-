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
import '../../../../../Constants/Font/fonts.dart';
import '../../../../../Widgets/AppBar/my_app_bar.dart';
import '../Notifier/contract_management_service_notifier.dart';

// ignore: must_be_immutable
class ContractManagementServiceView extends ConsumerWidget {
  int buildcheck = 0;

  ContractManagementServiceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(contractManagementServiceProvider.notifier);
    final state = ref.watch(contractManagementServiceProvider);
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showFilter: false,
        title: "Contract Mangement",
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
            child: Text('Contract Management List',
                style: FontManagment()
                    .montserrat18HeadingEmployeeCenterAllModules),
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            15.ph,
            if (state.invoices.isEmpty) ...[
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
                    itemCount: state.invoices.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(
                                left: 20, top: 14, right: 20, bottom: 23)
                            .r,
                        margin: const EdgeInsets.only(
                                left: 26, top: 10, right: 25, bottom: 23)
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
                            Text(
                              'Villa Construction',
                              style: FontManagment().poppins14WithColor(),
                            ),
                            10.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Project',
                                  style:
                                      FontManagment().montserrat13WithColor(),
                                ),
                                Text(
                                  'Construction',
                                  style:
                                      FontManagment().montserrat14WithColor(),
                                )
                              ],
                            ),
                            8.ph,
                            const Divider(
                              color: Color(0xffDBDBDB),
                            ),
                            8.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Contract Type',
                                  style:
                                      FontManagment().montserrat13WithColor(),
                                ),
                                Text(
                                  'Unit Price Contract',
                                  style:
                                      FontManagment().montserrat14WithColor(),
                                )
                              ],
                            ),
                            8.ph,
                            const Divider(
                              color: Color(0xffDBDBDB),
                            ),
                            8.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Contract Value',
                                  style:
                                      FontManagment().montserrat13WithColor(),
                                ),
                                Text(
                                  '15000.00 SAR',
                                  style:
                                      FontManagment().montserrat14WithColor(),
                                )
                              ],
                            ),
                            8.ph,
                            const Divider(
                              color: Color(0xffDBDBDB),
                            ),
                            8.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Contract With',
                                  style:
                                      FontManagment().montserrat13WithColor(),
                                ),
                                Text(
                                  'Tamara Tradings',
                                  style:
                                      FontManagment().montserrat14WithColor(),
                                )
                              ],
                            ),
                            8.ph,
                            const Divider(
                              color: Color(0xffDBDBDB),
                            ),
                            8.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Payment Mode ',
                                  style:
                                      FontManagment().montserrat13WithColor(),
                                ),
                                Text(
                                  'Milestone',
                                  style:
                                      FontManagment().montserrat14WithColor(),
                                )
                              ],
                            ),
                            8.ph,
                            const Divider(
                              color: Color(0xffDBDBDB),
                            ),
                            8.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status',
                                  style:
                                      FontManagment().montserrat13WithColor(),
                                ),
                                Text(
                                  'Cntract reuest Sent',
                                  style:
                                      FontManagment().montserrat14WithColor(),
                                )
                              ],
                            ),
                            8.ph,
                            const Divider(
                              color: Color(0xffDBDBDB),
                            ),
                            18.ph,
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 5, top: 13, bottom: 17, right: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xffF9F9FA)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Start Date :',
                                        style: FontManagment()
                                            .montserrat14WithColor(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '15-05-2024',
                                        style: FontManagment()
                                            .montserrat13WithColor(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Due Date :',
                                        style: FontManagment()
                                            .montserrat14WithColor(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '15-05-2024',
                                        style: FontManagment()
                                            .montserrat13WithColor(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
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

class DraftSentDialog extends StatelessWidget {
  String title;
  String? button1Title;
  String? button2Title;
  Color? button1Color;
  Color? button2Color;
  Color? button1TextColor;
  Color? button2TextColor;

  DraftSentDialog(
      {super.key,
      required this.title,
      this.button1Title,
      this.button2Title,
      this.button1Color,
      this.button2Color,
      this.button1TextColor,
      this.button2TextColor});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20).r,
        decoration: BoxDecoration(
            color: whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.0),
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
            Center(
              child: Text(title,
                  style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff707070))),
            ),
            20.ph,
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 20.h,
                      width: 57.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4).r,
                          color: button1Color ?? Color(0xffF6F6F6)),
                      child: Center(
                        child: Text(
                          button1Title ?? 'YES',
                          style: GoogleFonts.poppins(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500,
                              color:
                                  button1TextColor ?? const Color(0xff504A4A)),
                        ),
                      ),
                    ),
                  ),
                  20.pw,
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 20.h,
                      width: 57.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4).r,
                          color: button2Color ??
                              Color(0xffE42121).withOpacity(0.15)),
                      child: Center(
                        child: Text(
                          button2Title ?? 'No',
                          style: GoogleFonts.poppins(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500,
                              color:
                                  button2TextColor ?? const Color(0xffE42121)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
