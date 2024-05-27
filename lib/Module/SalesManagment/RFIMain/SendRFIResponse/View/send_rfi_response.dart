import 'dart:io';

import 'package:bussines_owner/Constants/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Widgets/AppBar/my_app_bar.dart';
import '../../../../../Widgets/DescriptionTextField/description_field_attachment.dart';
import '../Notifier/send_rfi_response_notifier.dart';

class SendRFIResponseView extends ConsumerWidget {
  const SendRFIResponseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(sendRFIResponseProvider.notifier);
    final state = ref.watch(sendRFIResponseProvider);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
        showBell: false,
        showFilter: false,
        title: "Send RFI Response",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20).r,
        child: Form(
          key: controller.key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DescriptionFieldAttachment(
                text: 'Description',
                hintText: 'Enter Description',
                controller: controller.descriptionController,
                attachmentContentShow: true,
                buttonLoading: state.isLoading,
                pdfOnTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                  );

                  if (result != null) {
                    File file = File(result.files.single.path!);

                    controller.setPdfFile(file);
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

                    controller.setPdfFile(file);
                  }
                },
                fileName: state.pdfFile?.path.split('/').last,
                buttonOnTap: () {
                  if (controller.key.currentState!.validate()) {
                    ref
                        .read(sendRFIResponseProvider.notifier)
                        .sendResponseOfInformation(
                            rfiId: controller.rfiId,
                            companyId: controller.person.data!.companyId,
                            userId: controller.person.data!.id,
                            response_detail:
                                controller.descriptionController.text,
                            pdfFile: state.pdfFile,
                            context: context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
