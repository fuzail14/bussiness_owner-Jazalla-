import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Module/Tenders/TendersResponse/Notifier/tender_response_controller.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../Constants/constants.dart';
import '../../../../Widgets/DescriptionTextField/description_field_attachment.dart';

class TenderResponseScreen extends ConsumerStatefulWidget {
  const TenderResponseScreen({super.key});

  @override
  _TenderResponseScreenState createState() => _TenderResponseScreenState();
}

class _TenderResponseScreenState extends ConsumerState<TenderResponseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tenderResponseNotifier = ref.watch(tenderResponseProvider.notifier);
    final tenderResponseState = ref.watch(tenderResponseProvider);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
        title: 'Tender Response',
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 23.w, right: 23.w, top: 30).w,
            // width: 362.w,
            height: 48.h,
            decoration: ShapeDecoration(
                color: const Color(0xffE2F5ED),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.w, color: const Color(0xff27BCEB)),
                  borderRadius: BorderRadius.circular(8.r),
                )),
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: const Color(0xFF5A5A5A),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              indicator: ShapeDecoration(
                color: HexColor('#4B6FFF'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r)),
              ),
              indicatorColor: HexColor('#4B6FFF'),
              tabs: [
                Tab(
                    child: Text(
                  'Express Interest',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 12.sp),
                )),
                Tab(
                  child: Text(
                    'Submit Proposal',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ExpressInterestView(),
                SubmitProposalView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpressInterestView extends ConsumerWidget {
  const ExpressInterestView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tenderResponseNotifier = ref.watch(tenderResponseProvider.notifier);
    final tenderResponseState = ref.watch(tenderResponseProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20).r,
      child: Form(
        key: tenderResponseNotifier.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DescriptionFieldAttachment(
              text: 'Description',
              firstTextstyle: FontManagment().poppins16WithColor(),
              hintText: 'Enter Description',
              controller: tenderResponseNotifier.descriptionController,
              attachmentContentShow: true,
              buttonLoading: tenderResponseState.isLoading,
              pdfOnTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);

                  tenderResponseNotifier.setPdfFile(file);
                }
              },
              browseButtonOnTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);

                  tenderResponseNotifier.setPdfFile(file);
                }
              },
              fileName: tenderResponseState.pdfFile?.path.split('/').last,
              buttonOnTap: () {
                if (tenderResponseNotifier.key.currentState!.validate()) {
                  ref
                      .read(tenderResponseProvider.notifier)
                      .sendTenderExpressInterest(
                          tenderId: tenderResponseNotifier.tenderId,
                          postCompanyId: tenderResponseNotifier.tenderCompanyId,
                          userId: tenderResponseNotifier.userId,
                          companyId: tenderResponseNotifier.userCompanyId,
                          description:
                              tenderResponseNotifier.descriptionController.text,
                          pdfFile: tenderResponseState.pdfFile,
                          context: context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SubmitProposalView extends ConsumerWidget {
  const SubmitProposalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tenderResponseNotifier = ref.watch(tenderResponseProvider.notifier);
    final tenderResponseState = ref.watch(tenderResponseProvider);
    // Build the Submit Proposal tab view
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40).r,
        child: Column(
          children: [
            //Tender Detail
            Container(
              width: 353.83331298828125.w,
              height: 327.h,
              // margin: EdgeInsets.only(
              //   top: 20,
              //   left: 20,
              //   right: 20,
              // ).r,

              //height: 186.h,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 5), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16).r,
                  color: Colors.white),
              child: Container(
                width: 311.w,
                height: 277.h,
                margin: const EdgeInsets.only(
                        top: 16, bottom: 15, left: 24.66, right: 25.73)
                    .r,
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20).r,
                decoration: BoxDecoration(
                    color: HexColor('#F7F7F9'),
                    borderRadius: BorderRadius.circular(16).r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Date *',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: HexColor('#0D0B0C')),
                    ),
                    12.ph,
                    SizedBox(
                      width: 265.w,
                      height: 23.h,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20).r,
                          fillColor: Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColor.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColor.withOpacity(0.5))),
                          suffixIcon: const Icon(Icons.calendar_month,
                              size: 15, color: Color(0xff939397)),
                          hintText: 'Delivery Date',

                          //labelText: 'Date',
                        ),
                        textAlign: TextAlign.start,
                        onTap: () {
                          tenderResponseNotifier.StartDate(context);
                        },
                        controller: tenderResponseNotifier.dateController,
                        validator: emptyStringValidator,
                      ),
                    ),
                    20.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Posted By',
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: HexColor('#6A7380')),
                        ),
                        //16.pw,
                        Text(
                          'tenders',
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: HexColor('#0D0B0C')),
                        ),
                      ],
                    ),
                    16.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Deadline',
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: HexColor('#6A7380')),
                        ),
                        //16.pw,
                        Text(
                          'tender',
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: HexColor('#0D0B0C')),
                        ),
                      ],
                    ),
                    16.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Activity',
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: HexColor('#6A7380')),
                        ),
                        //16.pw,
                        Text(
                          'tenders',
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: HexColor('#0D0B0C')),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            20.ph,
            Row(
              children: [
                SizedBox(
                  width: 200.w,
                  child: AutoSizeText(
                    'Would you like to include a cover letter with this proposal?',
                    style: GoogleFonts.quicksand(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff4D4D4D)),
                    maxLines: 2,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio(
                        value: RadioCheck.yes,
                        groupValue: tenderResponseState.radioCheckValue,
                        onChanged: (RadioCheck? value) {
                          tenderResponseNotifier.updateRadioValue(value);
                        },
                      ),
                      Text(
                        'Yes',
                        style: GoogleFonts.quicksand(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff4D4D4D)),
                      ),
                      Radio(
                        value: RadioCheck.no,
                        groupValue: tenderResponseState.radioCheckValue,
                        onChanged: (RadioCheck? value) {
                          tenderResponseNotifier.updateRadioValue(value);
                        },
                      ),
                      Text(
                        'No',
                        style: GoogleFonts.quicksand(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff4D4D4D)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            20.ph,

            DescriptionFieldAttachment(
              text: 'Description',
              hintText: 'Enter Description',
              //borderColor: borderColor,
              controller: tenderResponseNotifier.descriptionController,
              pdfOnTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);

                  tenderResponseNotifier.setPdfFile(file);
                }
              },
              browseButtonOnTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);

                  tenderResponseNotifier.setPdfFile(file);
                }
              },
              fileName: tenderResponseState.pdfFile?.path.split('/').last,
            ),
            20.ph,
            DescriptionFieldAttachment(
              text: 'Other Information',
              hintText: 'Enter Other Information',
              controller: tenderResponseNotifier.descriptionController,
              containerFillColor: Colors.white,
              borderColor: borderColor,
              attachmentContentShow: true,
              buttonLoading: tenderResponseState.isLoading,
              pdfOnTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);

                  tenderResponseNotifier.setPdfFile(file);
                }
              },
              browseButtonOnTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);

                  tenderResponseNotifier.setPdfFile(file);
                }
              },
              fileName: tenderResponseState.pdfFile?.path.split('/').last,
              buttonOnTap: () {
                if (tenderResponseNotifier.key.currentState!.validate()) {
                  // ref.read(tenderResponseProvider.notifier).sendTenderExpressInterest(
                  //     productId: '',
                  //     userId: '',
                  //     companyId: '',
                  //     description:
                  //         tenderResponseNotifier.descriptionController.text,
                  //     pdfFile: tenderResponseState.pdfFile,
                  //     context: context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
