import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../../Widgets/Loader/loader.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Bid Management Procurement/Main/View/bid_management_procurement_view.dart';
import '../../Main/Notifier/supplier_management_mainpage_notifier.dart';
import '../Notifier/add_supplier_notifier.dart';

class AddSupplierScreen extends ConsumerWidget {
  int buildcheck = 0;

  AddSupplierScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(addSupplierProvider.notifier);
    final state = ref.watch(addSupplierProvider);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    print('build check  ${buildcheck++}');

    return Scaffold(
      // appBar: MyAppBar(
      //   showBell: false,
      //   showFilter: false,
      //   title: "RFI Managemet",
      //   // filterOnPressed: () {
      //   //   _scaffoldKey.currentState?.openEndDrawer();
      //   // }
      // ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10).r,
            child: Text(
              'Supplier In System',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff3A2E2E)),
            ),
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            if (state.request4Information.isEmpty) ...[
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
                    itemCount: state.request4Information.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,
                          margin: const EdgeInsets.only(
                                  bottom: 9, left: 20, right: 20, top: 9)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 0, right: 0, bottom: 18, top: 16)
                              .r,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(7).r,
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
                          child: ListTile(
                            leading: Stack(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 2, top: 3),
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffC5C5C5))),
                                ),
                                Container(
                                    height: 45.47,
                                    width: 45.47,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffF1F1F1),
                                    ),
                                    child: SvgPicture.asset(
                                        'assets/images/jazalla_only_logo.svg')),
                              ],
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: 100,
                                          child: Text(
                                            'Bright Ideas',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: FontManagment()
                                                .poppins14WithColor(
                                                    color: Color(0xff2C2B2B),
                                                    fontWeight:
                                                        FontWeight.w600),
                                          )),
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  DraftSentDialog(
                                                      title:
                                                          'Are you sure to Send this Invitation?'));
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                                  left: 10, right: 10)
                                              .r,
                                          height: 22,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff147AD6)
                                                .withOpacity(0.10),
                                            borderRadius:
                                                BorderRadius.circular(4).r,
                                          ),
                                          child: Center(
                                            child: Text('Send Invitation',
                                                maxLines: 1,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                    color: Color(0xff147AD6))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.ph,
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 18,
                                        color: Color(0xff453D3D),
                                      ),
                                      Text(
                                        'Aqrabia, Khobar',
                                        style: FontManagment()
                                            .poppins14WithColor(
                                                color: Color(0xff2C2B2B),
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
