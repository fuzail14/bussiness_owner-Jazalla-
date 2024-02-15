import 'dart:io';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:bussines_owner/Widgets/CustomButton/custom_button.dart';
import 'package:bussines_owner/Widgets/Loader/loader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Constants/constants.dart';
import '../../../../Widgets/DescriptionTextField/description_field_attachment.dart';
import '../Controller/send_inquiry_controller.dart';

class InquiryScreen extends ConsumerWidget {
  final Map<String, dynamic>? inquiryData;
  int buiuld = 0;
  InquiryScreen({this.inquiryData});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('send inquiry build check ${buiuld++}');
    final inquiryState = ref.watch(inquiryProvider);
    final inquirycontroller = ref.watch(inquiryProvider.notifier);

    // inquirycontroller.descriptionController.clear();
    final productId = inquiryData?['productId'];
    final userId = inquiryData?['userId'];
    final companyId = inquiryData?['companyId'];

    return Scaffold(
      appBar: MyAppBar(
        title: 'Send Inquiry',
        showBell: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20).r,
        child: Form(
          key: inquirycontroller.key,
          child: DescriptionFieldAttachment(
            text: 'Request Details*',
            hintText: 'Enter your description here',
            controller: inquirycontroller.descriptionController,
            attachmentContentShow: true,
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );

              if (result != null) {
                File file = File(result.files.single.path!);
                ref.read(inquiryProvider.notifier).setPdfFile(file);
              }
            },
            fileName: inquiryState.pdfFile?.path.split('/').last,
            buttonLoading: inquiryState.isLoading,
            buttonOnTap: () {
              if (inquirycontroller.key.currentState!.validate()) {
                ref.read(inquiryProvider.notifier).saveInquiry(
                    productId: productId,
                    userId: userId,
                    companyId: companyId,
                    description: inquirycontroller.descriptionController.text,
                    pdfFile: inquiryState.pdfFile,
                    context: context);
              }
            },
          ),

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text(
          //       'Request Details*',
          //       style: GoogleFonts.montserrat(
          //           fontSize: 12.sp,
          //           fontWeight: FontWeight.w400,
          //           color: Color(0xff4D4D4D)),
          //     ),
          //     5.ph,
          //     Container(
          //       height: 117.h,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(8),
          //           color: const Color(0x7fefeff4)),
          //       child: TextFormField(
          //         maxLines: 5,
          //         controller: inquirycontroller.descriptionController,
          //         validator: emptyStringValidator,
          //         decoration: const InputDecoration(
          //           hintText: 'Enter your description here',
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     ),
          //     16.ph,
          //     Row(
          //       children: [
          //         Container(
          //           width: 300.w,
          //           height: 23.h,
          //           decoration: BoxDecoration(
          //               border: Border.all(color: Color(0xff19A3A3))),
          //           child: Row(
          //             children: [
          //               GestureDetector(
          //                 onTap: () async {
          //                   FilePickerResult? result =
          //                       await FilePicker.platform.pickFiles(
          //                     type: FileType.custom,
          //                     allowedExtensions: ['pdf'],
          //                   );

          //                   if (result != null) {
          //                     File file = File(result.files.single.path!);
          //                     ref
          //                         .read(inquiryProvider.notifier)
          //                         .setPdfFile(file);
          //                   }
          //                 },
          //                 child: Container(
          //                   width: 76.w,
          //                   height: 23.h,
          //                   decoration: BoxDecoration(
          //                       color: Color(0xffF7F7F9),
          //                       border: Border.all(color: Color(0xff19A3A3))),
          //                   child: Center(
          //                     child: Text(
          //                       'Choose File',
          //                       style: GoogleFonts.montserrat(
          //                           fontWeight: FontWeight.w400,
          //                           fontSize: 10.sp,
          //                           color: Color(0xff657474)),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               20.pw,
          //               if (inquiryState.pdfFile != null) ...[
          //                 Container(
          //                   child: Text(
          //                     inquiryState.pdfFile?.path.split('/').last ??
          //                         'No file selected',
          //                     style: GoogleFonts.montserrat(
          //                         fontWeight: FontWeight.w600,
          //                         fontSize: 12.sp,
          //                         color: Color(0xff657474)),
          //                   ),
          //                 ),
          //               ],
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //     20.ph,
          //     GestureDetector(
          //       onTap: () {
          //         if (inquirycontroller.key.currentState!.validate()) {
          //           ref.read(inquiryProvider.notifier).saveInquiry(
          //               productId: productId,
          //               userId: userId,
          //               companyId: companyId,
          //               description:
          //                   inquirycontroller.descriptionController.text,
          //               pdfFile: inquiryState.pdfFile,
          //               context: context);
          //         }
          //       },
          //       child: inquiryState.isLoading
          //           ? Loader()
          //           : CustomButton(
          //               width: 119.w,
          //               height: 28.h,
          //               color: Color(0xff27BCEB),
          //               text: 'Save Inquiry',
          //             ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
