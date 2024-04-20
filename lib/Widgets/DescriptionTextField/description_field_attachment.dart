import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../CustomButton/custom_button.dart';
import '../Loader/loader.dart';

class DescriptionFieldAttachment extends StatelessWidget {
  final TextEditingController? controller;
  final String? text;
  final String? hintText;
  final VoidCallback? onTap;
  final String? fileName;
  Color? containerFillColor;

  Color? borderColor;
  void Function()? buttonOnTap;
  bool buttonLoading;
  bool attachmentContentShow;

  DescriptionFieldAttachment({super.key, 
    this.controller,
    this.text,
    this.hintText,
    this.onTap,
    this.fileName,
    this.containerFillColor,
    this.borderColor,
    this.buttonOnTap,
    this.buttonLoading = false,
    this.attachmentContentShow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? '',
          style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff4D4D4D)),
        ),
        SizedBox(height: 5.h),
        Container(
          height: 102.h,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(8),
              color: containerFillColor ?? const Color(0xffEFEFF2)),
          child: TextFormField(
            maxLines: 5,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText ?? '',
              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        if (attachmentContentShow) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.ph,
              Text(
                'Attachment',
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4D4D4D)),
              ),
              5.ph,
              Row(
                children: [
                  Container(
                    width: 300.w,
                    height: 23.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xff19A3A3).withOpacity(0.50))),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: onTap,
                          child: Container(
                            width: 76.w,
                            height: 23.h,
                            decoration: BoxDecoration(
                                color: const Color(0xffF7F7F9),
                                border: Border.symmetric(
                                    vertical: BorderSide(
                                        color: const Color(0xff19A3A3)
                                            .withOpacity(0.35)))),
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
                        Container(
                          child: Text(
                            fileName ?? 'No file selected',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: const Color(0xff657474)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              40.ph,
              Center(
                child: GestureDetector(
                  onTap: buttonOnTap,
                  child: buttonLoading
                      ? const Loader()
                      : CustomButton(
                          width: 275.w,
                          height: 50.h,
                          fontSize: 16.sp,
                          color: const Color(0xff27BCEB),
                          text: 'Send',
                        ),
                ),
              ),
            ],
          ),
        ]
      ],
    );
  }
}
