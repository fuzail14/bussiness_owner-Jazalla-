import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/Font/fonts.dart';
import '../../Constants/constants.dart';
import '../CustomButton/custom_button.dart';
import '../Loader/loader.dart';
import '../My Button/my_button.dart';

class DescriptionFieldAttachment extends StatelessWidget {
  final TextEditingController? controller;
  final String? text;
  final String? hintText;
  final String? buttonName;
  final VoidCallback? buttonOnTap;
  final String? fileName;
  Color? containerFillColor;

  Color? borderColor;
  void Function()? pdfOnTap;
  double? textFieldheight;

  void Function()? browseButtonOnTap;
  bool buttonLoading;
  bool attachmentContentShow;
  TextStyle? firstTextstyle;
  double? firstTextstyleFontSize;

  DescriptionFieldAttachment(
      {super.key,
      this.controller,
      this.buttonName,
      this.text,
      this.hintText,
      this.pdfOnTap,
      this.fileName,
      this.containerFillColor,
      this.borderColor,
      this.buttonOnTap,
      this.buttonLoading = false,
      this.attachmentContentShow = false,
      this.browseButtonOnTap,
      this.textFieldheight,
      this.firstTextstyle,
      this.firstTextstyleFontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? '',
          style: firstTextstyle ??
              GoogleFonts.montserrat(
                  fontSize: firstTextstyleFontSize ?? 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff4D4D4D)),
        ),
        15.ph,
        Container(
          height: textFieldheight ?? 162.h,
          padding:
              const EdgeInsets.only(top: 12.5, left: 16, right: 16, bottom: 23)
                  .r,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(7).r,
            border: Border.all(color: Color(0xffEFEFF2)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 12.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: TextFormField(
            validator: emptyStringValidator,
            maxLines: 5,
            controller: controller,
            decoration: InputDecoration(
                hintText: 'Enter Your Details Here...',
                hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffC8C7CC)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
          ),
        ),
        if (attachmentContentShow) ...[
          attachmentCustom(
              pdfOnTap: pdfOnTap,
              fileName: fileName,
              browseButtonOnTap: browseButtonOnTap,
              buttonLoading: buttonLoading,
              buttonOnTap: buttonOnTap,
              buttonName: buttonName)
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     16.ph,
          //     Text('Attachment', style: FontManagment().poppins16WithColor()),
          //     15.ph,
          //     InkWell(
          //       onTap: pdfOnTap,
          //       child: SizedBox(
          //         height: 114.h,
          //         width: double.infinity,
          //         child: DottedBorder(
          //           color: const Color(0xff1849D6),
          //           dashPattern: const [8, 4],
          //           radius: const Radius.circular(8).r,
          //           stackFit: StackFit.expand,
          //           strokeWidth: 2,
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               SvgPicture.asset(
          //                 'assets/images/upload_icon.svg',
          //                 height: 24.h,
          //                 width: 24.h,
          //                 fit: BoxFit.fitHeight,
          //               ),
          //               5.ph,
          //               Text(fileName ?? 'Your file(s) to start uploading',
          //                   style: FontManagment().inter10),
          //               5.ph,
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   SizedBox(
          //                     width: 50.w,
          //                     child: const Divider(
          //                       color: Color(0xffE7E7E7),
          //                       thickness: 2,
          //                     ),
          //                   ),
          //                   20.pw,
          //                   Text(
          //                     'OR',
          //                     style: FontManagment().interColor10,
          //                   ),
          //                   20.pw,
          //                   SizedBox(
          //                       width: 50.w,
          //                       child: const Divider(
          //                         color: Color(0xffE7E7E7),
          //                         thickness: 2,
          //                       ))
          //                 ],
          //               ),
          //               8.ph,
          //               InkWell(
          //                 onTap: browseButtonOnTap,
          //                 child: Container(
          //                   width: 62.w,
          //                   height: 22.h,
          //                   decoration: BoxDecoration(
          //                       color: whiteColor,
          //                       borderRadius: BorderRadius.circular(5).r,
          //                       border: Border.all(
          //                         color: const Color(0xff1849D6),
          //                       )),
          //                   child: Center(
          //                     child: Text(
          //                       'Browse File',
          //                       style: GoogleFonts.inter(
          //                           fontSize: 8.sp,
          //                           color: const Color(0xff1849D6),
          //                           fontWeight: FontWeight.w600),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //     45.ph,
          //     (buttonLoading)
          //         ? const Center(child: CircularProgressIndicator())
          //         : Center(
          //             child: MyButton(
          //                 //width: 160.w,

          //                 height: 48.h,
          //                 name: 'Send Request',
          //                 style: FontManagment().quicksand12,
          //                 color: const Color(0xff27BCEB),
          //                 //textColor: HexColor('#8518FF'),

          //                 onPressed: buttonOnTap),
          //           ),
          //   ],
          // ),
        ]
      ],
    );
  }
}

Widget attachmentCustom(
    {pdfOnTap,
    fileName,
    browseButtonOnTap,
    buttonLoading,
    buttonOnTap,
    buttonName}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      16.ph,
      Text('Attachment', style: FontManagment().poppins16WithColor()),
      15.ph,
      InkWell(
        onTap: pdfOnTap,
        child: SizedBox(
          height: 114.h,
          width: double.infinity,
          child: DottedBorder(
            color: const Color(0xff1849D6),
            dashPattern: const [8, 4],
            radius: const Radius.circular(8).r,
            stackFit: StackFit.expand,
            strokeWidth: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/upload_icon.svg',
                  height: 24.h,
                  width: 24.h,
                  fit: BoxFit.fitHeight,
                ),
                5.ph,
                Text(fileName ?? 'Your file(s) to start uploading',
                    style: FontManagment().inter10),
                5.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: const Divider(
                        color: Color(0xffE7E7E7),
                        thickness: 2,
                      ),
                    ),
                    20.pw,
                    Text(
                      'OR',
                      style: FontManagment().interColor10,
                    ),
                    20.pw,
                    SizedBox(
                        width: 50.w,
                        child: const Divider(
                          color: Color(0xffE7E7E7),
                          thickness: 2,
                        ))
                  ],
                ),
                8.ph,
                InkWell(
                  onTap: browseButtonOnTap,
                  child: Container(
                    width: 62.w,
                    height: 22.h,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5).r,
                        border: Border.all(
                          color: const Color(0xff1849D6),
                        )),
                    child: Center(
                      child: Text(
                        'Browse File',
                        style: GoogleFonts.inter(
                            fontSize: 8.sp,
                            color: const Color(0xff1849D6),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      45.ph,
      (buttonLoading)
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: MyButton(
                  //width: 160.w,

                  height: 48.h,
                  name: buttonName ?? 'Send Request',
                  style: FontManagment().quicksand12,
                  color: const Color(0xff27BCEB),
                  //textColor: HexColor('#8518FF'),

                  onPressed: buttonOnTap),
            ),
    ],
  );
}
