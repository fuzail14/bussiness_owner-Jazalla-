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
      appBar: MyAppBar(
        title: 'Send Service Inquiry',
        showBell: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20).r,
        child: Form(
          key: inquirycontroller.key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Request Details*',
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4D4D4D)),
              ),
              5.ph,
              Container(
                height: 117.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0x7fefeff4)),
                child: TextFormField(
                  maxLines: 5,
                  controller: inquirycontroller.descriptionController,
                  validator: emptyStringValidator,
                  decoration: const InputDecoration(
                    hintText: 'Enter your description here',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              16.ph,
              Row(
                children: [
                  Container(
                    width: 300.w,
                    height: 23.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff19A3A3))),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['pdf'],
                            );

                            if (result != null) {
                              File file = File(result.files.single.path!);
                              ref
                                  .read(serviceinquiryProvider.notifier)
                                  .setPdfFile(file);
                            }
                          },
                          child: Container(
                            width: 76.w,
                            height: 23.h,
                            decoration: BoxDecoration(
                                color: const Color(0xffF7F7F9),
                                border: Border.all(color: const Color(0xff19A3A3))),
                            child: Center(
                              child: Text(
                                'Choose File',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    color: const Color(0xff657474)),
                              ),
                            ),
                          ),
                        ),
                        20.pw,
                        if (inquiryState.pdfFile != null) ...[
                          Container(
                            child: Text(
                              inquiryState.pdfFile?.path.split('/').last ??
                                  'No file selected',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: const Color(0xff657474)),
                            ),
                          ),
                        ],
                      ],
                    ),
                  )
                ],
              ),
              20.ph,
              GestureDetector(
                onTap: () {
                  if (inquirycontroller.key.currentState!.validate()) {
                    ref.read(serviceinquiryProvider.notifier).saveInquiry(
                        title: title,
                        serviceId: serviceId,
                        userId: userId,
                        userCompanyId: userCompanyId,
                        supplierId: companyId,
                        description:
                            inquirycontroller.descriptionController.text,
                        pdfFile: inquiryState.pdfFile,
                        context: context);
                  }
                },
                child: inquiryState.isLoading
                    ? const Loader()
                    : CustomButton(
                        width: 119.w,
                        height: 28.h,
                        color: const Color(0xff27BCEB),
                        text: 'Save Inquiry',
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
