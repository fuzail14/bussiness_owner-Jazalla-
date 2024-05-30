import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Constants/Font/fonts.dart';

// ignore: must_be_immutable
class CardMakretPlace extends StatelessWidget {
  CardMakretPlace(
      {super.key,
      this.headingText,
      this.boxText,
      this.subHeadingText,
      this.onTap,
      this.svgPath,
      this.textColor,
      this.svgColor});
  String? headingText;
  String? boxText;
  String? subHeadingText;
  void Function()? onTap;
  Color? color;
  String? svgPath;
  Color? svgColor;

  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(8).r),
          child: ListTile(
            leading: SizedBox(
              height: 48.h,
              width: 48.w,
              child: CircleAvatar(
                backgroundColor: Color(0xffF5F5F5).withOpacity(0.8),
                child: SizedBox(
                  height: 28.h,
                  width: 28.w,
                  child: SvgPicture.asset(
                    svgPath!,
                    color: svgColor ?? const Color(0xff434E4E),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            title: Text(
              headingText!,
              maxLines: 1,
              style: FontManagment().poppins16WithColor(
                  color: const Color(0xff535050), fontSize: 14),
            ),
            subtitle: Text(
              subHeadingText!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: FontManagment().poppins10WithColor(
                  color: const Color(0xff443434), fontWeight: FontWeight.w300),
            ),
          ),
        )

        //GRID STYLE OLD CODE
        // child: Container(
        //   width: 160.w,
        //   height: 140.h,

        //   decoration: BoxDecoration(
        //       color: const Color(0xffF6F6F6).withOpacity(0.15),
        //       border:
        //           Border.all(color: const Color(0xffF6F6F6).withOpacity(0.15)),
        //       borderRadius: const BorderRadius.all(Radius.circular(15)).r),

        //   // decoration: BoxDecoration(
        //   //     color: const Color(0xffF6F6F6).withOpacity(0.15),
        //   //     border: Border.all(
        //   //         color: const Color(0xffF6F6F6).withOpacity(0.15)),
        //   //     borderRadius: const BorderRadius.all(Radius.circular(15)).r),

        //   child: Column(
        //     children: [
        //       SvgPicture.asset(
        //         svgPath!,
        //         color: const Color(0xff1F3996),
        //         height: 40.h,
        //         //width: 40.w,
        //       ),

        //       8.ph,
        //       SizedBox(
        //         width: 120.w,
        //         child: Text(
        //           headingText!,
        //           maxLines: 2,
        //           overflow: TextOverflow.ellipsis,
        //           textAlign: TextAlign.center,
        //           style: GoogleFonts.roboto(
        //               color: const Color(0xff1F3996),
        //               fontWeight: FontWeight.bold,
        //               fontSize: 14.sp),
        //         ),
        //       ),
        //       // 4.ph,
        //       // AutoSizeText(
        //       //   subHeadingText!,
        //       //   maxLines: 3,
        //       //   textAlign: TextAlign.center,
        //       //   overflow: TextOverflow.ellipsis,
        //       //   style: GoogleFonts.roboto(
        //       //       color: Color(0xff8DAEAE),
        //       //       fontWeight: FontWeight.w400,
        //       //       fontSize: 10.sp),
        //       // )
        //     ],
        //   ),
        // ),

        );
  }
}
