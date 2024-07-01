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
import '../Notifier/inventory_management_sales_notifier.dart';

// ignore: must_be_immutable
class InventoryManagementSalesView extends ConsumerWidget {
  int buildcheck = 0;

  InventoryManagementSalesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(inventoryManagementSalesProvider.notifier);
    final state = ref.watch(inventoryManagementSalesProvider);
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showFilter: false,
        title: "Inventory Mangement",
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
            child: Text('Inventory Management List',
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
                      return GestureDetector(
                        onTap: () {
                          // GoRouter.of(context).pushNamed(
                          //   bidManagementProcurementDetailPage,
                          //   pathParameters: {
                          //     'id': '${state.invoices[index].id}'
                          //   },
                          // );
                        },
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,
                          margin: const EdgeInsets.only(
                                  bottom: 20, left: 26, right: 25, top: 0)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 22, right: 21, bottom: 11, top: 13)
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Text('Furniture Door',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            FontManagment().poppins14WithColor(
                                          color: const Color(0xff343131),
                                        )),
                                  ),
                                  if (state.invoices[index].status == 1) ...[
                                    Container(
                                      height: 24,
                                      width: 96,
                                      decoration: BoxDecoration(
                                          color: Color(0xffC2EECC)
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          'Active',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: const Color(0xff03781D),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                                  //status should be changed this 4 only for view
                                  else if (state.invoices[index].status ==
                                      4) ...[
                                    Container(
                                      height: 24,
                                      width: 96,
                                      decoration: BoxDecoration(
                                          color: Color(0xffFEE1E1)
                                              .withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          'In Active',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: const Color(0xffBA1717),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                                ],
                              ),
                              8.ph,
                              const Divider(
                                color: Color(0xffDBDBDB),
                              ),
                              7.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Price',
                                      style: FontManagment().poppins12),
                                  Text('500 SAR',
                                      style: FontManagment().poppins12),
                                ],
                              ),
                              5.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Location',
                                      style: FontManagment().poppins12),
                                  Text('Al Khobar',
                                      style: FontManagment().poppins12),
                                ],
                              ),
                              5.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Alert QTY',
                                      style: FontManagment().poppins12),
                                  Text('300', style: FontManagment().poppins12),
                                ],
                              ),
                              5.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('UNSPSC',
                                      style: FontManagment().poppins12),
                                  Text('101001065',
                                      style: FontManagment().poppins12),
                                ],
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
