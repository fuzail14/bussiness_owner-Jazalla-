import 'dart:io';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Constants/Font/fonts.dart';
import '../../../../Constants/constants.dart';
import '../../../../Widgets/DescriptionTextField/description_field_attachment.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../Controller/send_inquiry_controller.dart';

class InquiryScreen extends ConsumerWidget {
  final Map<String, dynamic>? inquiryData;
  int buiuld = 0;
  InquiryScreen({super.key, this.inquiryData});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('send inquiry build check ${buiuld++}');
    final inquiryState = ref.watch(inquiryProvider);
    final inquirycontroller = ref.watch(inquiryProvider.notifier);

    // inquirycontroller.descriptionController.clear();
    final productId = inquiryData?['productId'];
    final productTitle = inquiryData?['productTitle'];

    final userId = inquiryData?['userId'];
    final userCompanyId = inquiryData?['userCompanyId'];
    final companyId = inquiryData?['companyId'];
    print(productTitle);
    print(userCompanyId);
    print(companyId);

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: MyAppBar(
          title: 'Send Inquiry',
          showBell: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 28, right: 28).r,
          child: Form(
            key: inquirycontroller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DescriptionFieldAttachment(
                  firstTextstyle: FontManagment().poppins16WithColor(),
                  text: 'Request Detail',
                  hintText: 'Enter Your Details Here...',
                  controller: inquirycontroller.descriptionController,
                  containerFillColor: Colors.white,
                  borderColor: borderColor,
                  attachmentContentShow: true,
                  buttonLoading: inquiryState.isLoading,
                  pdfOnTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf'],
                    );

                    if (result != null) {
                      File file = File(result.files.single.path!);
                      ref.read(inquiryProvider.notifier).setPdfFile(file);
                    }
                  },
                  browseButtonOnTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf'],
                    );

                    if (result != null) {
                      File file = File(result.files.single.path!);
                      ref.read(inquiryProvider.notifier).setPdfFile(file);
                    }
                  },
                  fileName: inquiryState.pdfFile?.path.split('/').last,
                  buttonOnTap: () {
                    if (inquirycontroller.key.currentState!.validate()) {
                      ref.read(inquiryProvider.notifier).saveInquiry(
                          productId: productId,
                          productTitle: productTitle,
                          userId: userId,
                          userCompanyId: userCompanyId,
                          companyId: companyId,
                          description:
                              inquirycontroller.descriptionController.text,
                          pdfFile: inquiryState.pdfFile,
                          context: context);
                    }
                  },
                ),

                // Text('Request Detail', style: FontManagment().poppins16),
                // 15.ph,
                // Container(
                //   height: 162.h,
                //   padding: const EdgeInsets.only(
                //           top: 12.5, left: 16, right: 16, bottom: 23)
                //       .r,
                //   decoration: BoxDecoration(
                //     color: whiteColor,
                //     borderRadius: BorderRadius.circular(7).r,
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.3),
                //         offset: const Offset(
                //           1.0,
                //           1.0,
                //         ),
                //         blurRadius: 12.0,
                //         spreadRadius: 1.0,
                //       ),
                //     ],
                //   ),
                //   child: TextFormField(
                //     validator: emptyStringValidator,
                //     maxLines: 5,
                //     controller: inquirycontroller.descriptionController,
                //     decoration: InputDecoration(
                //         hintText: 'Enter Your Details Here...',
                //         hintStyle: GoogleFonts.poppins(
                //             fontSize: 12,
                //             fontWeight: FontWeight.w500,
                //             color: const Color(0xffC8C7CC)),
                //         enabledBorder: InputBorder.none,
                //         focusedBorder: InputBorder.none),
                //   ),
                // ),
                // 16.ph,
                // Text('Attachment', style: FontManagment().poppins16),
                // 15.ph,
                // InkWell(
                //   onTap: () async {
                //     FilePickerResult? result =
                //         await FilePicker.platform.pickFiles(
                //       type: FileType.custom,
                //       allowedExtensions: ['pdf'],
                //     );

                //     if (result != null) {
                //       File file = File(result.files.single.path!);
                //       ref.read(inquiryProvider.notifier).setPdfFile(file);
                //     }
                //   },
                //   child: SizedBox(
                //     height: 114.h,
                //     width: double.infinity,
                //     child: DottedBorder(
                //       color: const Color(0xff1849D6),
                //       dashPattern: const [8, 4],
                //       radius: const Radius.circular(8).r,
                //       stackFit: StackFit.expand,
                //       strokeWidth: 2,
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           SvgPicture.asset(
                //             'assets/images/upload_icon.svg',
                //             height: 24.h,
                //             width: 24.h,
                //             fit: BoxFit.fitHeight,
                //           ),
                //           5.ph,
                //           Text(
                //               inquiryState.pdfFile?.path.split('/').last ??
                //                   'Your file(s) to start uploading',
                //               style: FontManagment().inter10),
                //           5.ph,
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               SizedBox(
                //                 width: 50.w,
                //                 child: const Divider(
                //                   color: Color(0xffE7E7E7),
                //                   thickness: 2,
                //                 ),
                //               ),
                //               20.pw,
                //               Text(
                //                 'OR',
                //                 style: FontManagment().interColor10,
                //               ),
                //               20.pw,
                //               SizedBox(
                //                   width: 50.w,
                //                   child: const Divider(
                //                     color: Color(0xffE7E7E7),
                //                     thickness: 2,
                //                   ))
                //             ],
                //           ),
                //           8.ph,
                //           InkWell(
                //             onTap: () async {
                //               FilePickerResult? result =
                //                   await FilePicker.platform.pickFiles(
                //                 type: FileType.custom,
                //                 allowedExtensions: ['pdf'],
                //               );

                //               if (result != null) {
                //                 File file = File(result.files.single.path!);
                //                 ref
                //                     .read(inquiryProvider.notifier)
                //                     .setPdfFile(file);
                //               }
                //             },
                //             child: Container(
                //               width: 62.w,
                //               height: 22.h,
                //               decoration: BoxDecoration(
                //                   color: whiteColor,
                //                   borderRadius: BorderRadius.circular(5).r,
                //                   border: Border.all(
                //                     color: const Color(0xff1849D6),
                //                   )),
                //               child: Center(
                //                 child: Text(
                //                   'Browse File',
                //                   style: GoogleFonts.inter(
                //                       fontSize: 8.sp,
                //                       color: const Color(0xff1849D6),
                //                       fontWeight: FontWeight.w600),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // 45.ph,
                // (inquiryState.isLoading)
                //     ? const Center(child: CircularProgressIndicator())
                //     : Center(
                //         child: MyButton(
                //           //width: 160.w,

                //           height: 48.h,
                //           name: 'Send Request',

                //           style: FontManagment().quicksand12,
                //           color: const Color(0xff27BCEB),
                //           //textColor: HexColor('#8518FF'),

                //           onPressed: () {
                //             if (inquirycontroller.key.currentState!
                //                 .validate()) {
                //               ref.read(inquiryProvider.notifier).saveInquiry(
                //                   productId: productId,
                //                   productTitle: productTitle,
                //                   userId: userId,
                //                   userCompanyId: userCompanyId,
                //                   companyId: companyId,
                //                   description: inquirycontroller
                //                       .descriptionController.text,
                //                   pdfFile: inquiryState.pdfFile,
                //                   context: context);
                //             }
                //           },
                //         ),
                //       ),
              ],
            ),
          ),
        )

        // Padding(
        //   padding: const EdgeInsets.only(top: 50, left: 20, right: 20).r,
        //   child: Form(
        //     key: inquirycontroller.key,
        //     child: DescriptionFieldAttachment(
        //       text: 'Request Details*',
        //       hintText: 'Enter your description here',
        //       controller: inquirycontroller.descriptionController,
        //       attachmentContentShow: true,
        //       onTap: () async {
        //         FilePickerResult? result = await FilePicker.platform.pickFiles(
        //           type: FileType.custom,
        //           allowedExtensions: ['pdf'],
        //         );

        //         if (result != null) {
        //           File file = File(result.files.single.path!);
        //           ref.read(inquiryProvider.notifier).setPdfFile(file);
        //         }
        //       },
        //       fileName: inquiryState.pdfFile?.path.split('/').last,
        //       buttonLoading: inquiryState.isLoading,
        //       buttonOnTap: () {
        //         if (inquirycontroller.key.currentState!.validate()) {
        //           ref.read(inquiryProvider.notifier).saveInquiry(
        //               productId: productId,
        //               productTitle: productTitle,
        //               userId: userId,
        //               userCompanyId: userCompanyId,
        //               companyId: companyId,
        //               description: inquirycontroller.descriptionController.text,
        //               pdfFile: inquiryState.pdfFile,
        //               context: context);
        //         }
        //       },
        //     ),
        //   ),
        // ),

        );
  }
}
