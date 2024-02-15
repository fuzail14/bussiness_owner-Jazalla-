import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Constants/api_routes.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Widgets/CustomButton/custom_button.dart';
import '../../../../Widgets/CustomDialog/custom_dialog.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../../../../Widgets/StarRating/star_rating.dart';
import '../Controller/general_service_controller.dart';

class GeneralServiceView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(generalServiceStateProvider.notifier);
    final state = ref.watch(generalServiceStateProvider);

    return Scaffold(
      appBar: MyAppBar(
        title: 'General Service',
        size: 50.h,
      ),
      body: SafeArea(
        child: Column(
          children: [
            26.ph,
            Row(
              children: [
                Container(
                  width: 281.w,
                  height: 36.h,
                  padding: EdgeInsets.only(left: 20).r,
                  margin: EdgeInsets.only(left: 26).r,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: HexColor('#DEDEDE'))),
                  child: TextField(
                    onChanged: (query) {
                      controller.debounce(() {
                        controller.serviceSearchApi(query: query);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "What are you looking for?",
                      hintStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: HexColor('#75788D')),
                      suffixIcon: Container(
                        padding: EdgeInsets.only(right: 22).r,
                        width: 22.w,
                        height: 21.h,
                        child: SvgPicture.asset(
                          'assets/images/search.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                10.pw,
                IconButton(
                  onPressed: () {
                    showCustomCupertinoDialog(
                      context: context,
                      dialogTitle: 'Filter',
                      actions: controller.getDialogActions(context, ref),
                    );
                  },
                  icon: SvgPicture.asset('assets/images/filter.svg'),
                ),
              ],
            ),
            if (state.responseStatus == Status.loading)
              const Loader()
            else if (state.responseStatus == Status.completed) ...[
              20.ph,
              if (state.servicesList.isEmpty) ...[
                Center(
                  child: Text(
                    'No Services Found.',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: HexColor('#EB2F2F')),
                  ),
                ),
              ] else
                Expanded(
                    child: ListView.builder(
                  itemCount: state.servicesList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var services = state.servicesList[index];
                    return InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(serviceDetailPage,
                            pathParameters: {'id': services.id.toString()},
                            extra: controller.person.Bearer);
                      },
                      child: Container(
                        // height: 325.h,
                        margin: const EdgeInsets.only(
                                top: 15, left: 27, right: 27, bottom: 15)
                            .r,
                        padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 23, bottom: 20)
                            .r,
                        color: HexColor('#F3F4F5'),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //first card
                            Container(
                              width: 328.w,
                              height: 166.h,
                              padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10)
                                  .r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16).r,
                                color: Colors.white,
                              ),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    //height: 200.h,
                                    child: Wrap(
                                      children: [
                                        if (services.photos!.isNotEmpty) ...[
                                          Container(
                                            width: 100.w,
                                            height: 100.h,
                                            // margin: const EdgeInsets.symmetric(
                                            //         horizontal: 10)
                                            //     .r,
                                            padding: const EdgeInsets.all(10).r,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        HexColor('#08B783'))),
                                            child: services.photos!.isNotEmpty
                                                ? CachedNetworkImage(
                                                    imageUrl:
                                                        Api.originalImageBaseUrl +
                                                            services.photos!
                                                                .first.imagePath
                                                                .toString() +
                                                            services.photos!
                                                                .first.imageName
                                                                .toString(),
                                                    fit: BoxFit.fill,
                                                  )
                                                : SvgPicture.asset(
                                                    'assets/images/building.svg',
                                                    width: 100.w,
                                                    height: 100.h,
                                                  ),
                                          ),
                                        ] else
                                          Container(
                                            width: 100.w,
                                            height: 100.h,
                                            // margin: const EdgeInsets.symmetric(
                                            //         horizontal: 10)
                                            //     .r,
                                            padding: const EdgeInsets.all(10).r,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: HexColor('#08B783')),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/images/building.svg',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 110,
                                    ).r,
                                    child: StarRating(
                                      color: HexColor('#FCAB10'),
                                      rating: 4,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 110,
                                      top: 10,
                                      right: 30,
                                    ).r,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          services.name.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                        5.ph,
                                        AutoSizeText(
                                          services.companies!.companyName
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: HexColor('#6A7380')),
                                        ),
                                        AutoSizeText(
                                          services.unitPrice.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color: HexColor('#6A7380')),
                                        ),
                                        AutoSizeText(
                                          services.salePrice.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                        5.ph,
                                        AutoSizeText(
                                          services.companies!.companyCode
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.favorite_border,
                                      size: 20.h,
                                      color: HexColor('#6A7380'),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            12.ph,
                            //detail

                            Text(
                              'Description',
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: HexColor('#000000')),
                            ),
                            5.ph,

                            AutoSizeText(
                              services.description.toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: HexColor('#0D0B0C')),
                            ),
                            20.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    services.id;
                                    controller.person.data!.id;
                                    services.companyId;
                                    controller.person.data!.companyId;
                                    print(services.id);
                                    print(
                                        "user id ${controller.person.data!.id}");
                                    print(services.companyId);
                                    print(
                                        "buyer id ${controller.person.data!.companyId}");

                                    final quoteData = {
                                      'serviceId': services.id,
                                      'serviceCompanyId': services.companyId,
                                      'userId': controller.person.data!.id,
                                      'userCompanyId':
                                          controller.person.data!.companyId
                                    };

                                    GoRouter.of(context).pushNamed(
                                      requestProposalScreen,
                                      extra: quoteData,
                                    );
                                  },
                                  child: CustomButton(
                                    height: 28.h,
                                    width: 120.w,
                                    borderColor: HexColor('#27BCEB'),
                                    text: 'Request Proposal',
                                    textColor: HexColor('#27BCEB'),
                                  ),
                                ),
                                //30.pw,
                                GestureDetector(
                                  onTap: () {
                                    services.id;
                                    controller.person.data!.id;
                                    services.companyId;
                                    final inquiryData = {
                                      'serviceId': services.id,
                                      'userId': controller.person.data!.id,
                                      'companyId': services.companyId,
                                    };

                                    GoRouter.of(context).pushNamed(
                                      serviceinquiryScreen,
                                      extra: inquiryData,
                                    );
                                  },
                                  child: CustomButton(
                                    height: 28.h,
                                    width: 120.w,
                                    color: HexColor('#27BCEB'),
                                    text: 'Send Inquiry',
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ))
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
      ),
    );
  }
}
