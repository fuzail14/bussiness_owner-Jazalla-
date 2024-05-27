import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/Font/fonts.dart';
import '../../Constants/constants.dart';

class PdfFileDottedDesign extends StatelessWidget {
  PdfFileDottedDesign(
      {super.key,
      this.onTap,
      this.height,
      this.fileName,
      this.browseButtonOnTap});
  void Function()? onTap;
  double? height;
  String? fileName;
  void Function()? browseButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height ?? 114.h,
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
    );
  }
}
