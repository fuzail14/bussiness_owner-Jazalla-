import 'dart:ui';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CardMakretPlace extends StatelessWidget {
  CardMakretPlace(
      {super.key,
      this.headingText,
      this.boxText,
      this.subHeadingText,
      this.onTap,
      this.svgPath,
      this.textColor});
  String? headingText;
  String? boxText;
  String? subHeadingText;
  void Function()? onTap;
  Color? color;
  String? svgPath;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            width: 160.w,
            height: 140.h,
            padding:
                const EdgeInsets.only(left: 20, top: 20, right: 5, bottom: 0).r,
            decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                border: Border.all(
                    color: const Color(0xffF6F6F6).withOpacity(0.15)),
                borderRadius: const BorderRadius.all(Radius.circular(15)).r),

            // decoration: BoxDecoration(
            //     color: const Color(0xffF6F6F6).withOpacity(0.15),
            //     border: Border.all(
            //         color: const Color(0xffF6F6F6).withOpacity(0.15)),
            //     borderRadius: const BorderRadius.all(Radius.circular(15)).r),

            child: Column(
              children: [
                SvgPicture.asset(
                  svgPath!,
                  color: const Color(0xff1F3996),
                  height: 40.h,
                  //width: 40.w,
                ),

                8.ph,
                SizedBox(
                  width: 120.w,
                  child: Text(
                    headingText!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        color: const Color(0xff1F3996),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                ),
                // 4.ph,
                // AutoSizeText(
                //   subHeadingText!,
                //   maxLines: 3,
                //   textAlign: TextAlign.center,
                //   overflow: TextOverflow.ellipsis,
                //   style: GoogleFonts.roboto(
                //       color: Color(0xff8DAEAE),
                //       fontWeight: FontWeight.w400,
                //       fontSize: 10.sp),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
