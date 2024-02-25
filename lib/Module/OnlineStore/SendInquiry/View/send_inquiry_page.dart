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
    final productTitle = inquiryData?['productTitle'];

    final userId = inquiryData?['userId'];
    final userCompanyId = inquiryData?['userCompanyId'];
    final companyId = inquiryData?['companyId'];
    print(productTitle);
    print(userCompanyId);
    print(companyId);

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
                    productTitle: productTitle,
                    userId: userId,
                    userCompanyId: userCompanyId,
                    companyId: companyId,
                    description: inquirycontroller.descriptionController.text,
                    pdfFile: inquiryState.pdfFile,
                    context: context);
              }
            },
          ),
        ),
      ),
    );
  }
}
