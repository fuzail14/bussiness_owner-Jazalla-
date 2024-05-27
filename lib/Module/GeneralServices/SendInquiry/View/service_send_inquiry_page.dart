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
import '../../../../Constants/Font/fonts.dart';
import '../../../../Constants/constants.dart';
import '../../../../Widgets/DescriptionTextField/description_field_attachment.dart';
import '../Controller/service_send_inquiry_controller.dart';

class ServiceSendInquiryScreen extends ConsumerWidget {
  final Map<String, dynamic>? inquiryData;
  int buiuld = 0;
  ServiceSendInquiryScreen({super.key, this.inquiryData});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('send inquiry build check ${buiuld++}');
    final inquiryState = ref.watch(serviceinquiryProvider);
    final inquirycontroller = ref.watch(serviceinquiryProvider.notifier);

    // inquirycontroller.descriptionController.clear();
    final serviceId = inquiryData?['serviceId'];
    final title = inquiryData?['title'];

    final userId = inquiryData?['userId'];
    final userCompanyId = inquiryData?['userCompanyId'];

    final companyId = inquiryData?['companyId'];

    print(inquiryData);

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
        title: 'Send Service Inquiry',
        showBell: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20).r,
        child: Form(
          key: inquirycontroller.key,
          child: DescriptionFieldAttachment(
            firstTextstyle: FontManagment().poppins16,
            text: 'Request Detail',
            hintText: 'Enter Your Details Here...',
            controller: inquirycontroller.descriptionController,
            containerFillColor: Colors.white,
            borderColor: borderColor,
            attachmentContentShow: true,
            buttonLoading: inquiryState.isLoading,
            pdfOnTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );

              if (result != null) {
                File file = File(result.files.single.path!);
                ref.read(serviceinquiryProvider.notifier).setPdfFile(file);
              }
            },
            browseButtonOnTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );

              if (result != null) {
                File file = File(result.files.single.path!);
                ref.read(serviceinquiryProvider.notifier).setPdfFile(file);
              }
            },
            fileName: inquiryState.pdfFile?.path.split('/').last,
            buttonOnTap: () {
              if (inquirycontroller.key.currentState!.validate()) {
                ref.read(serviceinquiryProvider.notifier).saveInquiry(
                    title: title,
                    serviceId: serviceId,
                    userId: userId,
                    userCompanyId: userCompanyId,
                    supplierId: companyId,
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
